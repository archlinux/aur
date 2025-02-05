# Maintainer: Kevin Schoon <me@kevinschoon.com>
pkgname=lorry
pkgver=2.0.1
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Lorry Mirroring Tool"
arch=("x86_64")
license=("Apache-2.0")
url="https://lorry.software"
depends=(
	"git"
	"git-lfs"
)
makedepends=(
	"rust"
	"cargo"
	"sqlite"
)
provides=("lorry")
optdepends=()
source=(
	"https://gitlab.com/CodethinkLabs/lorry/lorry2/-/archive/v$_pkgver/lorry2-v$_pkgver.tar.gz"
)

sha256sums=('249a26aed02e8c76cf01e1bb1a3550c652f094cf328a49addd6e66708143c392')

build() {
	cd "lorry2-v$_pkgver" || exit 1
	# https://github.com/launchbadge/sqlx/issues/3149
	export CFLAGS=" -ffat-lto-objects"
	scripts/init_db_if_missing.sh
	cargo build --release
}

package() {
	cd "lorry2-v$_pkgver" || exit 1
	install -Dm755 "target/release/lorry" "$pkgdir/usr/bin/lorry"
	install -Dm644 "lorry.example.toml" "$pkgdir/etc/lorry/lorry.example.toml"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/lorry/LICENCE"
}
