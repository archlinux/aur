pkgname=dmemcg-booster
pkgver=0.1.3
pkgrel=1
pkgdesc="Service for enabling and controlling dmem cgroup limits for boosting foreground games"
arch=('x86_64')
url="https://gitlab.steamos.cloud/holo/dmemcg-booster"
license=('MIT')
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
sha256sums=('ad17a0540f905610b03f75662ef3766292b981724e76c1295eb2e8f6389b2d2a')

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
	install -Dm644 {,"$pkgdir"/usr/share/licenses/$pkgname/}LICENSE

	# Set up systemd services
 	install -Dm644 dmemcg-booster-system.service "$pkgdir/usr/lib/systemd/system/dmemcg-booster-system.service"
 	install -Dm644 dmemcg-booster-user.service "$pkgdir/usr/lib/systemd/user/dmemcg-booster-user.service"
}
