# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Jon Gjengset <jon@tsp.io>

pkgname=gnuplot-git
pkgver=5.5r20200810.11231
_majorver=5.5
pkgrel=1
pkgdesc="A command-line driven interactive function and data plotting utility - git version"
arch=('i686' 'x86_64')
url="https://github.com/gnuplot/gnuplot"
license=('custom')
depends=('gd' 'lua' 'qt5-svg' 'pango' 'libcerf')
makedepends=('git' 'qt5-tools' 'emacs')
provides=("gnuplot=${_majorver}")
conflicts=('gnuplot')
source=("${pkgname%-git}::git+https://git.code.sf.net/p/gnuplot/gnuplot-main")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%sr%s.%s" $(echo $_majorver) $(git log -1 --format="%cd" --date=short | tr -d '-') \
	 "$(git rev-list --count HEAD)"
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
	  --enable-kpsexpand \
	  --with-qt=qt5 
  make pkglibexecdir=/usr/bin
  cd docs
  make info
}

package() {
  cd ${pkgname%-git}
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install install-info
  install -Dm644 Copyright "$pkgdir"/usr/share/licenses/$pkgname/Copyright
}
