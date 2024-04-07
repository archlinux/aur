# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libopenshot-git
pkgver=0.3.2.r61.ga9e34a9b
pkgrel=3
pkgdesc='A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby (git version)'
arch=('x86_64')
url='https://www.openshot.org/'
license=('LGPL-3.0-or-later')
depends=(
  'babl'
  'gcc-libs'
  'glibc'
  'libmagick'
  'opencv'
  'python'
  'qt5-base'
  'qt5-multimedia'
  'qt5-svg'
)
makedepends=(
  'git'
  'catch2'
  'cmake'
  'cppzmq'
  'doxygen'
  'ffmpeg'
  'jsoncpp'
  'libopenshot-audio-git'
  'protobuf'
  'python-setuptools'
  'swig'
  'unittestpp'
  'zeromq'
)
provides=('libopenshot' 'libopenshot.so')
conflicts=('libopenshot')
source=('git+https://github.com/OpenShot/libopenshot.git'
        '010-libopenshot-disable-cxx-standard-restriction.patch')
sha256sums=('SKIP'
            'd8ae4bf5e2e574b2e334892e573b6f86f98764e091e369b9f01a79693f3ed547')

prepare() {
    # protobuf 23 requiers C++17, which is already default since gcc 11
    patch -d libopenshot -Np1 -i "${srcdir}/010-libopenshot-disable-cxx-standard-restriction.patch"
}

pkgver() {
    git -C libopenshot describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libopenshot \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_RUBY:BOOL='OFF' \
        -DUSE_SYSTEM_JSONCPP:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    # disable broken tests
    # https://github.com/OpenShot/libopenshot/issues/922
    # https://github.com/OpenShot/libopenshot/issues/948
    ctest --test-dir build --output-on-failure -E '(Caption:caption effect|FFmpegWriter:Options_Overloads)'
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
