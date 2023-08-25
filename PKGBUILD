# Maintainer: Riedler <dev@riedler.wien>
# Maintainer: Mckol <mckol363@gmail.com>
# Contributor: nachtjasmin <nachtjasmin@posteo.de>

_pkgname=url-eater
pkgname=${_pkgname}-git
pkgver=r14.605b5f5
pkgrel=1
pkgdesc='Clean unnecessary parameters from URLs copied to clipboard'
provides=('url-eater')
conflicts=('url-eater' 'url-eater-bin')
arch=('any')
url='https://github.com/AgathaSorceress/url-eater'
license=('custom: NVL')
depends=('systemd')
makedepends=('cargo' 'git')
source=(
	"${_pkgname}::git+https://github.com/AgathaSorceress/url-eater.git"
	"default.kdl"
	"url-eater.service"
)
sha256sums=('SKIP'
            '75447aca73e8a097f89d4d4d5342416df129327e5b4f22d3406a03de5bbeade6'
            '621bc550a91f6ef3ac5f77730c9ea9914b597d259a732296974a198e2e24e629')
backup=('etc/url-eater.kdl')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$_pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$_pkgname"
	cargo build --frozen --release --all-features --bin="$_pkgname"
}

package() {
	install -Dm644 default.kdl "$pkgdir/etc/url-eater.kdl"
	install -Dm644 default.kdl "$pkgdir/usr/share/url-eater/default.kdl"
	install -Dm644 url-eater.service "$pkgdir/usr/lib/systemd/user/url-eater.service"
	cd "$_pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm755 ./target/release/$_pkgname "$pkgdir/usr/bin/url-eater"
}
