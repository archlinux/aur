pkgname=mock-core-configs
pkgver=40.1
_rpmrel=1
_pkgtag=$pkgname-$pkgver-$_rpmrel
pkgrel=$_rpmrel.1
pkgdesc="Mock core config files basic chroots"
url="https://github.com/rpm-software-management/mock"
arch=('any')
license=('GPL-2.0-or-later')
depends=('distribution-gpg-keys>=1.98')
backup=('etc/mock/default.cfg')
source=("$url/archive/$_pkgtag.tar.gz")
sha256sums=('aabb80e601c3fdedb8089e59056852175e2dbf03e1a57ad0bd7764e795fccbaa')

# Uncomment to not package configs for EOLed versions of distributions
#_without_eol=1

prepare() {
	mv "mock-$_pkgtag" "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"

	pushd "$pkgname" >/dev/null

	mkdir -p "$pkgdir/"etc/mock
	install -Dp -m644 etc/mock/*.cfg "$pkgdir/"etc/mock/
	install -Dp -m644 etc/mock/fedora-rawhide-"$CARCH".cfg "$pkgdir/"etc/mock/default.cfg
	rm "$pkgdir/"etc/mock/site-defaults.cfg

	mkdir -p "$pkgdir/"etc/mock/templates
	install -Dp -m644 etc/mock/templates/*.tpl "$pkgdir/"etc/mock/templates/

	if ((!_without_eol)); then
		mkdir -p "$pkgdir/"etc/mock/eol
		install -Dp -m644 etc/mock/eol/*.cfg "$pkgdir/"etc/mock/eol/

		mkdir -p "$pkgdir/"etc/mock/eol/templates
		install -Dp -m644 etc/mock/eol/templates/*.tpl "$pkgdir/"etc/mock/eol/templates/
	fi

	install -Dp -m644 README "$pkgdir/usr/share/doc/$pkgname/README"

	popd >/dev/null
}

# vim: set ft=sh ts=4 sw=4 noet:
