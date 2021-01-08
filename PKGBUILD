# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon
pkgname=nicotine-plus-git
pkgver=2.3.0.dev1.r4051.e99823dc
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="https://nicotine-plus.github.io/nicotine-plus"
license=('GPL3')
depends=('python-gobject' 'gtk3')
makedepends=('git')
optdepends=('gspell: for spell checking in chat'
            'libappindicator-gtk3: for tray icon')
checkdepends=('python-pytest')
provides=("${pkgname%-git}" 'nicotine+' 'nicotine')
conflicts=("${pkgname%-git}" 'nicotine+' 'nicotine')
source=('git+https://github.com/Nicotine-Plus/nicotine-plus.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s.r%s.%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | \
		sed 's/-/./')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

check() {
	cd "$srcdir/${pkgname%-git}"

	# Basic sanity check
	./nicotine --version | grep Nicotine+

	# Perform local in-tree unit tests
	pytest test/unit
}

package() {
	cd "$srcdir/${pkgname%-git}"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
