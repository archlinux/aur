# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=ydotool
pkgver=0.2.0
pkgrel=1
pkgdesc="Generic command-line automation tool (no X!)"
arch=('x86_64')
depends=('libevdevplus' 'libuinputplus' 'boost-libs')
makedepends=('cmake' 'ninja' 'boost')
url="https://github.com/ReimuNotMoe/ydotool"
license=('MIT')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('2311b003d2ff383f3348f17101f0df74f56616d530d66d0a014a52ba85a5dcf1')

build() {
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCXXOPTS_ENABLE_INSTALL=OFF \
    -G Ninja \
    -S "$pkgname-$pkgver" -B build
  ninja -C build

  scdoc < "$pkgname-$pkgver"/manpage/ydotool.1.scd  > "build/ydotool.1"
  scdoc < "$pkgname-$pkgver"/manpage/ydotoold.8.scd > "build/ydotoold.8"
}

package() {
  #TODO: install is broken upstream
  # DESTDIR="$pkgdir" ninja -C build install

  install -Dm755 build/ydotool "$pkgdir/usr/bin/ydotool"
  install -Dm755 build/ydotoold "$pkgdir/usr/bin/ydotoold"

  install -Dm644 build/ydotool.1  "$pkgdir/usr/share/man/man1/ydotool.1"
  install -Dm644 build/ydotoold.8 "$pkgdir/usr/share/man/man8/ydotoold.8"

  install -Dm644 "$pkgname-$pkgver"/Daemon/ydotool.service "$pkgdir/usr/lib/systemd/user/ydotool.service"
}
