# Maintainer: Chris Charabaruk <chris [at] charabaruk [dot] net>
# Contributor: <mumei AT airmail DOT cc>

pkgname=gnustep-back
pkgver=0.32.0
pkgrel=1
pkgdesc="The GNUstep GUI Backend"
arch=('x86_64')
url="https://github.com/gnustep/libs-back"
license=('LGPL')
depends=(libgl libxmu gcc-libs freetype2 cairo)
makedepends=('gnustep-make' 'gnustep-base' 'gnustep-gui>=0.32.0' 'libffi' 'gcc-objc')
conflicts=('gnustep-back-svn')
groups=('gnustep-core')
source=(function-pointers.patch
        https://github.com/gnustep/libs-back/releases/download/back-${pkgver//./_}/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('ccea78bd9da9d861ebf702bc10a38d66b2375643c0292f943214a0ad8e2d461a'
            'ce171095012ac5d845f6e1285a5c71e011fd00aa5981ea1d5a5183706478218d'
            'SKIP')
validpgpkeys=('83AAE47CE829A4146EF83420CA868D4C99149679')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../function-pointers.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  ./configure --prefix=/usr --sysconfdir=/etc/GNUstep
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/etc/ld.so.conf.d
  cat >"$pkgdir"/etc/ld.so.conf.d/gnustep.conf <<EOF
/opt/GNUstep/System/Library/Libraries
/usr/lib/GNUstep/Libraries
EOF
}
