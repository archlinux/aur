# Maintainer: Amir Mohammadi <183.amir@gmail.com>
# Contributor: Bersam Karbasion <bersam.k@gmail.com>
# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>
# Contributor: Nezmer <Nezmer@allurelinux.org>
# Contributor: Alexander Stein <archlinux+al@il5.in>
pkgname=bicon-git
_pkgname=bicon
pkgver=0.4.r5.g46c02dd
pkgrel=1
pkgdesc="A bidirectional console"
url="https://github.com/behdad/bicon/"
arch=('any')
license=('LGPL')
depends=('fribidi' 'kbd' 'xorg-xkbutils')
options=('!buildflags')
makedepends=('libtool' 'git')
provides=('bicon')
conflicts=('bicon')
source=(git+https://github.com/behdad/bicon.git)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $srcdir/$_pkgname
  ./autogen.sh
  ./configure --prefix=/usr --disable-static --enable-fribidi \
      --mandir=/usr/share/man --with-gtk=2.0,3.0
  make
}
package() {
  cd $srcdir/$_pkgname
  make DESTDIR="${pkgdir}" INSTALL="install -p" install
}
