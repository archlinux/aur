# Maintainer: David Flemström <david.flemstrom@gmail.com>
pkgname=record-query-git
pkgver=v0.10.4.r50.gd84d4d8
pkgrel=1
epoch=
pkgdesc="A tool for doing record analysis and transformation"
arch=('i686' 'x86_64')
url=""
license=('Apache-2.0')
groups=()
depends=()
makedepends=(wget rust)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/dflemstr/rq.git)
noextract=()
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  TARGET=x86_64-unknown-linux-gnu
  wget "https://s3-eu-west-1.amazonaws.com/record-query/v8/$TARGET/5.7.441.1/v8-build.tar.gz"
  tar xvf v8-build.tar.gz
  export V8_LIBS=$PWD/v8-build/lib/libv8uber.a
  export V8_SOURCE=$PWD/v8-build
  cargo build --release
}

check() {
  cd "$srcdir/$pkgname"
  cargo test
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  install -m755 target/release/rq -t "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
