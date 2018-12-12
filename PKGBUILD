# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Jon Gjengset <jon@tsp.io>

pkgname=gnuplot-git
pkgver=5.3r20181209.10646
_majorver=5.3
pkgrel=1
pkgdesc="A command-line driven interactive function and data plotting utility - git version"
arch=('i686' 'x86_64')
url="https://github.com/gnuplot/gnuplot"
license=('custom')
depends=('gd' 'emacs' 'texlive-core' 'texlive-latexextra' 'lua' 'qt5-svg' 'pango')
makedepends=('git' 'qt5-tools')
provides=('gnuplot=5.3')
conflicts=('gnuplot')
source=("${pkgname%-git}::git+https://git.code.sf.net/p/gnuplot/gnuplot-main" lua53_compat.patch)
sha256sums=('SKIP'
            'bfd8a61abbf4491c74225cb9fd252619d4fc29751838bcb4c0639ffe05a00695')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  printf "%sr%s.%s" $(echo $_majorver) $(git log -1 --format="%cd" --date=short | tr -d '-') \
	 "$(git rev-list --count HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  patch -p1 < "$srcdir"/lua53_compat.patch
  sed -i 's+-fPIE+-fPIC+' configure.ac
  # fix default source location; use the GDFONTPATH variable 
  # to modify at runtime 
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' \
    src/variable.c
  sed -i 's|/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
    src/variable.c
}  

build() {
  cd ${pkgname%-git}
  ./prepare
  TERMLIBS='-lX11' ./configure --prefix=/usr \
	  --libexecdir=/usr/lib \
	  --with-gihdir=/usr/share/gnuplot \
	  --with-texdir=/usr/share/texmf \
	  --with-readline=gnu \
	  --disable-wxwidgets \
	  --without-libcerf \
	  --with-qt=qt5 
	  
  make pkglibexecdir=/usr/bin
  cd docs
  make info
}

package() {
  cd ${pkgname%-git}
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install

  install -Dm644 Copyright "$pkgdir"/usr/share/licenses/$pkgname/Copyright
}
