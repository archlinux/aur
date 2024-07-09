# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Tobias Boesch <tobias.boesch at googlemail.com>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=protobuf
pkgname=protobuf-21
pkgver=21.12
pkgrel=3
pkgdesc='Protocol Buffers (legacy)'
arch=(aarch64 x86_64)
url='https://developers.google.com/protocol-buffers/'
license=(BSD-3-Clause)
depends=(abseil-cpp11 gcc-libs glibc zlib)
makedepends=(cmake python-build python-installer python-setuptools python-wheel)
source=("https://github.com/protocolbuffers/$_name/archive/v$pkgver/$_name-$pkgver.tar.gz"
        "python3.11.patch::https://github.com/protocolbuffers/$_name/commit/da973aff.patch"
        "fix-abi.patch::https://github.com/protocolbuffers/$_name/commit/101b6199.patch")
sha256sums=('22fdaf641b31655d4b2297f9981fa5203b2866f8332d3c6333f6b0107bb320de'
            'bab85c38125205c11c669080f17af3e8c0a497df41e57cd47ec86b50fd53b56d'
            '5eee1dd6898007307d9d286be8e45e5e5cf4d6e6d594fd5f49b236df4bfe2ac1')

prepare() {
  cd $_name-$pkgver
  # Revert ABI break
  patch -Rp1 < ../fix-abi.patch
  # fix for python 3.11
  patch -Np1 -i ../python3.11.patch
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_INCLUDEDIR=/usr/include/$pkgname
    -D CMAKE_INSTALL_LIBDIR=lib/$pkgname
    -D protobuf_BUILD_SHARED_LIBS=ON
    -D protobuf_BUILD_TESTS=OFF
    -S $_name-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose

  ln -rs build $_name-$pkgver/src/.libs
  cd $_name-$pkgver/python
  PROTOC="$srcdir"/build/protoc python -m build --wheel --no-isolation
}

package() {
  provides=(libprotoc.so libprotobuf.so libprotobuf-lite.so)
  DESTDIR="$pkgdir" cmake --install build
  cd $_name-$pkgver
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  mv "$pkgdir"/usr/bin/protoc{,-21}
  ln -rs "$pkgdir"/usr/lib/$pkgname/*.so.* "$pkgdir"/usr/lib
}
