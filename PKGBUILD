# Maintainer: aksr <aksr at t-com dot me>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=jove
pkgver=4.17.5.5
pkgrel=1
pkgdesc='An Emacs-like editor without Lisp.'
url='https://github.com/jonmacs/jove'
license=('LicenseRef-JoveCustomLicense')
arch=('i686' 'x86_64')
depends=('ncurses' 'bash')
makedepends=('pkgconf')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz" jmake.patch)
sha256sums=('4261d7cab02816eb03f3f356a0a2869d7f6168fce53478ede8e5fdd06a9ecfb9'
            '381638fcdb02d36ec311a8c3ce404257635c78854004ee4cd7b78a9a690877eb')

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 < "$srcdir"/jmake.patch
}

build() {
	cd $pkgname-$pkgver
	export CFLAGS="$CFLAGS -Wno-incompatible-pointer-types"
	./jmake.sh
}

package() {
	cd $pkgname-$pkgver
	./jmake.sh JOVEHOME=/usr DESTDIR="$pkgdir" MANDIR=/usr/share/man install
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/jove/LICENSE
	chmod o-w "$pkgdir"/var/lib/jove/preserve
}
