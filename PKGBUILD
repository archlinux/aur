# Maintainer: bartus szczepaniak <aur@bartus.33mail.com>
name=colmap
pkgname=${name}-git
pkgver=3.1.r20.gb1af506
pkgrel=1
pkgdesc="COLMAP is a general-purpose Structure-from-Motion (SfM) and Multi-View Stereo (MVS) pipeline with a graphical and command-line interface."
arch=('i686' 'x86_64')
url="https://colmap.github.io/"
license=('GPL')
groups=()
depends=('gflags' 'suitesparse' 'freeglut' 'glew' 'google-glog' 'freeimage' 'boost-libs' 'qt5-base')
makedepends=('ceres-solver' 'boost' 'git' 'cmake' 'eigen')
optdepends=('cuda: for cuda sfm/mvs acceleration')
provides=()
options=()
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/colmap/colmap.git"
        "nvm-export.patch"
        "${pkgname}.install"
        "${name}.desktop"
        "vocabulary-tree-64K.bin::https://demuc.de/colmap/vocab_tree-65536.bin"
        "vocabulary-tree-256K.bin::https://demuc.de/colmap/vocab_tree-262144.bin"
        "vocabulary-tree-1M.bin::https://demuc.de/colmap/vocab_tree-1048576.bin"
        )
md5sums=('SKIP'
         '8a9f76c21ae93e5f5571f372f5401423'
         'ebb1dc43e014a1e720a06422c6248a40'
         '55d81534d969cf706719007462f20443'
         '3521ff3c601596473c6ce5256772f606'
         'e423daecc45d56b749d25eeace9de1c8'
         '7ec70d4137d9b7ca9f076df34808ccc7')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname}
  patch -Np1 -i ../nvm-export.patch
}


build() {
  cd ${srcdir}/${pkgname}
  
  # determine whether we can precompile CUDA kernels
    _CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
    if [ "$_CUDA_PKG" != "" ]; then
      _EXTRAOPTS="-DCUDA_ENABLED=ON -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda"
    fi

  mkdir -p build
  cd build
  #export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe"
  #export CXXFLAGS="${CFLAGS}"
  cmake -DTESTS_ENABLED=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ${_EXTRAOPTS} ../
  make
}


package() {
  cd ${srcdir}/${pkgname}/build
  make DESTDIR=${pkgdir} install

  # install desktop entry
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/${name}.desktop" "${pkgdir}/usr/share/applications"
  sed -i "s#Version=.*#Version=$pkgver#" "${pkgdir}/usr/share/applications/${name}.desktop"
  
  # install vocabulary trees for sequential,vocabulary matching
  install -d -m755 ${pkgdir}/usr/share/${name}
  for vocab_tree in ${srcdir}/vocabulary-tree-*.bin ; do
    install -m644 ${vocab_tree} ${pkgdir}/usr/share/${name}/${vocab_tree##*/}
  done
}
# vim:set ts=2 sw=2 et:
