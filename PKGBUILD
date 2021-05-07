# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=twelf
pkgver=1.7.1
pkgrel=4
pkgdesc='An implementation of the logical framework LF'
url='http://twelf.org/'
license=('BSD')
arch=('x86_64')
depends=('bash' 'gmp' 'smlnj' 'subversion' 'inetutils')
makedepends=('smlnj')
provides=('twelf')
conflicts=('twelf-git')
install=$pkgname.install
source=("http://twelf.org/releases/twelf-src-$pkgver.tar.gz")
md5sums=('1cb556366dd534f8c1c858614dd57e16')

prepare() {
  sed "s/smlnj = .*/smlnj = smlnj/g" -i twelf/Makefile
}

build() {
  cd "$pkgname"
  make buildid
  make smlnj
}

package() {
  cd "$pkgname"
  cat > ./bin/twelf-server <<EOF
#!/bin/sh
exec "sml" @SMLload="/opt/twelf/bin/.heap/twelf-server.amd64-linux" @SMLdebug=/dev/null
EOF
  install -d -m755 $pkgdir/opt/twelf $pkgdir/usr/bin
  cp -r . $pkgdir/opt/twelf
  ln -s /opt/twelf/bin/twelf-server $pkgdir/usr/bin/twelf-server
}
