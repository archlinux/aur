# Maintainer: mickael9 <mickael9 at gmail dot com>
# Contributor: Grey Christoforo <grey@christoforo.net>
pkgname=lib32-tclkit
pkgver=8.6.4
_tcl_tag=potential_incompatibility
_tk_tag=core_8_6_4
_kit_commit=c21eeb1e379bd5acb5b304f0784877b8e8dd31ca
pkgrel=1
pkgdesc="single-file executable that provides a complete Tcl and Tk runtime (32 bits version)"
arch=('x86_64')
url="https://github.com/patthoyts/kitgen"
options=(!buildflags !makeflags !strip)
license=('custom')
makedepends=('upx')
provides=(tclkit)
conflicts=(tclkit)

source=("tclkit.tar.gz::https://github.com/patthoyts/kitgen/archive/${_kit_commit}.tar.gz"
	"tk.tar.gz::https://github.com/tcltk/tk/archive/${_tk_tag}.tar.gz"
	"tcl.tar.gz::https://github.com/tcltk/tcl/archive/${_tcl_tag}.tar.gz"
	"kitgen-cflags-quoting.patch")
md5sums=('2053997a397309fa10d0b62a3df114ae'
         '25c2e90900e44ea851f891cbb232ca2c'
         'd442eacfbf4932a0a956ecab5c362af1'
         '36c54854ce1992944eed7671f8742bad')

prepare() {
  cd "kitgen-$_kit_commit"
  patch -Np1 < "../kitgen-cflags-quoting.patch"
}

build() {
  cd "kitgen-$_kit_commit"
  mkdir -p 8.6
  ln -sf ../../tk-$_tk_tag 8.6/tk
  ln -sf ../../tcl-$_tcl_tag 8.6/tcl
  local options="thread allenc cli dyn"
  ./config.sh 8.6/kit-large thread allenc cli dyn
  make -C 8.6/kit-large CFLAGS="-m32 -O2"
}

package() {
  cd "kitgen-$_kit_commit"
  mkdir -p "$pkgdir"/usr/bin
  install -o root -g root 8.6/kit-large/tclkit-* "$pkgdir/usr/bin/"
  ln -s tclkit-cli "$pkgdir/usr/bin/tclkit"
}
