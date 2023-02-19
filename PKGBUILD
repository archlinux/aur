# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sword-svn
pkgver=1.9.0.svnversion.3887
pkgrel=1
epoch=3
pkgdesc="Libraries for Bible programs - svn-version"
arch=('i686' 'x86_64')
url="http://crosswire.org/sword/"
license=('GPL')
depends=('curl' 'clucene' 'xapian-core' 'icu')
makedepends=('subversion')
provides=('sword=1.9.1')
conflicts=('sword')
source=('sword::svn+https://crosswire.org/svn/sword/trunk/')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-svn}"
  local ver="$(svnversion)"
  printf "%s.%s" $(awk '/AC_INIT/ {print $2}' configure.ac | tr -d ,) "${ver//[[:alpha:]]}"
}

build() {
  cd "${pkgname%-svn}"
  ./autogen.sh
  CXXFLAGS+=' -DU_USING_ICU_NAMESPACE=1'
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc 
  make
}

check() {
  cd "${pkgname%-svn}"
  export SWORD_PATH=~/.sword
  mkdir -p $SWORD_PATH/mods.d
  echo yes |installmgr -init
  echo yes |installmgr -sc
  echo yes |installmgr -r CrossWire
  echo yes |installmgr -ri CrossWire KJV
  installmgr -l
  diatheke -b KJV -k Jn 3:16
}

package() {
  cd "${pkgname%-svn}"
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install_config
}
