# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pyxplot
pkgver=0.9.2
pkgrel=5
pkgdesc="Command-line graphing package with a simple interface that produces publication-quality output."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.pyxplot.org.uk/"
changelog=${pkgname}.changelog
provides=('pyxplot')
depends=('libxml2' 'texlive-latexextra' 'fftw' 'gsl')
optdepends=('python-scipy: mathematical functions'
	    'python-numpy: mathematical functions'
            'gsl: fitting'
            'gv: viewing PostScript files'
	    'ghostscript: for postscript')
makedepends=('imagemagick' 'ghostscript' 'wget' 'python2')
source=("http://www.pyxplot.org.uk/src/${pkgname}_${pkgver}.tar.gz")
sha256sums=('041074956c99d16125cf455dd57ad6908814e4abe4bfbff6125c3b10e63e5f29')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  # LDFLAGS to remove harmful -Wl,--as-needed
  # USRDIR because otherwise it seem to look for help file in wrong directory
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed} -lpthread"
  sed -i s+python+python2+ Makefile
  sed -i s+-ltermcap++ Makefile
  make USRDIR="/usr"
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "$pkgdir"/usr
  make USRDIR="$pkgdir"/usr MANDIR="$pkgdir"/usr/share/man/man1 install
}
