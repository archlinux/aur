# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase='protobuf-25'
_pkgbase=protobuf
pkgname=('protobuf-25' 'python-protobuf-25')
pkgver=25.3
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=(
  'gcc-libs'
  'glibc'
  'zlib'
  'abseil-cpp'
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
  python-numpy
)
source=(https://github.com/protocolbuffers/protobuf/archive/v$pkgver/protobuf-$pkgver.tar.gz
        https://github.com/protocolbuffers/protobuf/commit/2e62ef1e.patch
        soversion.patch
        $_pkgbase-21.12-pep517.patch)  # let's not call setup.py like a script and just build...
sha512sums=('1f73e237c919082e5423ae9e2ea8813dccf672c059051d1531fe89ffaa45872d3cf3052b8c3af26f674296ec17d7dc861c67b8f0834ed80261ce4a6a14ed7115'
            '18bc71031bbcbc3810a9985fa670465040f06a6c104ab8079b56bdfc499bb6cec40805a0cefd455031142490a576dc60aa8000523877ac0353b93558e9beabbd'
            'f0813a415cff5639e4709400f15b0c5565294e7907ae164e620b76258734c643115d8e5170bf0e4aee264c347fb7e01ac4be60d19be2a91c0ce9c561dad8c8e9'
            'a297e74ee4f807b3fad7da7d0de6dd9647963521be66cd2a2370343f5bd191cbb38759157ac0cdb161a5893a30a10520a5098e88a292c800859af33db5cf7a41')

prepare() {
  patch -d $_pkgbase-$pkgver -p1 < protobuf-21.12-pep517.patch
  patch -d protobuf-$pkgver -p1 < 2e62ef1e.patch # Fix cmake config compatibility mode
  patch -d $_pkgbase-$pkgver -p1 < soversion.patch # Restore soversion
  sed -e 's|c++14|c++17|' -i $_pkgbase-$pkgver/python/setup.py
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" 
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    -D protobuf_BUILD_SHARED_LIBS=ON
    -D protobuf_USE_EXTERNAL_GTEST=ON
    -D protobuf_ABSL_PROVIDER=package
    -S $_pkgbase-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose

  cd $_pkgbase-$pkgver/python
  LDFLAGS+=" -L${srcdir}/build" \
  PROTOC="$srcdir"/build/protoc \
  python -m build --wheel --no-isolation
}

check() {
  ctest --test-dir build

  cd $_pkgbase-$pkgver/python
  pytest -vv google/$_pkgbase/internal/ || true
}

package_protobuf-25() {
  replaces=('protobuf-cpp')
  provides=('libprotoc.so' 'libprotobuf.so' 'libprotobuf-lite.so')
  provides=("protobuf=$pkgver")
  conflicts=('protobuf')

  DESTDIR="$pkgdir" cmake --install build

  cd $_pkgbase-$pkgver
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/protobuf"
  install -vDm 644 editors/protobuf-mode.el \
    -t "$pkgdir/usr/share/emacs/site-lisp/"
  install -vDm 644 editors/proto.vim \
    -t "${pkgdir}/usr/share/vim/vimfiles/syntax"
}

package_python-protobuf-25() {
  pkgdesc='Python 3 bindings for Google Protocol Buffers'
  depends=(
    "protobuf=$pkgver"
    'python'
  )
  provides=("python-protobuf=$pkgver")
  conflicts=('python-protobuf')

  python -m installer --destdir="$pkgdir" $_pkgbase-$pkgver/python/dist/*.whl
  install -vDm 644 protobuf-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/protobuf/"
}
