# Maintainer: Fran Dieguez <fran dot dieguez at mabishu dot com>
pkgname=mssh-git
pkgver=2.2.r0.g9221061
pkgrel=1
pkgdesc="Tool to administrate multiple servers at once"
arch=('x86_64' 'i686')
license=('BSD')
url="http://baloo.dyndns.biz/"
options=('!strip')
makedepends=("git" "bash-completion" "gconf" "intltool")
depends=("gconf" "openssh" "vte3")
conflicts=("mssh")
provides=("mssh=$pkgver")
source=("$pkgname::git://baloo.dyndns.biz/mssh.git")
sha256sums=('SKIP')
pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/[_-]/./g'
}
build() {
  cd $pkgname
  ./bootstrap.sh
  CC=clang ./configure --prefix=/usr --sysconfdir=/etc \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
    --disable-nls
  make
}
check() {
  cd $pkgname
  make -k check
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
