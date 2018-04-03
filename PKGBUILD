# Maintainer: bartus szczepaniak <aur@bartus.33mail.com>

####to disable cuda kernel comment out this line
_BUILD_CUDA="on"

name=colmap
#fragment="#commit=5bea89263bf5f3ed623b8e6e6a5f022a0ed9c1de"
fragment="#branch=dev"
pkgname=${name}-git
pkgver=3.4.r44.g827bbb8
pkgrel=2
pkgdesc="COLMAP is a general-purpose Structure-from-Motion (SfM) and Multi-View Stereo (MVS) pipeline with a graphical and command-line interface."
arch=('i686' 'x86_64')
url="https://colmap.github.io/"
license=('GPL')
groups=()
depends=('gflags' 'suitesparse' 'freeglut' 'glew' 'google-glog' 'freeimage' 'boost-libs' 'qt5-base')
makedepends=('ceres-solver' 'boost' 'git' 'cmake' 'eigen' )
if [ "$_BUILD_CUDA" == "on" ] ; then 
  makedepends+=('cuda')
  optdepends=('cuda: for cuda sfm/mvs acceleration')
  # Fix: -fno-plt flag not supported by cuda host compiler (gcc5)
  options=(!buildflags)
  CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong"
  CXXFLAGS="${CFLAGS}"
fi
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/colmap/colmap.git${fragment}"
        "nvm-export.patch"
        "${pkgname}.install"
        "vocabulary-tree-64K.bin::https://demuc.de/colmap/vocab_tree-65536.bin"
        "vocabulary-tree-256K.bin::https://demuc.de/colmap/vocab_tree-262144.bin"
        "vocabulary-tree-1M.bin::https://demuc.de/colmap/vocab_tree-1048576.bin"
        )
md5sums=('SKIP'
         '3c0027625739e972f8af8bea6f557b35'
         'ebb1dc43e014a1e720a06422c6248a40'
         '3521ff3c601596473c6ce5256772f606'
         'e423daecc45d56b749d25eeace9de1c8'
         '7ec70d4137d9b7ca9f076df34808ccc7')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname}
  git apply ${srcdir}/nvm-export.patch
}


build() {
  cd ${srcdir}

  # determine whether we can precompile CUDA kernels
    _CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
    if [ -n "$_CUDA_PKG" -a "$_BUILD_CUDA"=="on" ]; then
      _EXTRAOPTS="-DCUDA_ENABLED=ON -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda -DCUDA_NVCC_FLAGS=\"--compiler-options -fPIC\"" 
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
