pkgname=ayllu
pkgver=0.3.1
pkgrel=1
pkgdesc="Ayllu Forge"
arch=("x86_64")
license=("AGPL3")
url="https://ayllu-forge.org/projects/ayllu"
depends=(
	"git"
)
makedepends=(
	"rust"
	"sqlx-cli"
	"sassc"
	"npm"
	"capnproto"
)
provides=("ayllu")
optdepends=()
source=(
	"$pkgname-$pkgver::https://ayllu-forge.org/projects/ayllu/refs/archive/$pkgver.tar.gz"
)

sha256sums=("577fdeb4d2cce05ad5963733d56d75aaef84a473d6320088bb649161c111d163")

build() {
	cd "$pkgname-$pkgver"
	[[ -f db/state.db ]] && rm db/state.db
	scripts/init_db_if_missing.sh
	cargo build --release

	npm install
	scripts/compile_stylesheets.sh
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/ayllu" $pkgdir/usr/bin/ayllu
	install -Dm644 "LICENSE" $pkgdir/usr/share/licenses/ayllu
	install -Dm644 "config.example.toml" $pkgdir/etc/ayllu/config.example.toml
	install -Dm644 "contrib/systemd/system/ayllu.service" $pkgdir/usr/lib/systemd/system/ayllu.service
	install -Dm644 "contrib/systemd/user/ayllu.service" $pkgdir/usr/lib/systemd/user/ayllu.service
	install -Dm755 "contrib/hooks/post-commit" $pkgdir/usr/share/ayllu/hooks/post-commit
	install -Dm755 "contrib/hooks/post-receive" $pkgdir/usr/share/ayllu/hooks/post-receive

	install -Dm644 "themes/default/main.min.css" $pkgdir/usr/share/ayllu/themes/default/main.min.css
	find themes/default/templates -name '*.html' -exec install -Dm644 {} $pkgdir/usr/share/ayllu/{} \;
	find themes/default/assets -type f -exec install -Dm644 {} $pkgdir/usr/share/ayllu/{} \;

	install -Dm644 "themes/tokyonight/main.min.css" $pkgdir/usr/share/ayllu/themes/tokyonight/main.min.css
	find themes/tokyonight/templates -name '*.html' -exec install -Dm644 {} $pkgdir/usr/share/ayllu/{} \;

	install -Dm644 "themes/adwaita/main.min.css" $pkgdir/usr/share/ayllu/themes/adwaita/main.min.css
	find themes/adwaita/templates -name '*.html' -exec install -Dm644 {} $pkgdir/usr/share/ayllu/{} \;
}
