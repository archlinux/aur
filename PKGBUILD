# Maintainer: mickael9 <mickael9 at gmail dot com>
# Contributor: Grey Christoforo <grey@christoforo.net>
pkgname=lib32-tclkit
pkgver=8.6.6
_kit_commit=cc4b5d74b6f236dc72f126d30d32bf55e9e9875f
pkgrel=4
pkgdesc="single-file executable that provides a complete Tcl and Tk runtime (32 bits version)"
arch=(x86_64)
url="https://github.com/patthoyts/kitgen"
options=(!buildflags !makeflags !strip)
license=(custom)
depends=(lib32-glibc)
makedepends=(upx ucl lib32-libx11 lib32-gcc-libs)
conflicts=(tclkit)

source=("kitgen-${_kit_commit}.tar.gz::https://github.com/patthoyts/kitgen/archive/${_kit_commit}.tar.gz"
        "http://downloads.sourceforge.net/tcl/tcl${pkgver}-src.tar.gz"
        "http://downloads.sourceforge.net/tcl/tk${pkgver}-src.tar.gz"
        "kitgen-cflags-quoting.patch")

md5sums=('269b5090f3e99ff7d35424d95e189246'
         '5193aea8107839a79df8ac709552ecb7'
         'dd7dbb3a6523c42d05f6ab6e86096e99'
         '36c54854ce1992944eed7671f8742bad')

prepare() {
  cd "kitgen-$_kit_commit"
  patch -Np1 < "../kitgen-cflags-quoting.patch"
}

build() {
  cd "kitgen-$_kit_commit"
  mkdir -p 8.6
  ln -sf ../../tk${pkgver} 8.6/tk
  ln -sf ../../tcl${pkgver} 8.6/tcl
  local options="thread allenc cli dyn"
  ./config.sh 8.6/kit-large thread allenc cli dyn

  # UPX seems to corrupt things, so replace it with a dummy "true" command.
  # https://github.com/upx/upx/issues/150#issuecomment-346538721
  make -C 8.6/kit-large CFLAGS="-m32 -O2" UPX=true
}

package() {
  cd "kitgen-$_kit_commit"
  mkdir -p "$pkgdir"/usr/bin
  install -o root -g root 8.6/kit-large/tclkit-* "$pkgdir/usr/bin/"
  ln -s tclkit-cli "$pkgdir/usr/bin/tclkit"
}
