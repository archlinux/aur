# Maintainer: Johannes Wienke <languitar@semipol.de>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=libaxc
pkgver=0.3.2
pkgrel=1
pkgdesc="Client lib for libsignal-protocol-c"
arch=('i686' 'x86_64')
url='https://github.com/gkdr/axc'
license=('GPL3')
makedepends=('git'
	     'setconf'
	     'glib2'
	     'libsignal-protocol-c')
source=("git+https://github.com/gkdr/axc.git#tag=v${pkgver}"
        "build-without-submodule.patch"
	"https://raw.githubusercontent.com/signalapp/libsignal-protocol-c/master/src/session_builder_internal.h")
sha256sums=('SKIP'
            '53a2930e3afacad6f327db70013ccb50ceec6ab96f30794b04b8b5ce9b9cce8f'
            '597c4a197cd7ee6bda8d09f7204ae9b635cd26a78001f9d792470f219ee4a3d4')

prepare() {
  cd "${srcdir}/axc"
  git apply --stat "${srcdir}/build-without-submodule.patch"
  setconf Makefile LDIR="$pkgdir"/usr/lib

}

build() {
  cd "${srcdir}/axc"
  make CFLAGS="-I/usr/include/signal -I/usr/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I${srcdir}"
}

package() {
  cd "${srcdir}/axc"
  install -d "$pkgdir"/usr/include
  install -Dm644 "$srcdir"/session_builder_internal.h src/*.h "${pkgdir}/usr/include"
}
