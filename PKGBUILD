# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Glaucous <glakke1 at gmail dot com>
# Contributor: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=apitrace-git
pkgver=11.1.r102.g9de54e55
pkgrel=1
pkgdesc="Graphics API Tracing"
arch=(x86_64)
url="https://github.com/apitrace/apitrace"
license=(BSD)
depends=(qt6-base python-pillow python-numpy libgl procps-ng)
makedepends=(cmake git mesa)
provides=(apitrace)
conflicts=(apitrace)
source=("git+https://github.com/apitrace/apitrace.git"
        "git+https://github.com/apitrace/gltrim-tests.git"
        "git+https://github.com/google/brotli.git"
        "git+https://github.com/google/googletest.git"
        "git+https://github.com/ianlancetaylor/libbacktrace.git"
        "apitrace-libpng::git+https://github.com/apitrace/libpng.git"
        "git+https://github.com/google/snappy.git"
        "git+https://github.com/madler/zlib.git"
        "git+https://github.com/microsoft/DirectXMath.git"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd apitrace
  git submodule init
  git config submodule.frametrim/tests.url          "${srcdir}/gltrim-tests"
  git config submodule.thirdparty/brotli.url        "${srcdir}/brotli"
  git config submodule.thirdparty/gtest.url         "${srcdir}/googletest"
  git config submodule.thirdparty/libbacktrace.url  "${srcdir}/libbacktrace"
  git config submodule.thirdparty/libpng.url        "${srcdir}/apitrace-libpng"
  git config submodule.thirdparty/snappy.url        "${srcdir}/snappy"
  git config submodule.thirdparty/zlib.url          "${srcdir}/zlib"
  git config submodule.thirdparty/directxmath.url   "${srcdir}/DirectXMath"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd apitrace
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd apitrace
  cmake . -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT6=TRUE \
    -DENABLE_GUI=TESTS \
    -DENABLE_GUI=TRUE
  make -C build
}

check() {
  cd apitrace
  make -C build test
}

package() {
  cd apitrace
  make -C build DESTDIR="${pkgdir}/" install
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}