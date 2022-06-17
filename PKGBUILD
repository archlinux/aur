#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

## Configuration env vars:
_BUILD_CUDA="${_BUILD_CUDA:-ON}"
_CUDA_ARCH="${_CUDA_ARCH:-Auto}"

_name=colmap
#fragment="#commit=5bea89263bf5f3ed623b8e6e6a5f022a0ed9c1de"
_fragment="#tag=3.6"
pkgname=${_name}
pkgver=3.6
pkgrel=1
pkgdesc="General-purpose Structure-from-Motion (SfM) and Multi-View Stereo (MVS) pipeline with a graphical and command-line interface."
arch=('i686' 'x86_64')
url="https://colmap.github.io/"
license=('GPL')
groups=()
depends=('cgal' 'ceres-solver' 'gflags' 'suitesparse' 'freeglut' 'glew' 'google-glog' 'freeimage' 'libjpeg' 'boost-libs' 'qt5-base')
makedepends=('boost' 'cmake' 'eigen' 'git' 'ninja' 'python-sphinx' )
if [ "$_BUILD_CUDA" == "ON" ] ; then 
  makedepends+=('cuda-sdk')
  optdepends+=('cuda-toolkit: for cuda sfm/mvs acceleration')
fi
source=("${pkgname}::git+https://github.com/colmap/colmap.git${_fragment}"
        "nvm-export.patch"
        "gcc9.patch"
        "cuda11_gcc11.patch"
        "vocabulary-tree-32K.bin::https://demuc.de/colmap/vocab_tree_flickr100K_words32K.bin"
        "vocabulary-tree-256K.bin::https://demuc.de/colmap/vocab_tree_flickr100K_words256K.bin"
        "vocabulary-tree-1M.bin::https://demuc.de/colmap/vocab_tree_flickr100K_words1M.bin"
        )
sha256sums=('SKIP'
            'd8985b9af868edfc50f69257faf132f959398437758ccb6baa266a1bbddb3b36'
            '531181351f30cfcb531fc961439152840048ff4fa71a27b1efae46421f1ab686'
            '4b76da280b2c81ddb760e813d2c27c6b932790cc9aabaadbd0a917a6b57cfdfd'
            'd37d8f19ee0a49705c4c0b06967a08cedfed5cf86519eada3271497256732bc2'
            'd2055600452a531b5b0a62aa5943e1a07195273dc4eeebcf23d3a924d881d53a'
            'fb60f7ba8081ee5c278f03c62329a374d1b24136b374a49393b453db1529a8c6')

prepare() {
  git -C "$pkgname" apply -v "$srcdir"/*.patch
}


build() {
  # determine whether we can precompile CUDA kernels
    _CUDA_PKG=$(pacman -Qsq cuda 2>/dev/null) || true
    if [[ -n "$_CUDA_PKG" && "$_BUILD_CUDA" == "ON" ]]; then
  # determine whether we need to define cuda host compiler
      if _cuda_gcc=$(readlink /opt/cuda/bin/gcc) ; then
        [ -f "$_cuda_gcc" ] && export CUDAHOSTCXX="$_cuda_gcc"
      fi
      _CMAKE_FLAGS+=( -DCUDA_ENABLED=ON
                      -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda
                      -DCUDA_ARCHS="$_CUDA_ARCH"
                    )
    else
      _CMAKE_FLAGS+=( -DCUDA_ENABLED=OFF )
    fi

  _CMAKE_FLAGS+=( -DTESTS_ENABLED=OFF
                  -DCMAKE_BUILD_TYPE=Release
                  -DCMAKE_INSTALL_PREFIX=/usr )
  cmake "${_CMAKE_FLAGS[@]}" -G Ninja -S "$pkgname" -B build
# shellcheck disable=SC2046 # allow MAKEFLAGS to carry multiple flags.
  ninja -C "$srcdir/build" $(grep -oP -- '-+[A-z]+ ?[0-9]*'<<<"${MAKEFLAGS:--j1}")
}


package() {
  DESTDIR="${pkgdir}" ninja -C build install

# build manpage
  make -C "${pkgname}/doc" man BUILDDIR="$PWD" && \
  install -Dm644 man/colmap.1 -t "${pkgdir}/usr/share/man/man1"

  # install vocabulary trees for sequential,vocabulary matching
  install -d -m755 "${pkgdir}/usr/share/${_name}"
  for vocab_tree in "${srcdir}"/vocabulary-tree-*.bin ; do
    install -m644 "${vocab_tree}" "${pkgdir}/usr/share/${_name}/${vocab_tree##*/}"
  done
}
# vim:set ts=2 sw=2 et:
