# Maintainer: Det <nimetonmaili g-mail>
# Contributor: Pimper (M0Rf30)

_pkgname=npapi-vlc
pkgname=$_pkgname-git
pkgver=2.2.1.95.r1444.gd5accd8
pkgrel=1
pkgdesc="The modern VLC Mozilla (NPAPI) plugin"
arch=('i686' 'x86_64')
url="http://git.videolan.org/?p=$_pkgname.git;a=summary"
license=('LGPL-2.1')
depends=('vlc')
makedepends=('git' 'gtk2' 'npapi-sdk')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!libtool')
source=("git://git.videolan.org/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  echo $(git describe | cut -d "-" -f1-2 | tr - .).r$(git rev-list HEAD --count).$(git describe | cut -d "-" -f3)
}

build() {
  cd $_pkgname

  msg2 "Updating sources..."
  git submodule update --init

  msg2 "Starting autogen.sh..."
  sh ./autogen.sh

  msg2 "Starting configure..."
  ./configure --prefix=/usr

  msg2 "Starting make..."
  make
}

package() {
  cd $_pkgname

  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}