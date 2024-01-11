_name=xorgproto
pkgname=mingw-w64-$_name
pkgver=2023.2
pkgrel=1
pkgdesc="combined X.Org X11 Protocol headers (mingw-w64)"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
makedepends=('mingw-w64-xorg-util-macros' 'mingw-w64-meson')
provides=('mingw-w64-xproto')
conflicts=('mingw-w64-xproto')
replaces=('mingw-w64-xproto')
options=('staticlibs' '!buildflags' '!strip')
source=(https://xorg.freedesktop.org/archive/individual/proto/$_name-$pkgver.tar.gz{,.sig}
        meson.patch)
sha512sums=('9f03dcf7b2e7363523cdae6618f7c7db0041335aad505e0322571c391f2ef294957012a755b70e1dd24c3c0178e0423a36554032f552786d724eb9be31891436'
            'SKIP'
            'cec486d47dbea1fcb4338a849b71b69756a8c5bdd4dde16dd8ae963f70bf5231fee227970016a3ab9924934644e7c9c0ccba85c5d9c12caf0be124c3d2ffb645')
validpgpkeys=('67DC86F2623FC5FD4BB5225D14706DBE1E4B4540') # "Olivier Fourdan <fourdan@xfce.org>"

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/$_name-$pkgver"
  patch -p1 -i "$srcdir/meson.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}
    ${_arch}-meson build-${_arch} \
      -Dlegacy=true

    ninja -C build-${_arch}
  done
}

package() {
  cd "$srcdir/$_name-$pkgver"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" ninja -C build-${_arch} install
  done
}
