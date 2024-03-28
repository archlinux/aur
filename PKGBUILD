# Maintainer: kojq <kojq@mailfence.com>

pkgname=gensoquote-git
_pkgname=gensoquote
pkgver=0.3.0.r0.ga9c9646
pkgrel=1
pkgdesc='Like fortune, but in Gensokyo and memory safe™'
url=https://github.com/dmyTRUEk/gensoquote
source=('git+https://github.com/dmyTRUEk/gensoquote')
arch=('aarch64' 'arm' 'armv5' 'armv6h' 'armv7h' 'i686' 'pentium4' 'riscv64' 'x86_64')
license=('MIT')
makedepends=('cargo')
depends=('git')
conflicts=('gensoquote' 'gensoquote-bin')
provides=('gensoquote')
sha256sums=('SKIP')

prepare() {
  cd $_pkgname

  cargo fetch --locked --target $(rustc -vV | sed -n 's|host: ||p')
}

build () {
  cd $srcdir/$_pkgname

  [[ $CARCH != x86_64 ]] && export CARGO_PROFILE_RELEASE_LTO=off

  CARGO_INCREMENTAL=0 GENSOQUOTE_VERSION=$pkgver cargo build --frozen --release --target-dir target
}

package() {
  cd $srcdir/$_pkgname

  install -Dm755 -t ${pkgdir}/usr/bin target/release/gensoquote
}

pkgver() {
  cd $srcdir/$_pkgname

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
