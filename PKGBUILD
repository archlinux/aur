# Maintainer: Christian Hammacher <bmasterc gmail com>
# Contributor: Christian Hammacher <bmasterc gmail com>

pkgname=shrew-vpn-client
pkgver=2.2.1
pkgrel=5
pkgdesc="A portable VPN client for Linux - Qt GUI only"
arch=('i686' 'x86_64')
url="http://www.shrew.net/"
license=('osi')
depends=('qt4' 'ike')
makedepends=('gcc' 'flex' 'libedit' 'bison' 'cmake')
conflicts=('shrew-vpn-client-alpha')
source=("http://www.shrew.net/download/ike/ike-$pkgver-release.tbz2"
	'ikea.desktop'
	gui_only.patch)
md5sums=('8fc14ac86771ee693d3950757c84f335'
         '5b35a4246eb1b7bd4bfb6780c23d39f2'
         'eed8f22eedb29cad06abcfe8e513b028')

build() {
  cd $srcdir/ike

  # Build the whole package
  cmake -DQTGUI=YES -DNATT=YES -DLDAP=YES -DSBINDIR=/usr/bin \
	-DCMAKE_INSTALL_PREFIX=/usr -DMANDIR=/usr/share/man -DETCDIR=/etc

  # Remove binary and library from make
  patch -Np1 -i ../gui_only.patch
#  for Component in iked ikec libike libip libidb libith liblog libpfk ; do
#    sed -e "/\/$Component\//d" -i cmake_install.cmake
#  done

  make
}

package() {
  cd "$srcdir/ike"
  make DESTDIR="$pkgdir/" install
  
  # Copy our desktop files
  install -D -m644 $srcdir/ike/source/qikea/png/ikea.png $pkgdir/usr/share/icons/ikea.png
  install -D -m755 $startdir/ikea.desktop $pkgdir/usr/share/applications/ikea.desktop
}


