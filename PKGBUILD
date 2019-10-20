# Maintainer: willemw <willemw12@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: rabyte <rabyteNOSPAM_at_moonblade.dot.org>

_pkgname=libtremor
pkgname=$_pkgname-svn
pkgver=r19674
pkgrel=1
pkgdesc="Integer-only, fully Ogg Vorbis compliant software decoder library"
arch=('x86_64')
url="http://www.xiph.org/vorbis/"
license=('BSD')
depends=('libogg')
makedepends=('subversion')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!libtool')
source=($pkgname::svn+https://svn.xiph.org/trunk/Tremor)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $pkgname

  # Fix for automake 1.13
  #sed -i "s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/" configure.in

  # Patch for error:
  #     ./configure: line 9215: syntax error near unexpected token `,'
  #     ./configure: line 9215: `    XIPH_PATH_OGG(, as_fn_error $? "must have Ogg installed!" "$LINENO" 5)'
  sed -i "s/\(XIPH_PATH_OGG(, AC_MSG_ERROR(must have Ogg installed!))\)/#\1/" configure.in
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

