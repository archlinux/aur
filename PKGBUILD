# Maintainer: Tobias Boesch <tobias.boesch at googlemail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_originalpkgname='protobuf'
pkgname=('libprotobuf-compat-32')
pkgver=21.12
pkgrel=1
pkgdesc="Compatibility package for Protocol Buffers - Google's data interchange format to provide version 32 of libprotobuf.so"
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=(
  'gcc-libs'
  'glibc'
  'zlib'
)
makedepends=(
  'cmake'
  'gtest'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  python-pytest
)
source=(https://github.com/protocolbuffers/protobuf/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        $_originalpkgname-21.12-python3.11.patch::https://github.com/protocolbuffers/protobuf/commit/da973aff2adab60a9e516d3202c111dbdde1a50f.patch
        $_originalpkgname-21.12-pep517.patch  # let's not call setup.py like a script and just build...
        https://github.com/protocolbuffers/protobuf/commit/101b6199.patch)
sha512sums=('2dc8f552388438268d8b9f7a9e84c6abf1736be3d5031438c789c317410c9f4b5cedd25bf7da6d67b3ba32ca890869f9ddaab2284d6ac0e734a5b135ffbb1346'
            '43772fd33bfd05eefe89a6400987453fe25745e314dd8a0b4e67bc27ff1a433fa0bbeb4ac4a34cfac1f2e62c13ae97b8c45d5dadd28816272cdb5fc0db03b9e4'
            'a297e74ee4f807b3fad7da7d0de6dd9647963521be66cd2a2370343f5bd191cbb38759157ac0cdb161a5893a30a10520a5098e88a292c800859af33db5cf7a41'
            'acc38a761cb164caf4c9fcb6181be999ce95899658cefd3253f6104c13265a595bb5e671b9df959ac88d2044f8c21f1e29796e9f7a772291b44d2eaab7723645')

prepare() {
  patch -d $_originalpkgname-$pkgver -Rp1 < 101b6199.patch # Revert ABI break
  patch -Np1 -d $_originalpkgname-$pkgver -i ../$_originalpkgname-21.12-python3.11.patch
  patch -Np1 -d $_originalpkgname-$pkgver -i ../$_originalpkgname-21.12-pep517.patch
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D protobuf_BUILD_SHARED_LIBS=ON
    -D protobuf_USE_EXTERNAL_GTEST=ON
    -S $_originalpkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose

  ln -rs build $_originalpkgname-$pkgver/src/.libs
  cd $_originalpkgname-$pkgver/python
  PROTOC="$srcdir"/build/protoc \
  python -m build --wheel --no-isolation
}

check() {
  cmake --build build --target check
}

package() {
  provides=('libprotobuf.so' 'libprotobuf.so')
  
  DESTDIR="$pkgdir" cmake --install build

  cd $_originalpkgname-$pkgver
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 editors/protobuf-mode.el \
    -t "$pkgdir/usr/share/emacs/site-lisp/"
  install -vDm 644 editors/proto.vim \
    -t "${pkgdir}/usr/share/vim/vimfiles/syntax"

  rm --recursive "${pkgdir}/usr/bin"
  rm --recursive "${pkgdir}/usr/include"
  rm --recursive "${pkgdir}/usr/lib/cmake"
  rm --recursive "${pkgdir}/usr/lib/pkgconfig"
  rm --recursive "${pkgdir}/usr/lib/libprotobuf-lite.so"
  rm --recursive "${pkgdir}/usr/lib/libprotobuf-lite.so.3.21.12.0"
  rm --recursive "${pkgdir}/usr/lib/libprotobuf-lite.so.32"
  rm --recursive "${pkgdir}/usr/lib/libprotobuf.so"
  rm --recursive "${pkgdir}/usr/lib/libprotoc.so"
  rm --recursive "${pkgdir}/usr/lib/libprotoc.so.3.21.12.0"
  rm --recursive "${pkgdir}/usr/lib/libprotoc.so.32"
  rm --recursive "${pkgdir}/usr/share/vim"
  rm --recursive "${pkgdir}/usr/share/emacs"
}

