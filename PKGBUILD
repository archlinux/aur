# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="graphviz"
pkgname="lib32-${_name}"
pkgver=12.2.1
pkgrel=1
pkgdesc="Graph visualization software (32-bit)"
arch=('x86_64')
url="https://www.graphviz.org"
_url="https://gitlab.com/${_name}/${_name}"
license=('EPL-1.0')
depends=("${_name}>=${pkgver}" 'lib32-expat' 'lib32-gcc-libs' 'lib32-glibc'
         'lib32-libltdl' 'lib32-zlib')
makedepends=('python')
provides=('libcdt.so' 'libcgraph.so' 'libgvc.so' 'libgvpr.so' 'libpathplan.so'
          'libxdot.so')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${pkgver}/${_pkgsrc}.tar.gz"
        'ghostscript918.patch'
        "${_name}_only_target_libraries.patch")
sha256sums=('91d444b4dabdaf5bfa7c6fcc3a1ee5d41e588af6079ebc030f0acb79e48a56ea'
            '0083d126e27f2223ec4226fc1d71c9c84106968a0fdf65de838aee1e4882bfdb'
            '164ee1632c018ba45cd391b8dbe5b672b73ddcfe86a9fa0796986ab4db5ece5b')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/ghostscript918.patch"
  patch -Np1 -i "${srcdir}/${_name}_only_target_libraries.patch"

  # find . -type f -name 'Makefile.am' -exec \
  #   sed -e '/pkginclude_HEADERS/d' \
  #       -e '/dist_man_MANS/d' \
  #       -e '/dist_doc_DATA/d' \
  #       -i "{}" +
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
	./autogen.sh NOCONFIG
  ./configure \
    --prefix='/usr' \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --enable-d=no \
    --enable-go=no \
    --enable-guile=no \
    --enable-java=no \
    --enable-javascript=no \
    --enable-lua=no \
    --enable-man-pdfs=no \
    --enable-perl=no \
    --enable-php=no \
    --enable-python=no \
    --enable-python3=no \
    --enable-r=no \
    --enable-ruby=no \
    --enable-sharp=no \
    --enable-swig=no \
    --enable-tcl=no \
    --with-ann=no \
    --with-demos=no \
    --with-devil=no \
    --with-digcola=no \
    --with-freetype2=no \
    --with-gdiplus=no \
    --with-gdk=no \
    --with-gdk-pixbuf=no \
    --with-ghostscript=no \
    --with-glade=no \
    --with-glut=no \
    --with-gtk=no \
    --with-gtkgl=no \
    --with-gtkglext=no \
    --with-gts=no \
    --with-ipsepcola=no \
    --with-lasi=no \
    --with-libgd=no \
    --with-ortho=no \
    --with-pangocairo=no \
    --with-poppler=no \
    --with-qt=no \
    --with-rsvg=no \
    --with-sfdp=no \
    --with-smyrna=no \
    --with-webp=no
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' 'libtool' # Fix overlinking
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "lib" "share"
}
