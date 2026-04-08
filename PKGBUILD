pkgname=dmemcg-booster
pkgver=0.1.2
pkgrel=1
pkgdesc="Service for enabling and controlling dmem cgroup limits for boosting foreground games"
arch=('x86_64')
url="https://gitlab.steamos.cloud/holo/dmemcg-booster"
license=('custom:unknown')
depends=(
	"glibc"
	"libdrm"
	"systemd-libs"
)
makedepends=(
	"cargo"
	"git"
)
source=("$pkgname::git+https://gitlab.steamos.cloud/holo/dmemcg-booster.git#tag=${pkgver}")
sha256sums=('b78e5823023d26c70f3e001af90f1694f7f933298ae36805660195767bb9acd4')

install=dmemcg-booster.install

prepare() {
	cd "$srcdir/$pkgname"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
        cd "$srcdir/$pkgname"
	cargo build --frozen --release
}

package() {
        cd "$srcdir/$pkgname"
	install -Dm755 target/release/dmemcg-booster "$pkgdir/usr/bin/dmemcg-booster"

	# Set up systemd services
 	install -Dm644 dmemcg-booster-system.service "$pkgdir/usr/lib/systemd/system/dmemcg-booster-system.service"
 	install -Dm644 dmemcg-booster-user.service "$pkgdir/usr/lib/systemd/user/dmemcg-booster-user.service"
}
