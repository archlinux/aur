# Maintainer: mp0rta <3p0rta26@gmail.com>
pkgname=mqvpn
pkgver=0.12.1
pkgrel=1
pkgdesc="Multipath VPN using MASQUE CONNECT-IP (RFC 9484) and Multipath QUIC"
arch=(x86_64 aarch64)
url="https://github.com/mp0rta/mqvpn"
license=(Apache-2.0)
depends=(libevent)
makedepends=(cmake git go)
# BoringSSL is cloned by upstream's build (not a submodule); the commit below
# is the pin used by upstream's release workflow for this version.
_boringssl_commit=9c95ec797c65fde9e8ddffc3888f0b8c1460fe4c
source=("git+https://github.com/mp0rta/mqvpn.git#tag=v${pkgver}"
        "mqvpn-xquic::git+https://github.com/mp0rta/xquic.git"
        "mqvpn-lwip::git+https://github.com/mp0rta/heiher-lwip.git"
        "boringssl::git+https://github.com/google/boringssl.git#commit=${_boringssl_commit}")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd mqvpn
  git submodule init
  git config submodule.third_party/xquic.url "${srcdir}/mqvpn-xquic"
  git config submodule.third_party/lwip.url "${srcdir}/mqvpn-lwip"
  git -c protocol.file.allow=always submodule update third_party/xquic third_party/lwip
  rm -rf third_party/xquic/third_party/boringssl
  mkdir -p third_party/xquic/third_party
  cp -r "${srcdir}/boringssl" third_party/xquic/third_party/boringssl
}

build() {
  cd mqvpn

  cmake -S third_party/xquic/third_party/boringssl \
        -B third_party/xquic/third_party/boringssl/build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=0 \
        -DCMAKE_C_FLAGS="${CFLAGS} -fPIC" \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -fPIC"
  make -C third_party/xquic/third_party/boringssl/build -j"$(nproc)" ssl crypto

  cmake -S third_party/xquic -B third_party/xquic/build \
        -DCMAKE_BUILD_TYPE=Release \
        -DSSL_TYPE=boringssl \
        -DXQC_ENABLE_BBR2=ON \
        -DXQC_ENABLE_UNLIMITED=ON \
        -DXQC_ENABLE_FEC=ON \
        -DXQC_ENABLE_XOR=ON \
        -DCMAKE_C_FLAGS="${CFLAGS} -Wno-dangling-pointer"
  make -C third_party/xquic/build -j"$(nproc)"

  cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMQVPN_ENABLE_HYBRID_TCP_LANE=ON \
        -DXQUIC_BUILD_DIR="${PWD}/third_party/xquic/build"
  make -C build -j"$(nproc)"
}

package() {
  cd mqvpn
  make -C build DESTDIR="${pkgdir}" install
}
