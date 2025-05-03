# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Florian Maunier <fmauneko@dissidence.ovh>

pkgname=msquic
pkgver=2.4.11
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
sha512sums=('0c6b3524343b226d3a7a2abdb343a75e5448c1364f64925bf43dcf67b83c95ced7746e9a73cca95a5c646c2a020bea751722ac318e0eba27ffcd307f9389e9d9'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "msquic"
  git submodule init
  git config submodule.submodules/googletest.url "${srcdir}/googletest"
  git config submodule.submodules/openssl.url "${srcdir}/quictls-openssl"
  #git config submodule.submodules/openssl3.url "${srcdir}/quictls-openssl"
  git config submodule.submodules/openssl3.update none
  git config submodule.submodules/clog.url "${srcdir}/CLOG"
  git config submodule.submodules/xdp-for-windows.update none
  git -c protocol.file.allow=always submodule update
}

build() {
  local _flags=(
    -DQUIC_TLS:STRING=openssl
    -DCMAKE_SKIP_INSTALL_RPATH=YES
    -DQUIC_BUILD_TEST=NO
  )

  cmake -B build -S "msquic" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

# forever stuck at first test
#check() {
#  ctest --test-dir build --output-on-failure || true
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D -m644 "msquic/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
