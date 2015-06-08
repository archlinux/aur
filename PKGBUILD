# Maintainer: Martin Brodbeck <martin at brodbeck-online dot de>
pkgname=fritzident
pkgver=0.1
pkgrel=3
pkgdesc="Allows internet access limits for individual users on an AVM Fritz!Box"
arch=('i686' 'x86_64')
url="https://github.com/naund/fritzident"
license=('GPL3')
depends=('glibc')
optdepends=('xinetd: to run fritzident through xinetd')
backup=('etc/xinetd.d/fritzident')
install='fritzident.install'
source=($pkgname-$pkgver.tar.gz)
md5sums=('c96c82b6892299bf20f208757544331e')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc/xinetd.d

  cp fritzident $pkgdir/usr/bin/

  cat >$pkgdir/etc/xinetd.d/fritzident <<EOL
service fritzident
{
  port = 14013
  socket_type = stream
  protocol = tcp
  wait = no
  user = root
  server = /usr/bin/fritzident
  server_args = fritzident
  disable = no
}
EOL
}
