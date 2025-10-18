# Maintainer: wommel <aur at impium dot de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=easyepg-lite-git
pkgver=r149.6756605
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
	f6c94c77140100bff307e6197cb7b564be663e88d56ce956da5001f5c47dc35827c63ace9ce4a61e44a798cff41e378fe79a2a79ee98f9ee1f00cf96076dac0b # easyepg-lite-git.service
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
