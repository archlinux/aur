# Maintainer: bartus szczepaniak <aur@bartus.33mail.com>
pkgname=mve-git
pkgver=r1077.cab91ca
pkgrel=2
pkgdesc="Image-based geometry reconstruction pipeline, structure-from-motion, multi-view-stereo, surface-reconstruction, texturing"
arch=('i686' 'x86_64')
url="http://www.gcc.tu-darmstadt.de/home/proj/mve/"
license=('BSD' 'GPL')
groups=()
depends=('libjpeg' 'libtiff' 'libpng' 'libgl' 'qt5-base')
makedepends=('git' 'go-md2man' 'gcc5' 'cmake' 'gtest')
provides=()
options=()
source=("${pkgname}::git+https://github.com/simonfuhrmann/mve.git"
        "${pkgname}-wiki::git+https://github.com/simonfuhrmann/mve.wiki.git"
        "git+https://github.com/nmoehrle/mvs-texturing.git"
        'gtest.patch')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '71bd51725466027d43aa3b6ec4468249')
_binar="apps/sfmrecon/sfmrecon
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
apps/sceneupgrade/sceneupgrade"

prepare() {
  cd ${srcdir}/${pkgname}
  patch -Np1 -i ../gtest.patch
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}

  msg "build cli applications"
  make

  msg "build qt quit"
  cd apps/umve
  qmake
  make

  msg "build testrecon"
  warning "* **IMPORTANT**: For research purposes only you can use
    cmake -DRESEARCH=ON
    instead. This downloads and links against Olga Veksler et al.'s multi-label
    graph cut optimization, which tends to find better optima and gives better
    texturing results. However, it is patented and can only be licensed for
    non-research purposes by the respective authors. For non-research purposes
    you have to stick to not using the RESEARCH flag. This will use Loopy Belief
    Propagation instead of Graph Cut Optimization."  
  cd ${srcdir}/mvs-texturing
  mkdir -p build
  cd build
  cmake -DCMAKE_CXX_COMPILER=/usr/bin/g++-5 -DCMAKE_C_COMPILER=/usr/bin/gcc-5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ../
  make

  msg "build man pages form markdown wiki pages"
  cd ${srcdir}/${pkgname}-wiki 
  go-md2man -in MVE-Users-Guide.md -out umve.1
  go-md2man -in FSSR-Users-Guide.md -out fssrecon.1
}

check() {
  cd ${srcdir}/${pkgname}/tests
  make 
  ./test
}

package() {
  cd ${srcdir}/${pkgname}
  install -Dm644 LICENSE.txt  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm755 -t ${pkgdir}/usr/bin ${_binar}
  install -Dm644 -t ${pkgdir}/usr/share/umve/shaders apps/umve/shaders/*
  cd ${srcdir}/mvs-texturing/build
  make DESTDIR=${pkgdir} install
  install -Dm644 ../LICENSE.txt  ${pkgdir}/usr/share/licenses/mvs-texturing/LICENSE.txt
  cd ${srcdir}/${pkgname}-wiki
  install -Dm644 -t ${pkgdir}/usr/share/man/man1 umve.1 fssrecon.1
}

# vim:set ts=2 sw=2 et:
