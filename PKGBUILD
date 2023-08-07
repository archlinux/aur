# Maintainer: ThatOneCalculator <kainoa@t1c.dev>
# Co-Matainer: Bjoern Franke <bjo+aur@schafweide.org>
# Based on https://aur.archlinux.org/packages/misskey

pkgname=firefish
pkgver=1.0.3
pkgrel=4
epoch=1
pkgdesc='A fun, new way to experience social media'
url='https://joinfirefish.org'
arch=('x86_64')
license=('AGPL3' 'MIT')
depends=('nodejs' 'npm' 'postgresql' 'redis' 'pnpm' 'zip')
makedepends=('git' 'python' 'cargo')
provides=('calckey')
#options=('debug')
install='firefish.install'
optdepends=('ffmpeg: Media encode functionality'
            'nginx: Reverse-proxy')
source=("git+https://git.joinfirefish.org/firefish/firefish.git#tag=v$pkgver"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.sh"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('SKIP'
            'd4e628de3827de4f3bca7924b22c20a6f1185062d4c8a697231b11d0f3b6cf1f'
            '95989ea41e7b6d4c3eac2244c23015da3e205352d19844404efc5eef801cdfb0'
            'e7a5c682f1f3ef1d21cd573ad520ee69664aa98afbb1427ae2b6f8cdb2a73928'
            'e81d9fca78fdff08b86302b56b060f8c8a5b4c8499d48a7b374c45509a7e1ffe'
            '676187c3c4cba5e574fa7e9ed782c22c235ee13f7282ad2a9f792272bd1bce41')

prepare() {
    cd "${pkgname}"

    # Dependency handling
    git submodule update --init
    corepack enable --install-directory "${srcdir}/${pkgname}"
    HOME="${srcdir}/${pkgname}" pnpm install

    # Example configuration
    ## Change example configuration to reflect
    ## this packages purpose
    _example_file="${srcdir}/${pkgname}/.config/example.yml"

    sed -i \
        's|example-firefish-user|firefish|;
        s|  pass: example-firefish-pass|# pass: firefish|;
        s|#outgoingAddressFamily: ipv4|outgoingAddressFamily: dual|' \
        ${_example_file}
}

build() {
    cd "${pkgname}"
    corepack enable --install-directory "${srcdir}/${pkgname}"
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
    rm -rf "${srcdir}/${pkgname}/.npm"
    rm -rf "${srcdir}/${pkgname}/.local"
    rm -r "${srcdir}/${pkgname}/scripts"
    rm -rf "${srcdir}/${_pkgname}/.cargo"
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
    rm -r "${pkgdir}/usr/share/webapps/${pkgname}/.config"
    ln -s "/etc/webapps/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/.config"

    # cache setup
    ln -s "/var/cache/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/.cache"

    # pnpm, npm setup
    ln -s "/var/lib/${pkgname}/pnpm" "${pkgdir}/usr/share/webapps/${pkgname}/.pnpm"
    ln -s "/var/lib/${pkgname}/npm" "${pkgdir}/usr/share/webapps/${pkgname}/.npm"

    # files (upload, …)
    ln -s "/var/lib/${pkgname}/files" "${pkgdir}/usr/share/webapps/${pkgname}/files"

    # firefish helper script
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # license
    install -Dm644 "${pkgdir}/usr/share/webapps/${pkgname}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
