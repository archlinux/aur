# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=marklite
pkgver=1.0.1
pkgrel=1
pkgdesc='A lightweight Markdown viewer and editor for Linux'
arch=('x86_64')
url='https://gitlab.com/mchilson/marklite'
license=('MIT')
depends=('gtk3')
makedepends=('flutter' 'clang' 'cmake' 'ninja' 'pkgconf')
_commit=f03972b139a61f0149fc4cdbb37eb940a0372407
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/mchilson/marklite/-/archive/${_commit}/marklite-${_commit}.tar.gz"
        'marklite.desktop')
b2sums=('d2b7bd0c423b18d5e2bfd02408ef5f34219a052365a270f665fbdaad993aff32489f0807bae17c03b34354554eac19739891d1e7a0f54c2cfd91924b8e285823'
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
