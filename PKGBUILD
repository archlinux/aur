# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=graphite-git
pkgver=1.3.14
pkgrel=1
epoch=1
arch=('x86_64')
url="https://github.com/silnrsi/graphite"
pkgdesc='reimplementation of the SIL Graphite text processing engine'
license=('LGPL' 'GPL' 'custom')
provides=(graphite)
conflicts=(graphite)
depends=('gcc-libs')
makedepends=('cmake' 'freetype2' 'python')
             # for documentation
#             'doxygen' 'dblatex' 'graphviz' 'asciidoc')
checkdepends=('python-fonttools')
options=('!emptydirs')
source=(git+https://github.com/silnrsi/graphite)
sha256sums=('SKIP')

pkgver() {
  cd graphite
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd graphite
  cmake -G "Unix Makefiles" ../graphite \
	-DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE:STRING=Release \
	-DGRAPHITE2_COMPARE_RENDERER=OFF \

  # fix unwanted -O3 cflag (taken form Debian)
#  find . -type f ! -name "rules" ! -name "changelog" -exec sed -i -e 's/\-O3//g' {} \;

  make 
#  make -j1 docs
}

#check() {
#  cd "${srcdir}"/build
#  ctest || true
#}

package() {
  cd graphite
  make DESTDIR="$pkgdir/" install
  # install doc files
 # mkdir -p "${pkgdir}"/usr/share/doc/graphite2/api
 # cp -vrf doc/doxygen/{html,latex/refman.pdf} "${pkgdir}"/usr/share/doc/graphite2/api
 # cp -vrf doc/{GTF,manual}.html "${pkgdir}"/usr/share/doc/graphite2

  # licenses
  mkdir -p "${pkgdir}"/usr/share/licenses/graphite
  install -m644 "${srcdir}"/graphite/COPYING "${pkgdir}"/usr/share/licenses/graphite/
}
