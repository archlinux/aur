# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=ydotool
pkgver=1.0.1
pkgrel=2
pkgdesc="Generic command-line automation tool (no X!)"
arch=('x86_64' 'aarch64')
depends=()
makedepends=('cmake' 'ninja' 'scdoc')
url="https://github.com/ReimuNotMoe/ydotool"
license=('AGPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "80-uinput.rules")
sha256sums=('02311cdc608f205711b06a95e5fd71093b2294f4920efc526f5e98a2ddab42b8'
            'e092f5e7e474aec6c980c458046d0ff11b18750b53de2bf0a0aba1ca26e6d58e')
install=ydotool.install

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man \
    -DCMAKE_BUILD_TYPE=Release \
    -G Ninja \
    -S "$pkgname-$pkgver" -B build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 80-uinput.rules "$pkgdir/etc/udev/rules.d/80-uinput.rules"
}
