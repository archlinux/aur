# Maintainer: Christian Hammacher <bmasterc gmail com>
# Contributor: Christian Hammacher <bmasterc gmail com>

pkgname=shrew-vpn-client
pkgver=2.2.1
pkgrel=6
pkgdesc="A portable VPN client for Linux - Qt GUI only"
arch=('i686' 'x86_64')
url="http://www.shrew.net/"
license=('osi')
depends=('qt4' 'ike')
makedepends=('gcc' 'flex' 'libedit' 'bison' 'cmake')
conflicts=('shrew-vpn-client-alpha')
source=("http://www.shrew.net/download/ike/ike-$pkgver-release.tbz2"
	'ikea.desktop'
	gui_only.patch
	'cmake-threadlib.patch')
md5sums=('8fc14ac86771ee693d3950757c84f335'
         '5b35a4246eb1b7bd4bfb6780c23d39f2'
         'eed8f22eedb29cad06abcfe8e513b028'
         '4c823bae9e006cf7bfb11fa633a59837')

prepare() {
  cd "$srcdir/ike"
  patch -p1 -i "$srcdir/cmake-threadlib.patch"
}

build() {
  cd "$srcdir/ike"

  # Build the whole package
  cmake -DQTGUI=YES -DNATT=YES -DLDAP=YES -DSBINDIR=/usr/bin \
    -DCMAKE_INSTALL_PREFIX=/usr -DMANDIR=/usr/share/man -DETCDIR=/etc

  # Remove binary and library from make
  patch -Np1 -i ../gui_only.patch

  make
}

package() {
  cd "$srcdir/ike"
  make DESTDIR="$pkgdir/" install
  
  # Copy our desktop files
  install -D -m644 "$srcdir/ike/source/qikea/png/ikea.png" "$pkgdir/usr/share/icons/ikea.png"
  install -D -m755 "$startdir/ikea.desktop" "$pkgdir/usr/share/applications/ikea.desktop"
}


