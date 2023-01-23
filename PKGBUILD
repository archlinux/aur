# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=wayvnc-git
pkgver=0.6.0
pkgrel=1
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64 i686 aarch64 armv7h)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(
  glibc
  aml
  libglvnd
  libdrm
  neatvnc-git
  libpixman-1.so
  libxkbcommon.so
  wayland
)
makedepends=(
  git
  meson
  ninja
  pam
  scdoc
)
source=("git+$url")
sha512sums=('SKIP')
conflicts=(wayvnc)
provides=(wayvnc=${pkgver%+*})

pkgver() {
  git -C wayvnc describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  arch-meson wayvnc build # --prefix /usr
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 wayvnc/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
