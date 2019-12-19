# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
####to disable cuda kernel comment out this line
_BUILD_CUDA="on"

name=colmap
#fragment="#commit=5bea89263bf5f3ed623b8e6e6a5f022a0ed9c1de"
fragment="#tag=3.6-dev.2"
pkgname=${name}
pkgver=3.6dev3
pkgrel=1
pkgdesc="COLMAP is a general-purpose Structure-from-Motion (SfM) and Multi-View Stereo (MVS) pipeline with a graphical and command-line interface."
arch=('i686' 'x86_64')
url="https://colmap.github.io/"
license=('GPL')
groups=()
depends=('gflags' 'ceres-solver' 'cgal' 'suitesparse' 'freeglut' 'glew' 'google-glog' 'freeimage' 'libjpeg' 'boost-libs' 'qt5-base')
makedepends=('boost' 'git' 'cmake' 'eigen' )
if [ "$_BUILD_CUDA" == "on" ] ; then 
  makedepends+=('cuda-sdk')
  optdepends=('cuda-toolkit: for cuda sfm/mvs acceleration')
fi
source=("${pkgname}::git+https://github.com/colmap/colmap.git${fragment}"
        "nvm-export.patch"
        "gcc9.patch"
        "vocabulary-tree-32K.bin::https://demuc.de/colmap/vocab_tree_flickr100K_words32K.bin"
        "vocabulary-tree-256K.bin::https://demuc.de/colmap/vocab_tree_flickr100K_words256K.bin"
        "vocabulary-tree-1M.bin::https://demuc.de/colmap/vocab_tree_flickr100K_words1M.bin"
        )
sha256sums=('SKIP'
            'd8985b9af868edfc50f69257faf132f959398437758ccb6baa266a1bbddb3b36'
            'ff3e0c03ee756c68ca8d120f46be0722cf15a41c64329062c5f87dddbf7b4392'
            'd37d8f19ee0a49705c4c0b06967a08cedfed5cf86519eada3271497256732bc2'
            'd2055600452a531b5b0a62aa5943e1a07195273dc4eeebcf23d3a924d881d53a'
            'fb60f7ba8081ee5c278f03c62329a374d1b24136b374a49393b453db1529a8c6')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname}
  git apply -v ${srcdir}/*.patch
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
