# Maintainer: Marco Huenseler <marco@wuthoehle.de>

pkgname=bootupd-git
_pkgname=bootupd
pkgver=0.2.29.r6.gf0fcca8
pkgrel=1
pkgdesc="Bootloader updater"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/coreos/bootupd"
license=('Apache-2.0')
depends=(gcc-libs
  glibc
  efibootmgr)
makedepends=(cargo
  git)
provides=("bootupd=$pkgver")
conflicts=('bootupd')
source=("git+$url.git"
  "0001-arch-path.patch")
sha256sums=('SKIP'
  '34aa0422fac4e2eb21572fdc8da068cb160dcb7a5290d5333feca00ada36de1e')

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "${srcdir}/0001-arch-path.patch"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 --match="v*" HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-grub-static
  make DESTDIR="$pkgdir" install-systemd-unit
}
