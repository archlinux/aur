_gitname=ots
pkgname=${_gitname}-git
pkgver=641.f723823
pkgver() { cd $_gitname && echo $(git rev-list --count master).$(git rev-parse --short master); }
pkgrel=1
pkgdesc="OpenType fonts sanitiser. Supports TTF, WOFF, WOFF2 and other formats."
arch=('i686' 'x86_64')
url="https://github.com/khaledhosny/ots"
license=('custom')
depends=('zlib' 'freetype2' 'libpng')
makedepends=('git')
provides=('ots')
conflicts=('ots')
source=('git://github.com/khaledhosny/ots.git')
md5sums=(SKIP)

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  
  ## remove useless "libz.a" and others
  thelibdir="$pkgdir/usr/lib"
  rm $thelibdir/*.a

  ## remove pkgdir/usr/lib, if it empty after *.a cleaup
  if [ -z "$(ls -A $thelibdir)" ]; then
    rm -d "$thelibdir"
  fi

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
