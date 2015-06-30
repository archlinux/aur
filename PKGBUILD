# Maintainer: Pierre Neidhardt <ambrevar at gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_pkgname=gnuplot
pkgname=${_pkgname}-notk
pkgver=5.0.0
pkgrel=2
pkgdesc="Plotting package which outputs to X11, files and others. Without wxgtk/qt."
arch=('i686' 'x86_64')
url="http://www.gnuplot.info"
license=('custom')
depends=('readline' 'gd' 'cairo' 'libjpeg' 'lua' 'gnutls')
makedepends=('emacs' 'texinfo' 'texlive-core' 'texlive-latexextra')
options=('!makeflags')
provides=('gnuplot')
conflicts=('gnuplot' 'gnuplot-nox')
install=gnuplot.install
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha1sums=('ca5163e3cb466b4aeb878f1173b0fe624367f08a')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"

	# fix default source location; use the GDFONTPATH variable to modify at runtime
	sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' src/variable.c

	sed -i -e 's|/usr/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
		-e 's|$(X11ROOT)/X11R6/lib/X11/fonts/Type1|$(X11ROOT)/usr/share/fonts/Type1|' \
		src/variable.c
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	./configure  --prefix=/usr \
		--libexecdir=/usr/bin \
		--with-gihdir=/usr/share/gnuplot \
		--disable-wxwidgets \
		--with-readline=gnu

	make pkglibexecdir=/usr/bin
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install install-info

	install -Dm644 Copyright "$pkgdir/usr/share/licenses/$_pkgname/Copyright"

	rm -f "$pkgdir/usr/share/texmf-dist/ls-R"
}
