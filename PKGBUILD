# Maintainer: Christian Hammacher <bmasterc gmail com>
# Contributor: Christian Hammacher <bmasterc gmail com>

pkgname=shrew-vpn-client
pkgver=2.2.1
pkgrel=4
pkgdesc="A portable VPN client for Linux with Qt GUI"
arch=('i686' 'x86_64')
url="http://www.shrew.net/"
license=('osi')
depends=('qt4' 'openssl-1.0')
makedepends=('gcc' 'flex' 'libedit' 'bison' 'cmake')
optdepends=('openldap' 'logrotate')
conflicts=('shrew-vpn-client-alpha')
backup=('etc/iked.conf')
source=("http://www.shrew.net/download/ike/ike-$pkgver-release.tbz2"
	'ikea.desktop'
	'iked.conf'
	'iked.service'
	fix-openssl.patch
	fix_dirent_access_after_closedir.patch)
md5sums=('8fc14ac86771ee693d3950757c84f335'
         '5b35a4246eb1b7bd4bfb6780c23d39f2'
         '3cfe649578267235d60ab7cfb6fb4c57'
         'e90d5922d37f9e45515c5754a3a29c73'
         'c1f793c174db5d7f5c11c8009a967a4d'
         'cb4720dab4f9cae5aeac1e62abc6348b')

prepare() {

  cd $srcdir/ike
  patch -Np1 -i ../fix-openssl.patch
  # https://build.opensuse.org/package/view_file/security/ike/fix_dirent_access_after_closedir.patch
  patch -Np1 -i ../fix_dirent_access_after_closedir.patch

}

build() {
  cd $srcdir/ike

  # Build the whole package
  cmake -DQTGUI=YES -DNATT=YES -DLDAP=YES -DSBINDIR=/usr/bin \
	-DCMAKE_INSTALL_PREFIX=/usr -DMANDIR=/usr/share/man -DETCDIR=/etc
  make
}

package() {
  cd "$srcdir/ike"
  make DESTDIR="$pkgdir/" install
  
  # Install the daemon script
  install -D -m644 $startdir/iked.service $pkgdir/usr/lib/systemd/system/iked.service

  # The configuration file is already ready for use; just rename it
  mv $pkgdir/etc/iked.conf.sample $pkgdir/etc/iked.conf

  # Prevent logs from growing if logrotate is installed
  install -D -m644 $startdir/iked.conf $pkgdir/etc/logrotate.d/iked.conf

  # Copy our desktop files
  install -D -m644 $srcdir/ike/source/qikea/png/ikea.png $pkgdir/usr/share/icons/ikea.png
  install -D -m755 $startdir/ikea.desktop $pkgdir/usr/share/applications/ikea.desktop
}


