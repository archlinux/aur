_pkgname=ccache
pkgname=${_pkgname}-git
pkgver=v3.7.1_1007_gdec7a318
pkgrel=1
pkgdesc="a fast compiler cache"
arch=('i686' 'x86_64')
url="https://ccache.dev"
license=('GPL3')
depends=('zlib' 'libb2')
makedepends=('cmake' 'git' 'asciidoc')
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
  cmake -B build -S . \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DCMAKE_INSTALL_SYSCONFDIR='/etc'
  make -C build
  make -C build doc-html
  make -C build doc-man-page
}

check() {
  cd ${srcdir}/${_pkgname}
  make -C build check
}

package() {
  cd ${srcdir}/${_pkgname}

  install -Dm 755 build/ccache -t "${pkgdir}/usr/bin"
  install -Dm 644 build/doc/ccache.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 build/doc/{AUTHORS,MANUAL,NEWS}.html README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 build/doc/LICENSE.html -t "${pkgdir}/usr/share/licenses/${_pkgname}"

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
