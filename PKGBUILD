#Maintainer: Grey Christoforo <first name [at] last name [dot] net>
pkgname=tclkit
pkgver=8.6.14
_tcl_ver=8.6.14
_tk_ver=8.6.14
_kit_ver=8.6.4-9
pkgrel=1
pkgdesc="single-file executable that provides a complete Tcl and Tk runtime"
arch=(x86_64)
url="https://github.com/stiefel40k/kitgen"
options=(emptydirs !buildflags !makeflags !strip)
license=('custom')
makedepends=(
'upx'
'ucl'
'libx11'
'xorgproto')
source=("kitgen-${_kit_ver}.tar.gz::https://github.com/stiefel40k/kitgen/archive/${_kit_ver}.tar.gz"
	"tk-${_tk_ver}.tar.gz::https://prdownloads.sourceforge.net/tcl/tk${_tk_ver}-src.tar.gz"
	"tcl-${_tcl_ver}.tar.gz::https://prdownloads.sourceforge.net/tcl/tcl${_tcl_ver}-src.tar.gz")

sha256sums=('6a78963842e6810f85ba81a01866ba705b470feee8c0bb25a86992560b215150'
            '8ffdb720f47a6ca6107eac2dd877e30b0ef7fac14f3a84ebbd0b3612cee41a94'
            '5880225babf7954c58d4fb0f5cf6279104ce1cd6aa9b71e9a6322540e1c4de66')
noextract=("tk-${_tk_ver}.tar.gz" "tcl-${_tcl_ver}.tar.gz")

prepare() {
  cd kitgen-${_kit_ver}
  mkdir -p build/{tcl,tk}
  bsdtar --strip-components 1 -xf "${srcdir}"/tk-${_tk_ver}.tar.gz -C build/tk
  bsdtar --strip-components 1 -xf "${srcdir}"/tcl-${_tcl_ver}.tar.gz -C build/tcl
}

build() {
  cd kitgen-${_kit_ver}

  export B64=b64
  export options="thread allenc cli dyn"

  msg2 "config"
  ./config.sh build/kit-large ${options} ${B64}

  msg2 "make"
  cd build/kit-large
  make
}

check() {
  local _testver=$(echo 'puts $tcl_version' | "${srcdir}"/kitgen-${_kit_ver}/build/kit-large/tclkit-cli)
  msg2 "Test passed with tclkit version = ${_testver}"
}

package() {
 mkdir -p "${pkgdir}"/usr/bin
 install -o root -g root "${srcdir}"/kitgen-${_kit_ver}/build/kit-large/kit-* "${pkgdir}"/usr/bin/.
 install -o root -g root "${srcdir}"/kitgen-${_kit_ver}/build/kit-large/tclkit-* "${pkgdir}"/usr/bin/.
 ln -s tclkit-cli "${pkgdir}"/usr/bin/tclkit
}
