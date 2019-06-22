# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
####to disable cuda kernel comment out this line
_BUILD_CUDA="on"

name=colmap
#fragment="#commit=5bea89263bf5f3ed623b8e6e6a5f022a0ed9c1de"
fragment="#tag=3.6-dev.2"
pkgname=${name}
pkgver=3.6.dev.2
pkgrel=1
pkgdesc="COLMAP is a general-purpose Structure-from-Motion (SfM) and Multi-View Stereo (MVS) pipeline with a graphical and command-line interface."
arch=('i686' 'x86_64')
url="https://colmap.github.io/"
license=('GPL')
groups=()
depends=('gflags' 'suitesparse' 'freeglut' 'glew' 'google-glog' 'freeimage' 'libjpeg' 'boost-libs' 'qt5-base')
makedepends=('ceres-solver' 'boost' 'git' 'cmake' 'eigen' )
if [ "$_BUILD_CUDA" == "on" ] ; then 
  makedepends+=('cuda-sdk')
  optdepends=('cuda-toolkit: for cuda sfm/mvs acceleration')
fi
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/colmap/colmap.git${fragment}"
        "nvm-export.patch"
        "${pkgname}.install"
        "vocabulary-tree-32K.bin::https://demuc.de/colmap/vocab_tree_flickr100K_words32K.bin"
        "vocabulary-tree-256K.bin::https://demuc.de/colmap/vocab_tree_flickr100K_words256K.bin"
        "vocabulary-tree-1M.bin::https://demuc.de/colmap/vocab_tree_flickr100K_words1M.bin"
        )
md5sums=('SKIP'
         '1542bbbaa7951dbf0b2472354b4b493d'
         'ebb1dc43e014a1e720a06422c6248a40'
         '65b200a06e15205bda713c8553953c50'
         '57e1c8073d9085631911e060c3802bd2'
         '1c27e2a01d243f40f15595d93cfd0981')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname}
  git apply ${srcdir}/nvm-export.patch
}


build() {
  cd ${srcdir}

  export CFLAGS=${CFLAGS/-fno-plt/}
  export CXXFLAGS=${CFLAGS/-fno-plt/}

  # determine whether we can precompile CUDA kernels
    _CUDA_PKG=`pacman -Qsq cuda 2>/dev/null` || true
    if [ -n "$_CUDA_PKG" -a "$_BUILD_CUDA"=="on" ]; then
      _EXTRAOPTS="-DCUDA_ENABLED=ON -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda"
    else
      _EXTRAOPTS="-DCUDA_ENABLED=OFF"
    fi

  mkdir -p build
  cd build
  cmake -DTESTS_ENABLED=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ${_EXTRAOPTS} ../${pkgname}
  make
}


package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install

  # install vocabulary trees for sequential,vocabulary matching
  install -d -m755 ${pkgdir}/usr/share/${name}
  for vocab_tree in ${srcdir}/vocabulary-tree-*.bin ; do
    install -m644 ${vocab_tree} ${pkgdir}/usr/share/${name}/${vocab_tree##*/}
  done
}
# vim:set ts=2 sw=2 et:
