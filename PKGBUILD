# Maintainer: Popolon <popolon @ popolon.org>

_pkgname=wordpress-to-zola
pkgname=${_pkgname}-git
pkgver=r13.5b3900c
pkgrel=1
pkgdesc="Convert wordpress xml dump to zola static site generator markdown files"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/TatriX/wordpress-to-zola/"
depends=('gcc-libs')
makedepends=('cargo')
license=('Unknown')
source=("git+https://github.com/TatriX/${_pkgname}")
sha256sums=(SKIP)

pkgver() {
	cd ${srcdir}/${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${_pkgname}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd ${srcdir}/${_pkgname}
  CFLAGS+=' -ffat-lto-objects'
  cargo build --frozen --release
}

check() {
  cd ${srcdir}/${_pkgname}
  cargo test --frozen
}

package() {
  cd ${srcdir}/${_pkgname}
  local _target="target/release/$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" $_target
}
