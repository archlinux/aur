# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Gigas002
# Contributor: Florian Maunier <fmauneko@dissidence.ovh>

pkgname=msquic-git
pkgver=2.3.0.r609.g39b99c307
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
  git config submodule.submodules/quictls.url "${srcdir}/quictls-openssl"
  git config submodule.submodules/clog.url "${srcdir}/CLOG"
  git config submodule.submodules/xdp-for-windows.update none
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd "msquic"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DCMAKE_SKIP_INSTALL_RPATH=YES
    -DQUIC_BUILD_TEST=NO
  )

  cmake -B build -S "msquic" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D -m644 "msquic/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
