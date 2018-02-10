# Maintainer: Det <nimetonmaili g-mail>  
# Based on [extra]'s xorgproto: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/xorgproto

_pkgname=xorgproto
pkgname=$_pkgname-git
pkgver=2018.1.2.r2585.g5c6e9a6
pkgrel=1
pkgdesc="Combined X.Org X11 Protocol headers - Git version"
arch=('any')
url="http://cgit.freedesktop.org/xorg/proto/$_pkgname/"
license=('custom')
makedepends=('git' 'xorg-util-macros') # 'xmlto' 'libxslt' 'linuxdoc-tools' 'docbook-sgml' 'fop')
provides=('xorgproto' 'bigreqsproto' 'compositeproto' 'damageproto' 'dmxproto' 'dri2proto' 'dri3proto' 'fixesproto' 'fontsproto' 'glproto' 'inputproto' 'kbproto' 'presentproto' 'printproto' 'randrproto' 'recordproto' 'renderproto' 'resourceproto' 'scrnsaverproto' 'videoproto' 'xcmiscproto' 'xextproto' 'xf86dgaproto' 'xf86driproto' 'xf86miscproto' 'xf86vidmodeproto' 'xineramaproto' 'xproto')
conflicts=(${provides[@]})
replaces=(${provides[@]/xorgproto})
source=("git://anongit.freedesktop.org/xorg/proto/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git describe --long | cut -d "-" -f2-3 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f4)
}

build() {
  cd $_pkgname

  msg2 "Starting autogen.sh..."
  ./autogen.sh  --prefix=/usr \
    --without-xmlto \
    --without-xsltproc \
    --without-fop

  msg2 "Starting make..."
  make
}

package() {
  cd $_pkgname

  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install

  for i in COPYING*; do
    install -Dm644 $i "$pkgdir"/usr/share/licenses/$_pkgname/$i
  done

  # Cleanup
  rm -f "$pkgdir"/usr/include/X11/extensions/{apple,windows}*
  rm -f "$pkgdir"/usr/share/licenses/$_pkgname/COPYING-{apple,windows}wmproto
  rm -f "$pkgdir"/usr/share/pkgconfig/{apple,windows}wmproto.pc
}
