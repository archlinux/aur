pkgname='protobuf-dllexport'
_pkgname=protobuf
pkgver=27.2
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'glibc' 'zlib' 'abseil-cpp')
makedepends=('cmake')
replaces=('protobuf-cpp')
provides=('libprotoc.so' 'libprotobuf.so' 'libprotobuf-lite.so')
provides=("protobuf=$pkgver")
conflicts=('protobuf')
source=(https://github.com/protocolbuffers/protobuf/archive/v$pkgver/$_pkgname-$pkgver.tar.gz
        https://github.com/protocolbuffers/protobuf/commit/2e62ef1e.patch)
sha512sums=('664c66b62cf1ed0c65d9b910d8e67d4d5d471113697f1b8edf1573cd5c0fc8e850ac53ce984e48e6c6b9cbbefa12f8530058384e7388e65a59c1e46d03772397'
            '18bc71031bbcbc3810a9985fa670465040f06a6c104ab8079b56bdfc499bb6cec40805a0cefd455031142490a576dc60aa8000523877ac0353b93558e9beabbd')

prepare() {
  patch -d $_pkgname-$pkgver -p1 < 2e62ef1e.patch # Fix cmake config compatibility mode
  curl -L https://github.com/protocolbuffers/protobuf/pull/17314.patch | patch -d $_pkgname-$pkgver -p1
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" 
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    -D protobuf_BUILD_SHARED_LIBS=ON
    -D protobuf_BUILD_TESTS=OFF
    -D protobuf_ABSL_PROVIDER=package
    -S "$_pkgname-$pkgver"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd $_pkgname-$pkgver
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 editors/protobuf-mode.el \
    -t "$pkgdir/usr/share/emacs/site-lisp/"
  install -vDm 644 editors/proto.vim \
    -t "${pkgdir}/usr/share/vim/vimfiles/syntax"
}
