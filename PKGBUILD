# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Jon Gjengset <jon@tsp.io>

pkgname=gnuplot-git
pkgver=5.5.r20201207.11381
pkgrel=1
pkgdesc="A command-line driven interactive function and data plotting utility - git version"
arch=('i686' 'x86_64')
url="https://github.com/gnuplot/gnuplot"
license=('custom')
depends=('gd' 'lua' 'qt5-svg' 'pango' 'libcerf' 'libwebp')
makedepends=('git' 'clang' 'qt5-tools')
provides=("gnuplot=${_majorver}")
conflicts=('gnuplot')
provides=('gnuplot')
source=("${pkgname%-git}::git+https://git.code.sf.net/p/gnuplot/gnuplot-main")
sha256sums=('SKIP')
options=('!buildflags')

pkgver() {
  cd ${pkgname%-git}
  _majorver=$(grep gnuplot_version src/version.c|cut -d= -f2 | tr -d '"' | tr -d ';' | tr -d ' ')
  printf "%s.r%s.%s" $(echo $_majorver) $(git log -1 --format="%cd" --date=short | tr -d '-') \
	 "$(git rev-list --count HEAD)"
}

build() {
  cd ${pkgname%-git}
  ./prepare
  CC=clang CXX=clang++ ./configure --prefix=/usr \
	  --libexecdir=/usr/lib \
	  --with-gihdir=/usr/share/gnuplot \
	  --with-readline=gnu \
	  --disable-wxwidgets \
	  --with-qt=qt5 
  make pkglibexecdir=/usr/bin
}

package() {
  cd ${pkgname%-git}
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install 
  install -Dm644 Copyright "$pkgdir"/usr/share/licenses/$pkgname/Copyright
}
