# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>
# Contributor: speps <speps [at] aur [dot] archlinux [dot] org>

pkgname=glfw2
pkgver=2.7.9
pkgrel=3
pkgdesc="A free, open source, portable framework for OpenGL application development (LEGACY 2.x)"
arch=('i686' 'x86_64')
url="http://www.glfw.org/"
license=('ZLIB')
depends=('glu' 'libgl' 'libxrandr')
makedepends=('mesa' 'texlive-latexextra')
source=("${pkgname%2}-${pkgver}.tar.gz::https://github.com/glfw/glfw-legacy/archive/${pkgver}.tar.gz")
sha512sums=('ccbe2f8c90359b83e8ee94a7ba8df293f5366accad8689cf9dba630c61bded18db0d18c020d72c67e422b4c0a3bd3b8311d6ebe65ba28c1e6739fa4ed2b53ab9')

prepare() {
  cd "glfw-legacy-${pkgver}"
  sed -i 's/glfw\.so/glfw2.so/g' compile.sh lib/x11/Makefile.x11.in
  sed -i 's/lglfw/&2/' compile.sh
}

build() {
  cd "glfw-legacy-${pkgver}"
  export LFLAGS+="-lrt"
  make x11
  cd docs
  make
}

package() {
  cd "glfw-legacy-${pkgver}"
  make PREFIX="${pkgdir}/usr" x11-dist-install

  # Documentation.
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 docs/glfwrm.pdf "${pkgdir}/usr/share/doc/${pkgname}/Reference.pdf"
  install -Dm644 docs/glfwug.pdf "${pkgdir}/usr/share/doc/${pkgname}/UsersGuide.pdf"

  # License.
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Fix .pc file prefix path
  sed -i "s|${pkgdir}||g" "${pkgdir}/usr/lib/pkgconfig/libglfw.pc"
}
