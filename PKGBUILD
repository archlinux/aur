# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s randrproto: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/randrproto

_pkgname=randrproto
pkgname=$_pkgname-git
pkgver=1.5.0.r159.g98da0d6
pkgrel=1
pkgdesc="X11 RandR extension wire protocol - Git version"
arch=('any')
url="http://cgit.freedesktop.org/xorg/proto/$_pkgname/"
license=('custom')
makedepends=('git' 'xorg-util-macros')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://anongit.freedesktop.org/xorg/proto/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  # Git might not be tagged appropriately, sources (hopefully) are
  _ver1=$(git describe --long | cut -d "-" -f2-3 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f4)
  _ver2=$(grep AC_INIT configure.ac | cut -d "[" -f3 | cut -d "]" -f1).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f4)

  # Choose higher
  if [[ $(vercmp $_ver1 $_ver2) = 1 ]]; then
    echo $_ver1
  else
    echo $_ver2
  fi
}

build() {
  cd $_pkgname

  msg2 "Starting autogen.sh..."
  ./autogen.sh --prefix=/usr

  msg2 "Starting make..."
  make
}

package() {
  cd $_pkgname

  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
