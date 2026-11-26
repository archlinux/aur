# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

_pkgname=kiri
pkgname=kwin-kiri
pkgver=1.1
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
sha256sums=('cf4a5b1baef29971ba38e03f1d06f29802d45853fd646db158f8f6c26597fbf7')

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
