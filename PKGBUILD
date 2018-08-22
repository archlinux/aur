# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=Cynthiune
pkgname=cynthiune.app
pkgrel=1
pkgver=1.0.0
pkgdesc='Romantic and extensible music player for GNUstep and Mac OS X'
arch=('i686' 'x86_64')
url='http://gap.nongnu.org/cynthiune/index.html'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
optdepends=('libid3tag' 'libmad' 'libvorbis' 'libogg' 'libmpcdec' 'esound')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/Cynthiune-1.0.0.tar.gz")
sha256sums=('3cc5228c8cdb66256bbcec4b317bbd3853397f09ec9b7378a7f65140eff5bcaf')

prepare() {
  cd $_pkgname-$pkgver
  # Leave out avifile library until available
  if test "$pkg-config --exists avifile" != 0; then
    sed -i '70,73{s/^.*//}' GNUmakefile
  fi
  #libmpcdec
  if test "$pkg-config --exists esound" != 0; then
    sed -i '74,76{s/^.*//}' GNUmakefile
  fi
  #esound
  if test "$pkg-config --exists esound" != 0; then
    sed -i '118,120{s/^.*//}' GNUmakefile
  fi
}

build() {
  cd $_pkgname-$pkgver
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}