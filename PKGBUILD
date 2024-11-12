# Maintainer: envolution
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: perlawk

pkgname=dlib-cuda-git
_pkgname=dlib
pkgver=19.24.6+r8287+g39240959f
pkgrel=2
pkgdesc="Cross-platform C++ library using contract programming and modern C++ techniques"
arch=('x86_64')
url="http://dlib.net"
license=('BSL-1.0')
depends=('cblas'
         'lapack'
         'blas'
         'libjpeg-turbo'
         'libjxl'
         'libpng'
         'libwebp'
         'libx11'
         'cuda'
         'cudnn'
)
optdepends=('ffmpeg: for FFmpeg support'
            'giflib: for GIF support'
            'sqlite: for sqlite support')
makedepends=('cmake' 'ninja')
source=(
  "${_pkgname}::git+https://github.com/davisking/dlib.git"
)
sha256sums=('SKIP')
pkgver(){
  cd "${_pkgname}"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1 )
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

build() {
    #Test avx capabilities
    grep -q 'flags.*avx' /proc/cpuinfo && _AVX=ON || _AVX=OFF
    mkdir -p build && cd build
    cmake -GNinja \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_AVX_INSTRUCTIONS=$_AVX \
        -DDLIB_USE_CUDA=ON \
        "../${_pkgname}"
    ninja ${MAKEFLAGS:--j1}
}

package() {
    cd "build"
    DESTDIR=${pkgdir} ninja install
    install -Dm644 "../${_pkgname}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    # remove redundant external libraries
    rm -r "${pkgdir}/usr/include/dlib/external"
}
