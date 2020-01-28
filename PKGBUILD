# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nemo-subliminal-git
pkgver=r15.a8dcd74
pkgrel=1
pkgdesc="Subliminal integration within Nemo file manager"
arch=('any')
url="https://github.com/Diaoul/nautilus-subliminal/tree/nemo"
license=('MIT')
depends=('subliminal' 'nemo-python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Diaoul/nautilus-subliminal.git#branch=nemo')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/nautilus-subliminal"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

	_installdir="$pkgdir/usr/share/nemo-python/extensions"

	cd "$srcdir/nautilus-subliminal"
	install -Dm755 "nautilus-subliminal.py" "$_installdir/${pkgname%-git}.py"
	install -d "$_installdir/subliminal"
	cp -r ui "$_installdir/subliminal"
	for filepath in i18n/*.po; do
		filename=$(basename "$filepath")
		install -d "$_installdir/subliminal/locale/${filename##*.}/LC_MESSAGES"
		msgfmt ${filepath} -o \
			"$_installdir/subliminal/locale/${filename##*.}/LC_MESSAGES/subliminal.mo"
	done
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
