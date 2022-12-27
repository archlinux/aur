# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

_pkgname=ananicy-cpp
pkgname=ananicy-cpp-git
pkgver=1.0.1.r12.gcafb692
pkgrel=1
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
arch=(x86_64 i386 armv7h)
url="https://gitlab.com/ananicy-cpp/ananicy-cpp.git"
license=('GPLv3')
depends=(fmt spdlog nlohmann-json systemd libelf zlib libbpf)
makedepends=(cmake ninja clang git nlohmann-json bpf)
optdepends=("ananicy-rules-git: community rules"
            "ananicy-rules: Rules based for ananicy-cpp")
source=("${_pkgname}::git+https://gitlab.com/ananicy-cpp/ananicy-cpp.git"
        "git+https://gitlab.com/vnepogodin/std-format.git")
sha512sums=('SKIP'
            'SKIP')
provides=('ananicy-cpp')
conflicts=('ananicy-cpp')
options=(!strip)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  export CFLAGS="${CFLAGS}"
  export CXXFLAGS="${CXXFLAGS}"
  export LDFLAGS="${LDFLAGS}"

  git submodule init
  git config submodule."external/std-format".url "${srcdir}/std-format"
  git -c protocol.file.allow=always submodule update

  cmake -S . -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_EXTERNAL_SPDLOG=ON \
        -DUSE_EXTERNAL_JSON=ON \
        -DUSE_BPF_PROC_IMPL=ON \
        -DBPF_BUILD_LIBBPF=OFF \
        -DUSE_EXTERNAL_FMTLIB=ON
}

build() {
  cd "${srcdir}/${_pkgname}"

  _cpuCount=$(grep -c -w ^processor /proc/cpuinfo)
  cmake --build build --target ananicy-cpp --parallel $_cpuCount
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build --component Runtime

  install -m755 -d "${pkgdir}/etc/ananicy.d"
}

# vim:set sw=2 sts=2 et:
