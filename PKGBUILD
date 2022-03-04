# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=waffles
pkgver=1.0.0
#_pkgver="${pkgver//./-}"
pkgrel=1
pkgdesc="Comprehensive collection of CLI tools for machine learning and data mining."
arch=('i686' 'x86_64')
url="http://gashler.com/mike/waffles/"
license=('CC0')
depends=('libpng' 'gcc-libs')
#source=(http://downloads.sourceforge.net/project/waffles/waffles/$_pkgver/waffles-$_pkgver-source.zip)
source=("$pkgname-$pkgver.tgz::https://github.com/mikegashler/waffles/archive/refs/tags/$pkgver.tar.gz")
md5sums=('f5abc0709890d732f35bde913dc4d57e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/src"
  sed -i 's/^CFLAGS.*$/& -Wno-error=terminate -Wno-error=catch-value -Wno-error=misleading-indentation/' GClasses/Makefile
  sed -i 's/\tCFLAGS = .*$/& -Wno-error=terminate/' test/Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make opt

  # make docs
  cd "$srcdir/$pkgname-$pkgver/web"
  find ./ -type f -exec chmod -x {} +
  find ./ -type f -name '*.bash' -exec chmod +x {} +
}

check() {
  # make test
  cd "$srcdir/$pkgname-$pkgver/bin"
  #./test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # makefile does not seem to take any useful args

  # binaries
  install -d "$pkgdir/usr/bin/"
  install -t "$pkgdir/usr/bin/" bin/waffles_*

  # docs
  install -d "$pkgdir/usr/share/doc/waffles"
  cp -r web/* "$pkgdir/usr/share/doc/waffles"
}
