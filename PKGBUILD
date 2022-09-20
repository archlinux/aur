# Maintainer: Francesco La Camera <fm@lacamera.org>
pkgname=nvi
pkgver=1.79
pkgrel=2
pkgdesc="The Berkeley Vi Editor"
arch=('i686' 'x86_64')
url="https://github.com/lacamera/nvi"
license=('BSD')
depends=('libtool' 'readline' 'ncurses')
source=("git+https://github.com/lacamera/nvi.git"
       "fixerrors.patch")
md5sums=('SKIP' '0bbe8609c1e2866ed239af14c065a6bb')

prepare(){
  cd "$srcdir/$pkgname"
  patch -p1 < ../fixerrors.patch
  cd "$srcdir/$pkgname/build"
  cp -pf /usr/share/libtool/build-aux/config.guess .
  cp -pf /usr/share/libtool/build-aux/config.sub .
}

build(){
  export CPPFLAGS="${CPPFLAGS} -U_FORTIFY_SOURCE"
  cd "$srcdir/$pkgname/build"
  ./configure --prefix="$pkgdir/usr" --program-prefix=n
  make
}

package(){
  cd "$srcdir/$pkgname/build"
  make install
  install -Dm644 "$srcdir/$pkgname/LICENSE"\
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
