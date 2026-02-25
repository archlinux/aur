# Maintainer: koh11235813 <koh11235813@gmail.com>
# Contributor: togatoga <>
pkgname='karukan'
pkgver='0.1.0'
pkgrel=1
pkgdesc="Japanese Input Method System for Linux, Neural Kana-Kanji Conversion Engine + fcitx5 IME"
arch=('x86_64')
url="https://github.com/togatoga/karukan"
license=('MIT' 'Apache-2.0')
depends=('fcitx5' 'openssl')
makedepends=('cmake' 'extra-cmake-modules' 'rust' 'libxkbcommon')
optdepends=('fcitx5-configtool: GUI configuration tool')
provides=('karukan-im')
conflicts=('karukan-im')
source=("https://github.com/togatoga/karukan/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b7421b3f3eff24954ad89112078bdcde94a38cf522fc134ec6e2c1352add42b7')
prepare() {
    cd "$srcdir/karukan-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
    cd "$srcdir/karukan-${pkgver}/karukan-im/fcitx5-addon"
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    cd "$srcdir/karukan-${pkgver}/karukan-im/fcitx5-addon"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$srcdir/karukan-${pkgver}/LICENSE-MIT" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "$srcdir/karukan-${pkgver}/LICENSE-APACHE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
