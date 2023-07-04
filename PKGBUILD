# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: ThatOneCalculator <kainoa@t1c.dev>
# Based on https://aur.archlinux.org/packages/misskey

pkgname=calckey-beta
_pkgname=calckey
pkgver=14.0.0rc3
pkgrel=1
pkgdesc='A fun, new way to experience social media'
url='https://calckey.org'
arch=('x86_64')
license=('AGPL3' 'MIT')
depends=('nodejs' 'npm' 'postgresql' 'redis' 'pnpm' 'zip')
makedepends=('git' 'python' 'rust')
options=('debug')
install='calckey.install'
commit=5ab80337dbfca728d71855fb5febd8cf197ae6af
optdepends=('ffmpeg: Media encode functionality'
            'nginx: Reverse-proxy')
source=("git+https://codeberg.org/calckey/calckey.git#commit=$commit"
        "${_pkgname}.install"
        "${_pkgname}.service"
        "${_pkgname}.sh"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('SKIP'
            '9c97cf0b759ed9b79deb08044b688fe480ced068981f20636f0aa12e47752290'
            '64f805ff3d8a69eb03b0ab4359147f7ef39d94691b6c1e7b0529cdb7a53985d2'
            '5847f19482a6a0c50a1619ac303ce1e46bdd9b6aef7ddbfbe73caecab09f1876'
            '51252a058e84cf3772634aa7b02199cab8ddd08fefdfc5849836403780db6470'
            'b77fdf9138080924d8d4b008b6a075f513eecfad86efd1fc139bdc5e7a49f7cd')

prepare() {
    cd "${_pkgname}"

    # Dependency handling
    git submodule update --init
    corepack enable --install-directory "${srcdir}/${_pkgname}"
    HOME="${srcdir}/${_pkgname}" pnpm install

    # Example configuration
    ## Change example configuration to reflect
    ## this packages purpose
    _example_file="${srcdir}/${_pkgname}/.config/example.yml"

    sed -i \
        's|example-calckey-user|calckey|;
        s|  pass: example-calckey-pass|# pass: calckey|;
        s|#outgoingAddressFamily: ipv4|outgoingAddressFamily: dual|' \
        ${_example_file}
}

build() {
    cd "${_pkgname}"
    corepack enable --install-directory "${srcdir}/${_pkgname}"
    NODE_ENV=production HOME="${srcdir}/${_pkgname}" pnpm run build

    # Cleanup
    find "${srcdir}/${_pkgname}" \
        -depth \
        -type d \
        \( -iname '.git' \
        -o -iname '.github' \
        -o -iname '.vscode' \
        -o -iname 'darwin-arm64' \
        -o -iname 'darwin-x64' \
        -o -iname 'win32-ia32' \
        -o -iname 'win32-x64' \
        -o -iname 'linux-arm' \
        -o -iname 'linux-arm64' \) \
        -execdir rm -rf '{}' \;
    find "${srcdir}/${_pkgname}" \
        -type f \
        \( -name '.git' \
        -o -name '.gitattributes' \
        -o -name '.gitignore' \
        -o -name '.gitmodules' \
        -o -name '.docker*' \
        -o -iname 'docker*' \
        -o -name '.editor*' \
        -o -name '.vsls.json' \
        -o -name 'darwin.js' \
        -o -name 'win32.js' \) \
        -not -name 'docker*.js' \
        -delete
    rm -r "${srcdir}/${_pkgname}/cypress"
    rm -r "${srcdir}/${_pkgname}/.cache"
    rm -rf "${srcdir}/${_pkgname}/.npm"
    rm -rf "${srcdir}/${_pkgname}/.local"
    rm -r "${srcdir}/${_pkgname}/scripts"
    rm -rf "${srcdir}/${_pkgname}/.cargo"
}


package() {
    # systemd files
    install -Dm644 ${_pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ${_pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 ${_pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    install -dm755 "${pkgdir}/usr/share/webapps"
    mv "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/webapps/"

    # config setup
    install -dm755 "${pkgdir}/etc/webapps/${_pkgname}"
    mv "${pkgdir}/usr/share/webapps/${_pkgname}/.config/example.yml" -t \
        "${pkgdir}/etc/webapps/${_pkgname}/"
    rm -r "${pkgdir}/usr/share/webapps/${_pkgname}/.config"
    ln -s "/etc/webapps/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/.config"

    # cache setup
    ln -s "/var/cache/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/.cache"

    # pnpm, npm setup
    ln -s "/var/lib/${_pkgname}/pnpm" "${pkgdir}/usr/share/webapps/${_pkgname}/.pnpm"
    ln -s "/var/lib/${_pkgname}/npm" "${pkgdir}/usr/share/webapps/${_pkgname}/.npm"

    # files (upload, …)
    ln -s "/var/lib/${_pkgname}/files" "${pkgdir}/usr/share/webapps/${_pkgname}/files"

    # calckey helper script
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # license
    install -Dm644 "${pkgdir}/usr/share/webapps/${_pkgname}/COPYING" \
        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
