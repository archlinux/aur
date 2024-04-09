# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Gigas002
# Contributor: Florian Maunier <fmauneko@dissidence.ovh>

pkgname=msquic-git
pkgver=2.3.0.r105.g6abfbec41
pkgrel=2
pkgdesc="Microsoft implementation of the IETF QUIC protocol"
arch=(x86_64 armv7h aarch64)
url="https://github.com/microsoft/msquic"
license=(MIT)
depends=(glibc numactl)
makedepends=(cmake git)
provides=(msquic libmsquic.so)
conflicts=(msquic libmsquic.so)
source=("git+https://github.com/microsoft/msquic.git"
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
  #git config submodule.submodules/openssl3.update none
  git config submodule.submodules/clog.url "${srcdir}/CLOG"
  git config submodule.submodules/xdp-for-windows.update none
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd "msquic"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "msquic" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQUIC_TLS=openssl3 \
    -DCMAKE_SKIP_INSTALL_RPATH=YES \
    -DQUIC_BUILD_TEST=NO

  cmake --build build

#    -DQUIC_USE_SYSTEM_LIBCRYPTO=ON \
# -- Configuring for OpenSSL 3.x
# [  1%] OpenSSL configure
# /bin/sh: line 1: /home/fabio/Dev/Github/PKGBUILD-AUR_fix/m/msquic-git/src/msquic/submodules/openssl3/config: No such file or directory

}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D -m644 "msquic/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
