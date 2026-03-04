# Maintainer: wommel <aur at impium dot de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=easyepg-lite-git
pkgver=r173.7016b30
pkgrel=1
pkgdesc="XMLTV grabber tool using Gracenote's TMS API"
url="https://github.com/sunsettrack4/script.service.easyepg-lite"
depends=(
	python-beautifulsoup4
	python-bottle
	python-requests
	python-xmltodict
	licenses
)
makedepends=(git)
arch=('any')
license=('GPL3')
source=(
	"$pkgname::git+https://github.com/sunsettrack4/script.service.easyepg-lite.git"
	"$pkgname.service"
	startup.sh
)
sha512sums=(
	SKIP
	ff1408c656661db4b6139505f26e9fb80f13ff1eeff790d5b6e2e13f158182088748f1c0380d22d5d4d9cbba1429669b2e47cb64de88ee8e0c49495e19d319f8 # easyepg-lite-git.service
	50d1cf2531e375766666f2f7950fdd9e0c18ed213ab4a8e3486f3922b0c33997e21f67b074dfd39603bcf6585df85754e84a199544427b840c4723d9fc7f8ba3 # startup.sh
)

pkgver() {
	cd "$srcdir/$pkgname" || exit
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	cp -r "$srcdir/$pkgname/"{main.py,resources} "$pkgdir/usr/lib/$pkgname"
	install -Dm0755 "$srcdir/startup.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

	ln -sf "/var/lib/$pkgname/channels.db" "$pkgdir/usr/lib/$pkgname/resources/data/db/"
}
