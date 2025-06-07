# Maintainer: Reim-developer <contact.kaxtr@gmail.com>
pkgname=zclipboard
pkgver=1.6.0
pkgrel=1
pkgdesc="A modern, fast clipboard manager"
arch=('x86_64')
url="https://github.com/reim-developer/zclipboard "
license=('GPL-3.0')
depends=('qt6-base' 'libnotify')
makedepends=('cmake' 'make' 'clang')
source=("https://github.com/Reim-developer/zClipboard/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
release_flags="-DCMAKE_BUILD_TYPE=Release"
opt_flags="-O3 -march=native -flto -funroll-loops -fomit-frame-pointer -fstrict-aliasing -ftree-vectorize -fvisibility=hidden"
nproc=$(nproc)

build() {
  cd "$srcdir/zClipboard-$pkgver" || exit 

  mkdir -p build && cd build || exit
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_CXX_FLAGS="$opt_flags" \
        "$release_flags" \
        ..

  make -j "$nproc"
}

package() {
  cd "$srcdir/zClipboard-$pkgver/build" || exit 

  make DESTDIR="$pkgdir/" install

  install -Dm644  ../../../zclipboard.desktop "$pkgdir/usr/share/applications/zclipboard.desktop"
  install -Dm644 ../../../icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/icon.png"
}
