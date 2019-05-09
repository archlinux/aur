_pkgname=ccache
pkgname=${_pkgname}-git
pkgver=v3.7.1_14_g6e25ea2
pkgrel=1
pkgdesc="a fast compiler cache"
arch=('i686' 'x86_64')
url="https://ccache.dev"
license=('GPL3')
depends=('zlib')
makedepends=('git' 'asciidoc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/ccache/ccache.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe | sed 's/[- ]/_/g'
}

build() {
  cd ${srcdir}/${_pkgname}
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
  make docs
}

check() {
  cd ${srcdir}/${_pkgname}
  make check
}

package() {
  cd ${srcdir}/${_pkgname}

  install -Dm 755 ccache -t "${pkgdir}/usr/bin"
  install -Dm 644 doc/ccache.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 doc/{AUTHORS,MANUAL,NEWS}.adoc README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 LICENSE.{adoc,html} -t "${pkgdir}/usr/share/licenses/${_pkgname}"

  install -d "${pkgdir}/usr/lib/ccache/bin"
  local _prog
  for _prog in gcc g++ c++; do
    ln -s /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/$_prog"
    ln -s /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/${CHOST}-$_prog"
  done
  for _prog in cc clang clang++; do
    ln -s /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/$_prog"
  done
}
