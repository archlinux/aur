# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=mve-git
pkgver=r1316.65f677e
pkgrel=2
pkgdesc="Image-based geometry reconstruction pipeline, structure-from-motion, (shading-aware) multi-view-stereo, surface-reconstruction, texturing,"
arch=('i686' 'x86_64')
url="http://www.gcc.tu-darmstadt.de/home/proj/mve/"
license=('BSD' 'GPL')
groups=()
depends=('libjpeg' 'libtiff' 'libpng' 'libgl' 'qt5-base' 'intel-tbb' 'eigen')
makedepends=('git' 'go-md2man' 'cmake' 'gtest' )
provides=()
options=()
source=("${pkgname}::git+https://github.com/simonfuhrmann/mve.git"
        "${pkgname}-wiki::git+https://github.com/simonfuhrmann/mve.wiki.git"
        "git+https://github.com/nmoehrle/mvs-texturing.git"
        "git+https://github.com/flanggut/smvs.git"
        'gtest.patch'
       )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1077e884f2ed19efefa8b65676ee117d039c66e64b481f7fb5887042b90cb9ae')
_binar=(apps/sfmrecon/sfmrecon
        apps/meshconvert/meshconvert
        apps/meshalign/meshalign
        apps/fssrecon/fssrecon
        apps/mesh2pset/mesh2pset
        apps/bundle2pset/bundle2pset
        apps/dmrecon/dmrecon
        apps/umve/umve
        apps/meshclean/meshclean
        apps/scene2pset/scene2pset
        apps/makescene/makescene
        apps/sceneupgrade/sceneupgrade
)

prepare() {
  cd "${srcdir}"/${pkgname}
  git apply -v "${srcdir}"/gtest.patch
  sed -i '/CXXFLAGS*/s/$/ -msse4.2/' libs/sfm/Makefile
  cd "${srcdir}"/smvs
  sed -i "s:msse4.1:msse4.2:" lib/Makefile tools/Makefile app/Makefile
  sed -i "s:mve:mve-git:" Makefile.inc
  sed -i "s:util/string.h:util/strings.h:" app/smvsrecon.cc
}

pkgver() {
  cd "${srcdir}"/${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  msg "build Multi-view Environment binaries"
  make -C "${srcdir}"/${pkgname}

  msg "build Multi-view Environment Qt gui"
  cd "${srcdir}"/${pkgname}/apps/umve
  qmake
  make -C "${srcdir}"/${pkgname}/apps/umve

  msg "build texrecon"
  cd "${srcdir}"
  warning "* **IMPORTANT**: For research purposes only you can use flag
    cmake -DRESEARCH=ON
    This downloads and links against Olga Veksler et al.'s multi-label
    graph cut optimization, which tends to find better optima and gives better
    texturing results. However, it is patented and can only be licensed for
    non-research purposes by the respective authors. For non-research purposes
    you have to stick to not using the RESEARCH flag. This will use Loopy Belief
    Propagation instead of Graph Cut Optimization."
  export CXXFLAGS+=" -std=c++11"
  cmake -S "${srcdir}"/mvs-texturing -B build-mvs-texturing \
        -DCMAKE_CXX_FLAGS=-std=gnu++11 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  make -C build-mvs-texturing

  msg "build Shading-aware Multi-view Stereo"
  make -C "${srcdir}"/smvs

  msg "build man pages form markdown wiki pages"
  cd "${srcdir}"/${pkgname}-wiki 
  go-md2man -in MVE-Users-Guide.md -out umve.1
  go-md2man -in FSSR-Users-Guide.md -out fssrecon.1
  cd "${srcdir}"/smvs
  go-md2man -in README.md -out smvsrecon.1
}

#check() {
#  msg "test Multi-view Environment"
#  cd ${srcdir}/${pkgname}/tests
#  make 
#  ./test
#  
#  msg "test Shading-aware Multi-view Stereo"
#  cd ${srcdir}/smvs/tests
#  make 
#  ./test
#}

package() {
  cd "${srcdir}"/${pkgname}
  install -Dm644 LICENSE.txt  "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm755 -t "${pkgdir}"/usr/bin "${_binar[@]}"
  install -Dm644 -t "${pkgdir}"/usr/share/umve/shaders apps/umve/shaders/*
  make -C "${srcdir}"/build-mvs-texturing DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/mvs-texturing/LICENSE.txt  "${pkgdir}"/usr/share/licenses/mvs-texturing/LICENSE.txt
  cd "${srcdir}"/${pkgname}-wiki
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 umve.1 fssrecon.1
  cd "${srcdir}"/smvs
  install -Dm755 -t "${pkgdir}"/usr/bin smvsrecon
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/smvs/LICENSE.txt
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 smvsrecon.1
}

# vim:set ts=2 sw=2 et:
