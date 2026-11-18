# Maintainer: osch <oliver@luced.de>
pkgname=blitzview-git
pkgver=0.0.0.r3.g37a28d3
pkgrel=1
pkgdesc="Fast Qt6 media browser for images and videos with grid/table view, thumbnails and metadata tags"
arch=('x86_64' 'aarch64')
url="https://github.com/blitzview-org/blitzview"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-multimedia' 'qt6-multimedia-ffmpeg' 'ffmpeg' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'ninja' 'pkgconf')
optdepends=('perl-image-exiftool: capture time and user tags (metadata features)'
            'kimageformats: additional image format plugins (XCF, PSD, TGA, ...)')
provides=('blitzview')
conflicts=('blitzview')
source=("$pkgname::git+https://github.com/blitzview-org/blitzview.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # v0.0.0-3-g37a28d3 -> 0.0.0.r3.g37a28d3
    git describe --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S "$pkgname" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
