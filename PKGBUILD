# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_pkgname=gnuplot
pkgname=$_pkgname-nogui
pkgver=6.0.0
pkgrel=1
pkgdesc="Plotting package which outputs to X11, files and others. Without wxgtk/qt."
arch=("x86_64")
url="http://www.gnuplot.info"
license=("custom")
depends=(cairo
    gcc-libs
    gd
    glib2
    glibc
    libcerf
    libwebp
    libx11
    lua
    pango
    readline)
makedepends=('emacs')
optdepends=('texlive-core')
provides=("gnuplot")
conflicts=("gnuplot" "gnuplot-nox")
replaces=("gnuplot-notk")
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz"
	"lua53_compat.patch")
sha256sums=('635a28f0993f6ab0d1179e072ad39b8139d07f51237f841d93c6c2ff4b1758ec'
            'bfd8a61abbf4491c74225cb9fd252619d4fc29751838bcb4c0639ffe05a00695')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
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
