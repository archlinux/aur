# Maintainer: ThatOneCalculator <kainoa@t1c.dev>
# Based on https://aur.archlinux.org/packages/misskey

pkgname=calckey
pkgver=13.1.3
pkgrel=1
pkgdesc='A greatly enhanced fork of Misskey with better UI/UX, security, features, and more! (Experimental)'
url='https://calckey.cloud'
arch=('x86_64')
license=('AGPL3' 'MIT')
depends=('nodejs' 'npm' 'postgresql' 'redis' 'pnpm')
makedepends=('git' 'python')
options=('debug')
install='calckey.install'
optdepends=('elasticsearch: Search functionality'
            'ffmpeg: Media de-encode functionality'
            'nginx: Reverse-proxy usage')
_commit='998e6fd4d262691e87beb5e46218490162d24452' #tag/13.1.3
source=("git+https://codeberg.org/calckey/calckey.git#commit=${_commit}"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.sh"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('SKIP'
            '9c97cf0b759ed9b79deb08044b688fe480ced068981f20636f0aa12e47752290'
            '64f805ff3d8a69eb03b0ab4359147f7ef39d94691b6c1e7b0529cdb7a53985d2'
            '5847f19482a6a0c50a1619ac303ce1e46bdd9b6aef7ddbfbe73caecab09f1876'
            '51252a058e84cf3772634aa7b02199cab8ddd08fefdfc5849836403780db6470'
            'b77fdf9138080924d8d4b008b6a075f513eecfad86efd1fc139bdc5e7a49f7cd')

pkgver() {
    cd "${pkgname}"
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd "${pkgname}"

    # Dependency handling
    git submodule update --init
    corepack enable
    HOME="${srcdir}/${pkgname}" pnpm install

    # Example configuration
    ## Change example configuration to reflect
    ## this packages purpose
    _example_file="${srcdir}/${pkgname}/.config/example.yml"

    sed -i \
        's|example-calckey-user|calckey|;
        s|  pass: example-calckey-pass|# pass: calckey|;
        s|#outgoingAddressFamily: ipv4|outgoingAddressFamily: dual|' \
        ${_example_file}
}

build() {
    cd "${pkgname}"
    corepack enable
    NODE_ENV=production HOME="${srcdir}/${pkgname}" pnpm run build

    # Cleanup
    find "${srcdir}/${pkgname}" \
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
    find "${srcdir}/${pkgname}" \
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
    rm -r "${srcdir}/${pkgname}/cypress"
    rm -r "${srcdir}/${pkgname}/.cache"
    rm -r "${srcdir}/${pkgname}/calckey-assets"
    rm -rf "${srcdir}/${pkgname}/.npm"
    rm -r "${srcdir}/${pkgname}/scripts"
}

package() {
    # systemd files
    install -Dm644 ${pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    install -dm755 "${pkgdir}/usr/share/webapps"
    mv "${srcdir}/${pkgname}" "${pkgdir}/usr/share/webapps/"

    # config setup
    install -dm755 "${pkgdir}/etc/webapps/${pkgname}"
    mv "${pkgdir}/usr/share/webapps/${pkgname}/.config/example.yml" -t \
        "${pkgdir}/etc/webapps/${pkgname}/"
    rmdir "${pkgdir}/usr/share/webapps/${pkgname}/.config"
    ln -s "/etc/webapps/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/.config"

    # cache setup
    ln -s "/var/cache/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/.cache"

    # pnpm, npm setup
    ln -s "/var/lib/${pkgname}/pnpm" "${pkgdir}/usr/share/webapps/${pkgname}/.pnpm"
    ln -s "/var/lib/${pkgname}/npm" "${pkgdir}/usr/share/webapps/${pkgname}/.npm"

    # files (upload, …)
    ln -s "/var/lib/${pkgname}/files" "${pkgdir}/usr/share/webapps/${pkgname}/files"

    # calckey helper script
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # license
    install -Dm644 "${pkgdir}/usr/share/webapps/${pkgname}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
