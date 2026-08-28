# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=marklite
pkgver=1.1.1
pkgrel=1
pkgdesc='A lightweight Markdown viewer and editor for Linux'
arch=('x86_64')
url='https://gitlab.com/mchilson/marklite'
license=('MIT')
depends=('gtk3')
makedepends=('flutter' 'clang' 'cmake' 'ninja' 'pkgconf')
# There are no specific tags or source tarballs for releases.
# The commit is determined by manually inspecting the git history.
_commit=ac5ffd9a2915999be34e7853c02f79383121eae0
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/mchilson/marklite/-/archive/${_commit}/marklite-${_commit}.tar.gz"
        'marklite.desktop')
b2sums=('7bbbc99b740717264e475968a3e6363c729aae02f3f9d7c2d08d284b75fe0cc7e939d17b0e4a6043f247e6550ceafea1207b9ded186e8bf0879bd0181c90a012'
        '55f9fe3888754e9408fe23ce088cf7237112ea22b7234e60ac6c61ccee773c19fb14da7465a45562bf23cb326d514f9b2251cd601211dba87160b75fb00ce7b9')

build() {
    cd "marklite-${_commit}"
    export PUB_CACHE="${srcdir}/.pub-cache"
    flutter build linux --release
}

package() {
    cd "marklite-${_commit}"

    # Install bundle
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -a build/linux/x64/release/bundle/. "${pkgdir}/usr/lib/${pkgname}/"
    find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 {} +
    find "${pkgdir}/usr/lib/${pkgname}" -type f -exec chmod 644 {} +
    chmod 755 "${pkgdir}/usr/lib/${pkgname}/${pkgname}"

    # Launcher symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Desktop file
    install -Dm644 "${srcdir}/marklite.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icons
    for size in 16 32 64 128 256; do
        install -Dm644 "linux/icons/marklite-logo-${size}x${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
