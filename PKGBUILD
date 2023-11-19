# Maintainer: entshuld <edgar (not at) openmail [d] cc}
# Contributor: gborzi <gborzi@ieee.org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: mickele <mimocciola@yahoo.com>
_base='gmsh'
pkgname=("${_base}-git" "${_base}-git-docs")
pkgver=4.12.0.a5f115d42
pkgrel=1
pkgdesc="An automatic 3D finite element mesh generator with pre and post-processing facilities."
arch=('x86_64')
url="https://gmsh.info"
license=('custom')
makedepends=('cmake' 'desktop-file-utils' 'sed' 'swig' 'texlive-basic' 'voro++'
             'fltk' 'med-openmpi' 'opencascade' 'cairo' 'metis' 'alglib' 'ann'
             'glu' 'cgns' 'lapack')
options=(!emptydirs !staticlibs)
source=("git+https://gitlab.onelab.info/gmsh/gmsh.git#branch=master"
        gmsh.desktop
        gmsh.completion)
sha256sums=('SKIP'
            '43a8ca33ac917ee7196fdae305ff2c8cb9ae1072569ee546c0ce8ff580c966ae'
            '11605e97636a56cf51e445e65019526ee253bd2e0553fb71ba6d94488dcd34ef')

pkgver() {
   cd "${srcdir}/${_base}"
   # # Actually, the version in the CMakeLists.txt, opt_general.texi, gmsh/api/gmsh.py is 4.12.0 and libgmsh.so -> libgmsh.so.4.12
   # "$(git describe --tags | sed 's/gmsh_//g;s/[-_]/./g')" \
   printf "%s.%s" \
            "$(awk '/GMSH_API_VERSION /{gsub(/"/,""); print $NF}' api/gmsh.h)" \
            "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "${srcdir}/${_base}"

   # Help links to local doc (package gmsh-docs)
   sed -e "s|https://gmsh.info/doc/texinfo/|file:///usr/share/doc/gmsh/|" \
       -i src/fltk/graphicWindow.cpp
   sed -e "s|https://gmsh.info/dev/doc/texinfo/|file:///usr/share/doc/gmsh/|" \
       -i src/fltk/graphicWindow.cpp
   sed -e "s|https://gmsh.info/|file:///usr/share/licenses/gmsh/|" \
       -i src/fltk/helpWindow.cpp
}

build() {
   cd "${srcdir}/${_base}"

   mkdir -p build

   cd build

   cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DENABLE_BUILD_SHARED=ON \
         -DENABLE_SYSTEM_CONTRIB=ON -DENABLE_BLAS_LAPACK=ON \
         -DENABLE_CGNS=ON -DENABLE_ANN=ON -DENABLE_ALGLIB=ON \
         -DENABLE_METIS=ON -DENABLE_OCC=ON -DENABLE_MED=ON \
         -DENABLE_VOROPP=ON -DENABLE_EIGEN=ON -DENABLE_PETSC=TRUE \
         -DOpenGL_GL_PREFERENCE="GLVND" \
         -DENABLE_NUMPY=ON \
         -DENABLE_MUMPS=ON \
         -DCMAKE_CXX_COMPILER=mpicxx -DCMAKE_C_COMPILER=mpicc ..

   make
   LC_ALL=C make doc
}

package_gmsh-git() {
   depends=('fltk' 'med-openmpi' 'opencascade' 'cairo' 'metis' 'alglib' 'ann'
            'glu' 'cgns' 'lapack')
   optdepends=('gmsh-docs: docs for gmsh'
               'python: for gmsh.py'
               'julia: for gmsh.jl')
   provides=(${_base})
   conflicts=(${_base})

   cd "${srcdir}/${_base}/build"
   make DESTDIR=${pkgdir} install
   install -D -m644 "${pkgdir}/usr/lib/gmsh.py" "${pkgdir}/usr/share/gmsh/api/python/gmsh.py"
   PYVER="$(/usr/bin/python3 -c 'import sys; print("{}.{}".format(sys.version_info.major,sys.version_info.minor))')"
   install -d "${pkgdir}/usr/lib/python${PYVER}/site-packages/"
   ln -s "${pkgdir}/usr/share/gmsh/api/python/gmsh.py" "${pkgdir}/usr/lib/python${PYVER}/site-packages/"
   install -D -m644 "${pkgdir}/usr/lib/gmsh.jl" "${pkgdir}/usr/share/gmsh/api/julia/gmsh.jl"
   rm -f "${pkgdir}/usr/lib/gmsh.py" "${pkgdir}/usr/lib/gmsh.jl"
   install -d "$pkgdir/etc/profile.d"
   echo 'export JULIA_LOAD_PATH="/usr/share/gmsh/api/julia/:$JULIA_LOAD_PATH"' > "$pkgdir/etc/profile.d/gmsh.sh"
   echo 'setenv JULIA_LOAD_PATH "/usr/share/gmsh/api/julia/:$JULIA_LOAD_PATH"' > "$pkgdir/etc/profile.d/gmsh.csh"

   gmshlib="$(ls "${pkgdir}"/usr/lib/*.so.* | head -n1)"
   ln -rs "${gmshlib}" "${pkgdir}"/usr/share/gmsh/api/python/
   ln -rs "${gmshlib}" "${pkgdir}"/usr/share/gmsh/api/julia/

   install -d "${pkgdir}/usr/share/pixmaps/${_base}"
   install -m644 ../utils/icons/*.png "${pkgdir}/usr/share/pixmaps/${_base}"
   install -D -m644 ../utils/icons/gmsh-no-text.png "${pkgdir}/usr/share/icons/${_base}.png"

   desktop-file-install --dir="${pkgdir}/usr/share/applications" \
    	                "${srcdir}/${_base}.desktop"

   install -D -m 644 "../LICENSE.txt" "${pkgdir}/usr/share/licenses/${_base}/LICENSE.txt"
   install -D -m 644 "../CREDITS.txt" "${pkgdir}/usr/share/licenses/${_base}/CREDITS.txt"
   install -D -m644 $srcdir/gmsh.completion $pkgdir/etc/bash_completion.d/gmsh

   [[ ! -d ${srcdir}/doc ]] && mkdir ${srcdir}/doc
   mv ${pkgdir}/usr/share/doc/* ${srcdir}/doc
}

package_gmsh-git-docs() {
   pkgdesc="TXT, HMTL and PDF doc for Gmsh"
   arch=('any')
   license=('GPL2')
   provides=(gmsh-docs)
   conflicts=(gmsh-docs)

   mkdir -p "${pkgdir}/usr/share/"
   # Depends on package_gmsh-git()
   [[ -d "${srcdir}/doc/${_base}" ]] &&
     mv "${srcdir}/doc" "${pkgdir}/usr/share/"

   cd "${srcdir}/${_base}/build"
   # # -doc.tgz was already built
   # make doc
   bsdtar -xf ${_base}-${pkgver%%.*}.*-doc.tgz

   cd "doc/texinfo"

   install -D -m644 gmsh.html "${pkgdir}/usr/share/doc/gmsh/gmsh.html"
   install -D -m644 gmsh.txt "${pkgdir}/usr/share/doc/gmsh/gmsh.txt"
   install -D -m644 gmsh.pdf "${pkgdir}/usr/share/doc/gmsh/gmsh.pdf"
   install -D -m644 gmsh.info "${pkgdir}/usr/share/info/gmsh.info"
}
