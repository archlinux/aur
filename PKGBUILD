# Maintainer: VerruckteFuchs <derverrucktefuchs@gmail.com>

pkgname=boinctui-git
_gitname=boinctui
pkgver=r197.0e36e65
pkgrel=1
pkgdesc="Curses based fullscreen BOINC manager with support for terminal transparency"
arch=(i686 x86_64)
url="https://github.com/DerVerruckteFuchs/boinctui"
license=('GPLv3')
depends=('expat' 'gcc-libs' 'openssl' 'cmake')
provides=('boinctui')
conflicts=('boinctui')
source=(git+"https://github.com/DerVerruckteFuchs/boinctui.git")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	autoconf
	./configure --without-gnutls
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$_gitname"
	
	install -m755 -d "$pkgdir/usr/bin"
	install -m755 -t "$pkgdir/usr/bin" boinctui

	# install changelog
	install -D -m644 changelog "$pkgdir/usr/share/doc/boinctui/changelog"

	# install manpage
	#rm debian/boinctui.1.gz
	gzip -f debian/boinctui.1
	install -D -m644 "debian/boinctui.1.gz" "$pkgdir/usr/share/man/man1/boinctui.1.gz"
}
