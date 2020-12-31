# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

_pkgname=chdkptp
pkgname=${_pkgname}-svn
pkgver=r978
pkgrel=2
pkgdesc="chdkptp is a client application for the CHDK"
arch=(x86_64)
url="https://www.assembla.com/spaces/chdkptp"
license=('GPL' 'MIT')
depends=('lua53' 'libusb-compat' 'lua53-lgi')
makedepends=('subversion' 'lua53-lgi')
provides=('chdkptp')
conflicts=('chdkptp')
source=("svn+https://subversion.assembla.com/svn/chdkptp/trunk")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
 cd "$srcdir/trunk"
 sed -i '8iCHDKPTP_DIR=/usr/lib/chdkptp' chdkptp.sh
}

build() {
  cd "$srcdir/trunk"
  make \
  	LUA_LIB=lua5.3 \
	LUA_INCLUDE_DIR=/usr/include/lua5.3 \
	GUI=1 \
	GTK_SUPPORT=1
}

package() {
  cd "$srcdir/trunk"
  install -Dm755 chdkptp $pkgdir/usr/lib/chdkptp/chdkptp
  install -dm644 "$pkgdir/usr/lib/chdkptp/lua/extras"
  install -m644 lua/*.lua "$pkgdir"/usr/lib/chdkptp/lua/
  install -m644 lua/extras/*.lua "$pkgdir"/usr/lib/chdkptp/lua/extras/
  install -Dm755 chdkptp.sh "$pkgdir"/usr/bin/chdkptp
}

