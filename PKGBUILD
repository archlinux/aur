# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_pkgname=gnuplot
pkgname=$_pkgname-nogui
pkgver=5.4.5
pkgrel=1
pkgdesc="Plotting package which outputs to X11, files and others. Without wxgtk/qt."
arch=("x86_64")
url="http://www.gnuplot.info"
license=("custom")
depends=('cairo' 'libcerf' 'libjpeg' 'lua' 'gd' 'gnutls' 'pango' 'readline')
makedepends=('emacs')
optdepends=('texlive-core')
provides=("gnuplot")
conflicts=("gnuplot" "gnuplot-nox")
replaces=("gnuplot-notk")
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz"
	"lua53_compat.patch")
sha256sums=('66f679115dd30559e110498fc94d926949d4d370b4999a042e724b8e910ee478'
            'bfd8a61abbf4491c74225cb9fd252619d4fc29751838bcb4c0639ffe05a00695')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"

	# Fix default source location; use the GDFONTPATH variable to modify at runtime.
	sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' src/variable.c

	sed -i -e 's|/usr/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
		-e 's|$(X11ROOT)/X11R6/lib/X11/fonts/Type1|$(X11ROOT)/usr/share/fonts/Type1|' \
		src/variable.c

	patch -p1 < "$srcdir/lua53_compat.patch"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	./configure  --prefix='/usr' \
        --libexecdir=/usr/bin \
        --with-gihdir=/usr/share/gnuplot \
        --disable-wxwidgets \
        --with-qt=no \
        --with-x \
        --with-readline=gnu \
        --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
        --infodir="$pkgdir/usr/share/info"

	make pkglibexecdir=/usr/bin
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install
    make install-info
    install -Dm644 Copyright "$pkgdir/usr/share/licenses/$_pkgname/Copyright"

	rm -f "$pkgdir/usr/share/texmf-dist/ls-R"
}
