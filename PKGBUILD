# Maintainer: tobias [tobias.archlinux.org]
# Contributor: tobias [tobias.justdreams.de]

pkgname=cinepaint-oyranos
_pkgname=cinepaint-oyranos-release
pkgver=0.25.2
pkgrel=1
pkgdesc="Oyranos enabled version of photo editing application."
arch=('i686' 'x86_64')
license=('LGPL' 'GPL' 'MIT')
url="http://www.cinepaint.org"
depends=('gtk2' 'openexr' 'lcms' 'libxpm' 'fltk' 'ftgl' 'libxxf86vm' 'oyranos>=0.9.0')
makedepends=('python2' 'gutenprint>=5.2.9' 'git')
optdepends=('python2: for python plug-ins'
            'gutenprint: for print plug-ins'
            'ghostscript: for pdf plug-ins')
conflicts=(cinepaint)
provides=(cinepaint)
options=('!libtool')
install=cinepaint.install
source=("https://github.com/milankni/$pkgname/archive/release-$pkgver.tar.gz")

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  # These flags lead to failure during compilation. Why?
  #export LDFLAGS="$LDFLAGS -lstdc++ -lm -lX11"

  # CinePaint may crash due to buffer overflow when entering Preferences
  # or choosing an ICC profile.
  # This is due to some problems with a particular ICC profile on user's
  # system.
  # Workaround is:
  #    x either to compile with --enable-debug (add it to configure line)
  #    x or to run LANG=C cinepaint
  #    x or to remove the troublesome ICC Profile

  #sh autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --mandir=/usr/share/man \
              --enable-pygimp --with-python=/usr/bin/python2

  # Probably not needed anymore
  #find . -name Makefile -exec sed -i 's/-Wl,,/-Wl,/g' {} +

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/cinepaint/COPYING"
}
md5sums=('23c365599a1ce76ad75b5a2c98d2d070')
