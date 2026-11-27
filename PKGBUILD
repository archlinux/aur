# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

_pkgname=kiri
pkgname=kwin-kiri
pkgver=1.2
pkgrel=1
pkgdesc='Scrollable tiling KWin script in the style of niri (Karousel fork)'
arch=(x86_64 i686 aarch64 armv7h)
url='https://github.com/SeniorMatt/kiri'
license=('GPL-3.0-or-later')

depends=('libepoxy' 'kwin' 'plasma-workspace' 'qt6-declarative')
optdepends=('python: niri2kiri script')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'vulkan-headers')

_pkgver="${pkgver/./_}"
source=("$_pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3dc15ce8fe5a0f48250bb08f63ab5d5bc25925864c1e7db3e5d93bb0f3b7c3c')

build() {
    cmake -S "$srcdir/${_pkgname}_${_pkgver}/effect-cpp" \
          -B "$srcdir/$pkgname-$pkgver-effect" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=None
    cmake --build "$srcdir/$pkgname-$pkgver-effect"
}

package() {
    cd "${_pkgname}_${_pkgver}"

    install -D -o root -m 755 -d "$pkgdir/usr/share/kwin/scripts"
    cp -r package "$pkgdir/usr/share/kwin/scripts/kiri"

    DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver-effect"

    install -D -o root -m 755 -t "$pkgdir/usr/bin" kiri-mode
    install -D -o root -m 755 niri2kiri.py "$pkgdir/usr/bin/niri2kiri"
}
