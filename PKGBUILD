# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=nautilus-subliminal-git
pkgver=r14.4648e2e
pkgrel=2
pkgdesc="Subliminal integration within Nautilus file manager"
arch=('any')
url="https://github.com/Diaoul/nautilus-subliminal"
license=('MIT')
depends=('subliminal' 'python-nautilus')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Diaoul/nautilus-subliminal.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

	_installdir="$pkgdir/usr/share/nautilus-python/extensions"

	cd "$srcdir/${pkgname%-git}"
	install -Dm644 "${pkgname%-git}.py" -t "$_installdir"
	install -d "$_installdir/subliminal"
	cp -a ui "$_installdir/subliminal"
	for filepath in i18n/*.po; do
		filename=$(basename "$filepath")
		install -d "$_installdir/subliminal/locale/${filename##*.}/LC_MESSAGES"
		msgfmt ${filepath} -o "$_installdir/subliminal/locale/${filename##*.}/LC_MESSAGES/subliminal.mo"
	done
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
