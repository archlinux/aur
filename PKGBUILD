# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=Cynthiune
pkgname=cynthiune.app
pkgrel=3
pkgver=1.0.0
pkgdesc='Free software and romantic music player for GNUstep'
arch=('i686' 'x86_64')
url='http://gap.nongnu.org/cynthiune/index.html'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'libmad')
optdepends=('libid3tag' 'libmad' 'libvorbis' 'libogg' 'libmpcdec' 'esound')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/Cynthiune-1.0.0.tar.gz"
        "http://http.debian.net/debian/pool/main/c/cynthiune.app/cynthiune.app_1.0.0-2.debian.tar.xz")
sha256sums=('3cc5228c8cdb66256bbcec4b317bbd3853397f09ec9b7378a7f65140eff5bcaf'
            '7b74006468777e24b3ca077449f95bf1fff529672d6c6fec61fd276e379716b7')

prepare() {
  cd $_pkgname-$pkgver
  for patch in ../debian/patches/*.patch; do 
    patch -p1 < $patch
  done

  # Leave out avifile library until available
  if test "$pkg-config --exists avifile" != 0; then
    sed -i '70,73{s/^.*//}' GNUmakefile
  fi
  #libmpcdec
  if test "$pkg-config --exists libmpcdec" != 0; then
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
