pkgname=mock-core-configs
pkgver=38.6
_rpmrel=1
_pkgtag=$pkgname-$pkgver-$_rpmrel
pkgrel=$_rpmrel.1
pkgdesc="Mock core config files basic chroots"
url="https://github.com/rpm-software-management/mock"
arch=('any')
license=('GPL2')
depends=('distribution-gpg-keys>=1.85')
backup=('etc/mock/default.cfg')
source=("$url/archive/$_pkgtag.tar.gz")
sha256sums=('9b22f8456b56f40b2ebb86726bccbe8221121b442bde0a5832b41b82f3fc1c68')

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

	popd >/dev/null
}

# vim: set ft=sh ts=4 sw=4 noet:
