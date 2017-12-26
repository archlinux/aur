#Maintainer: Grey Christoforo <first name [at] last name [dot] net>
pkgname=tclkit
pkgver=8.6.4-1
_tcl_tag=tip-412
_tk_tag=core_8_6_4
_kit_tag=8.6.4-7
pkgrel=7
pkgdesc="single-file executable that provides a complete Tcl and Tk runtime"
arch=('i686' 'x86_64')
url="https://github.com/patthoyts/kitgen"
options=(emptydirs !buildflags !makeflags !strip)
license=('custom')
makedepends=('upx' 'ucl' 'libx11')
source=("https://github.com/stiefel40k/kitgen/archive/${_kit_tag}.tar.gz"
	"tk.tar.gz::https://github.com/tcltk/tk/archive/${_tk_tag}.tar.gz"
	"tcl.tar.gz::https://github.com/tcltk/tcl/archive/${_tcl_tag}.tar.gz")
md5sums=('2f4305a69297deffde0fa4a2a4af2658'
         '4f9b416d393f6b45b972d506a23ed36d'
         '9297de5538175b98c000b98ccc469290')

build() {
  mv "kitgen-${_kit_tag}" kitgen
  cd kitgen
  mkdir -p 8.6
  mv ../tk-$_tk_tag 8.6/tk
  mv ../tcl-$_tcl_tag 8.6/tcl
  local options="thread allenc cli dyn"
  if [ "${CARCH}" = "x86_64" ]; then
	local B64=b64
  fi
  ./config.sh 8.6/kit-large thread allenc cli dyn $B64
  cd 8.6/kit-large
  make
}

package() {
 mkdir -p "$pkgdir"/usr/bin
 install -o root -g root "$srcdir"/kitgen/8.6/kit-large/kit-* "$pkgdir"/usr/bin/.
 install -o root -g root "$srcdir"/kitgen/8.6/kit-large/tclkit-* "$pkgdir"/usr/bin/.
 cd "$pkgdir"/usr/bin/
 ln -s tclkit-cli tclkit
}
