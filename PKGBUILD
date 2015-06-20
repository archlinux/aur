pkgname=tclkit
pkgver=8.6.4
_tcltk_tag=core_8_6_4
_kit_commit=c21eeb1e379bd5acb5b304f0784877b8e8dd31ca
pkgrel=1
pkgdesc="single-file executable that provides a complete Tcl and Tk runtime"
arch=('i686' 'x86_64')
url="https://github.com/patthoyts/kitgen"
options=(emptydirs !buildflags !makeflags !strip)
license=('custom')
source=("tclkit.tar.gz::https://github.com/patthoyts/kitgen/archive/${_kit_commit}.tar.gz"
	"tk.tar.gz::https://github.com/tcltk/tk/archive/${_tcltk_tag}.tar.gz"
	"tcl.tar.gz::https://github.com/tcltk/tcl/archive/${_tcltk_tag}.tar.gz")
md5sums=('2053997a397309fa10d0b62a3df114ae'
         '71a7b3311f207d6f7d85181e09534824'
         'f8c680c0903124af27ba55c6dd4ee12b')

build() {
  mv "kitgen-$_kit_commit" kitgen
  cd kitgen
  mkdir -p 8.6
  mv ../tk-$_tcltk_tag 8.6/tk
  mv ../tcl-$_tcltk_tag 8.6/tcl
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
