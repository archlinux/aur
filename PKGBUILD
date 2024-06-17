# Maintainer: a821
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Marcin Kulik <m@kulik.com>

pkgname=asciinema-git
pkgver=3.0.0rc.2.r25.g530b947
pkgrel=1
pkgdesc="Record and share your terminal sessions"
arch=('x86_64')
url="https://github.com/asciinema/asciinema"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/-([0-9]+)-g(.+)/.r\1.g\2/;s/-//g'
}

prepare() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 $pkgname/target/release/asciinema -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
