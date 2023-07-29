# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

pkgname=ananicy-cpp
_pkgver=1.1.0
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
arch=(x86_64 x86_64_v3 i386 armv7h aarch64 pentium4)
url="https://gitlab.com/ananicy-cpp/ananicy-cpp"
license=('GPLv3')
depends=(fmt spdlog nlohmann-json systemd libelf zlib libbpf)
makedepends=(cmake ninja clang git nlohmann-json bpf)
optdepends=("ananicy-rules-git: community rules"
            "ananicy-rules: Rules based for ananicy-cpp")
source=("https://gitlab.com/ananicy-cpp/${pkgname}/-/archive/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz")
sha512sums=('d6204713c5119739cd332959603563d395b1bf3c1aa2459d06f02b4e7d19e7e704ead97781971fce882d885e46d217c05bccd961d37747bd928268b51edfda07')

build() {
  cd "${srcdir}/${pkgname}-v${_pkgver}"

  _cpuCount=$(grep -c -w ^processor /proc/cpuinfo)

  export CFLAGS="${CFLAGS}"
  export CXXFLAGS="${CXXFLAGS}"
  export LDFLAGS="${LDFLAGS}"

  cmake -S . -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_EXTERNAL_SPDLOG=ON \
        -DUSE_EXTERNAL_JSON=ON \
        -DUSE_EXTERNAL_FMTLIB=ON \
        -DENABLE_SYSTEMD=ON \
        -DUSE_BPF_PROC_IMPL=ON \
        -DBPF_BUILD_LIBBPF=OFF \
        -DVERSION=${_pkgver}

  cmake --build build --target ananicy-cpp --parallel $_cpuCount
}

package() {
  cd "${srcdir}/${pkgname}-v${_pkgver}"
  DESTDIR="${pkgdir}" cmake --install build --component Runtime

  install -m755 -d "${pkgdir}/etc/ananicy.d"
}

# vim:set sw=2 sts=2 et:
