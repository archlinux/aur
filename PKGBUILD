# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philipp Kühn <p dot kuehn at posteo dot de>

pkgname=sioyek-git
pkgver=1.4.0.r12.gbadd7ee
pkgrel=2
epoch=1
pkgdesc="PDF viewer for research papers and technical books."
arch=(x86_64)
license=(GPL3)
url="https://github.com/ahrm/sioyek"
depends=(qt5-base harfbuzz)
makedepends=(git qt5-3d libmupdf mujs gumbo-parser openjpeg2 jbig2dec glu)
provides=(sioyek)
conflicts=(sioyek)
_mupdf=1.19.1
source=("git+https://github.com/ahrm/sioyek.git"
        "https://mupdf.com/downloads/archive/mupdf-${_mupdf}-source.tar.xz")
sha256sums=('SKIP'
            'b5eac663fe74f33c430eda342f655cf41fa73d71610f0884768a856a82e3803e')

pkgver() {
  cd "sioyek"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -r mupdf-${_mupdf}-source/* sioyek/mupdf
}

build() {
  cd "sioyek/mupdf"
  #rm -rf thirdparty/{freeglut,freetype,harfbuzz,jbig2dec,libjpeg,openjpeg,zlib}
  #USE_SYSTEM_LIBS='yes'
  #export USE_SYSTEM_LIBS

  cd ..
  sed -i 's/\/\/#define LINUX_STANDARD_PATHS/#define LINUX_STANDARD_PATHS/' pdf_viewer/main.cpp
  ./build_linux.sh
}

package() {
  cd "sioyek"
  make INSTALL_ROOT="${pkgdir}/" install
  install -D tutorial.pdf -t "${pkgdir}/usr/share/sioyek"
  install -d "${pkgdir}/usr/share/sioyek/shaders"
  cp -r pdf_viewer/shaders/* "${pkgdir}/usr/share/sioyek/shaders"
}
