# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Florian Maunier <fmauneko@dissidence.ovh>

pkgname=msquic
pkgver=2.2.4
pkgrel=1
epoch=1
pkgdesc="Microsoft implementation of the IETF QUIC protocol"
arch=(x86_64 armv7h aarch64)
url="https://github.com/microsoft/msquic"
license=(MIT)
depends=(glibc numactl)
makedepends=(cmake git)
provides=(libmsquic.so)
conflicts=(libmsquic.so)
source=("git+https://github.com/microsoft/msquic.git#tag=v${pkgver}"
        "git+https://github.com/google/googletest.git"
        "quictls-openssl::git+https://github.com/quictls/openssl.git"
        "git+https://github.com/microsoft/CLOG.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "msquic"
  git submodule init
  git config submodule.submodules/googletest.url "${srcdir}/googletest"
  #git config submodule.submodules/openssl.url "${srcdir}/quictls-openssl"
  git config submodule.submodules/openssl.update none
  git config submodule.submodules/openssl3.url "${srcdir}/quictls-openssl"
  git config submodule.submodules/clog.url "${srcdir}/CLOG"
  git config submodule.submodules/xdp-for-windows.update none
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "msquic" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQUIC_TLS=openssl3 \
    -DCMAKE_SKIP_INSTALL_RPATH=YES \
    -DQUIC_BUILD_TEST=YES

  cmake --build build

#    -DQUIC_USE_SYSTEM_LIBCRYPTO=ON \
#CMake Error at submodules/CMakeLists.txt:349 (message):
#  OpenSSL 3.0 not found, found 3.2.0

}

check() {
  #ctest --test-dir build --output-on-failure || true
  true
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D -m644 "msquic/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
