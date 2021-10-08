# Maintainer: maxilocal at protonmail dot com

_pkgname=electrs
pkgname=${_pkgname}-git
pkgver=v0.9.0.r27.gfbda004
pkgrel=1
pkgdesc="An efficient re-implementation of Electrum Server in Rust"
arch=(x86_64)
url="https://github.com/romanz/electrs"
license=('MIT')
depends=('rocksdb')
makedepends=('git' 'clang' 'cmake' 'rust')
source=("git+$url.git"
	"electrs.service")
conflicts=('electrs')
provides=('electrs')
sha256sums=('SKIP'
            '339c165f2a0318ca0d0099cc79e493f0451dcdb37de7d1c35473db18bd9038c6')
validpgpkeys=('15C8C3574AE4F1E25F3F35C587CAE5FA46917CBB')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  ROCKSDB_INCLUDE_DIR=/usr/include ROCKSDB_LIB_DIR=/usr/lib cargo build  --release --locked --no-default-features
}

check() {
  cd "$_pkgname"
  cargo test --release --locked
}

package() {
  install -Dm644 electrs.service -t "${pkgdir}/usr/lib/systemd/system"
  cd "$_pkgname"
  install -Dm755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
