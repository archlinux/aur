# Maintainer: Riedler <dev@riedler.wien>
# Maintainer: Mckol <mckol363@gmail.com>

_pkgname=url-eater
pkgname=${_pkgname}-git
pkgver=r3.089835f
pkgrel=1
pkgdesc='Clean unnecessary parameters from URLs copied to clipboard'
provides=('url-eater')
conflicts=('url-eater' 'url-eater-bin')
arch=('any')
url='https://github.com/AgathaSorceress/url-eater'
license=() #TODO: check if NVL (nonviolent license) is a thing arch knows about
depends=('systemd')
makedepends=('cargo')
source=(
	"${_pkgname}::git+https://github.com/AgathaSorceress/url-eater.git"
	"default.kdl::https://thermalpaste.technogothic.net/Eh00rL.kdl"
	"url-eater.service"
)
sha256sums=(
	'SKIP'
	'e86c33eb0ef751bfd342734ae2fbf6a15d974948a4f6bd3f45d851da1f5a7fbd'
	'7eb0a4c37f76caad7554c2da76f78d56f25a9f883e3d03d4b1561e7977bdb5f5'
)
backup=('etc/url-eater.kdl')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	cargo update
}

build() {
	cd "$_pkgname"
	cargo build --release --bin="url-eater"
}

package() {
	install -Dm644 default.kdl "$pkgdir/etc/url-eater.kdl"
	install -Dm644 default.kdl "$pkgdir/usr/share/url-eater/default.kdl"
	install -Dm644 url-eater.service "$pkgdir/usr/lib/systemd/user/url-eater.service"
	cd "$_pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm755 ./target/release/url-eater "$pkgdir/usr/bin/url-eater"
}
