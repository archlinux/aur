# Maintainer: gborzi <gborzi@ieee.org>
# Contributor: mickele <mimocciola@yahoo.com>
pkgname=gmsh
pkgver=2.14.1
pkgrel=1
pkgdesc="An automatic 3D finite element mesh generator with pre and post-processing facilities."
arch=('i686' 'x86_64')
url="http://www.geuz.org/gmsh/"
license=('custom')
depends=('fltk' 'lapack' 'med' 'opencascade' 'cairo')
makedepends=('cmake' 'desktop-file-utils' 'sed' 'swig')
optdepends=('gmsh-docs: docs for gmsh'
            'python2: for onelab.py'
            'python: for onelab.py')
options=(!emptydirs)
source=("${url}src/${pkgname}-${pkgver}-source.tgz" gmsh.desktop gmsh.completion)
md5sums=('8666d1b7df328827e35f62e790ef81c9'
         '28272d41da2675f259d8f38f5466a88b'
         '9ee4b5bf27956de5aa412bbc939660d3')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}-source"

   # Help links to local doc (package gmsh-docs)
   sed -e "s|http://gmsh.info/doc/texinfo/|file:///usr/share/doc/gmsh/gmsh.html|" \
       -i Fltk/graphicWindow.cpp
   sed -e "s|http://gmsh.info/doc/|file:///usr/share/licenses/gmsh/|" \
       -i Fltk/helpWindow.cpp

   mkdir -p build

   cd build

   cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DENABLE_BUILD_SHARED=ON \
      -DENABLE_PETSC=FALSE .. 

   make
}

package() {

   cd "${srcdir}/${pkgname}-${pkgver}-source/build"
   make DESTDIR=${pkgdir} install
   install -D -m644 "${pkgdir}/usr/bin/onelab.py" "${pkgdir}/usr/lib/python2.7/site-packages/onelab.py"
   install -D -m644 "${pkgdir}/usr/bin/onelab.py" "${pkgdir}/usr/lib/python3.5/site-packages/onelab.py"
   rm "${pkgdir}/usr/bin/onelab.py"

   install -d "${pkgdir}/usr/share/pixmaps/${pkgname}"
   install -m644 ../utils/icons/*.png "${pkgdir}/usr/share/pixmaps/${pkgname}"

   desktop-file-install --dir="${pkgdir}/usr/share/applications" \
    	"${srcdir}/${pkgname}.desktop"

   install -D -m 644 "../doc/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
   install -D -m 644 "../doc/CREDITS.txt" "${pkgdir}/usr/share/licenses/$pkgname/CREDITS.txt"
   install -D -m644 $srcdir/gmsh.completion $pkgdir/etc/bash_completion.d/gmsh

   rm -rf ${pkgdir}/usr/share/doc
}
