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
conflicts=('electrs')
provides=('electrs')
source=("git+$url.git"
	"electrs.service"
	01-rocksdb.patch)
sha256sums=('SKIP'
            'd1b25c98fdb497a97a78c52e33b3523002849d2a6140c99bcce5cb68afc48dd6'
            '4e0b084892cdd9467d84920c3cc8632ddab1f94fe628b70ff99727d1e00082a3')
validpgpkeys=('15C8C3574AE4F1E25F3F35C587CAE5FA46917CBB')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build  --release
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
