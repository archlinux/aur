# Maintainer: Christopher Cooper <cooperc@users.noreply.github.com>
pkgname=marklite
pkgver=0.3.0
pkgrel=1
pkgdesc='A lightweight Markdown viewer and editor for Linux'
arch=('x86_64')
url='https://gitlab.com/mchilson/marklite'
license=('MIT')
depends=('gtk3')
makedepends=('flutter' 'clang' 'cmake' 'ninja' 'pkgconf')
_commit=b43e62aa36c78c0050f60bfbdf4862db72142f0a
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/mchilson/marklite/-/archive/${_commit}/marklite-${_commit}.tar.gz"
        'marklite.desktop')
sha256sums=('3535a6c3f4db7260cf27930fd2460216014b8732036fd534872b0ad00acf4f38'
            'SKIP')

build() {
    cd "marklite-${_commit}"
    export PUB_CACHE="${srcdir}/.pub-cache"
    flutter build linux --release
}

package() {
    cd "marklite-${_commit}"

    # Install bundle to /usr/share
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -a build/linux/x64/release/bundle/. "${pkgdir}/usr/share/${pkgname}/"

    # Launcher symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Desktop file
    install -Dm644 "${srcdir}/marklite.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon
    install -Dm644 linux/icons/marklite-logo-128x128.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
