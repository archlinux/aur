# Contributor: <mumei AT airmail DOT cc>

_pkgname=Cynthiune
pkgname=cynthiune.app
pkgrel=4
pkgver=1.0.0
pkgdesc='Free software and romantic music player for GNUstep'
arch=('i686' 'x86_64')
url='http://gap.nongnu.org/cynthiune/index.html'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'libmad' 'pulseaudio-alsa' 'libid3tag' 'audiofile' 'libmodplug' 'libao')
optdepends=('libvorbis' 'libogg' 'libmpcdec' 'esound')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/Cynthiune-$pkgver.tar.gz"
        "http://http.debian.net/debian/pool/main/c/cynthiune.app/cynthiune.app_$pkgver-4.debian.tar.xz")
sha256sums=('3cc5228c8cdb66256bbcec4b317bbd3853397f09ec9b7378a7f65140eff5bcaf'
            '64966bef492c4ddf4907c7c2832c4eb80d932ccee190bb3b06490f321ce5a2dd')

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
  # Disable taglib
  sed -i '81,83{s/^.*//}' GNUmakefile
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
