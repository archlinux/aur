# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=tiger
pkgver=3.2.3
pkgrel=3
pkgdesc="A security scanner, that checks computer for known problems. Can also use tripwire, aide and chkrootkit"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/tiger/"
license=('GPL')
depends=('perl')
makedepends=('patch')
backup=('opt/tiger/config' 'etc/tiger/tigerrc' 'etc/tiger/cronrc')
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz \
        $pkgname-makefile.diff)
sha256sums=('80db27618de0d806805e77653e568fb9ae556537cfd5a4b17b6b6c9dc442a415'
            '691270ebdc85ab67f381ec47fb1985aeeaed277ed523db325a7984631edf0880')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  patch -Np0 -i ${srcdir}/$pkgname-makefile.diff

  sed -i 's/tempfile`/mktemp`/' util/genmsgidx
  sed -i '/explain.idx/s/&&/||/' util/genmsgidx
 
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --with-tigerhome=/usr/share/tiger \
              --with-tigerconfig=/etc/tiger \
              --with-tigerwork=/var/run/tiger \
              --with-tigerlog=/var/log/tiger \
              --with-tigerbin=/usr/bin
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  install -d ${pkgdir}/usr/share/tiger ${pkgdir}/usr/bin
  
  make DESTDIR=${pkgdir} install
}
