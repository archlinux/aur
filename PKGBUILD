# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

_pkgname=ananicy-cpp
pkgname=ananicy-cpp-git
pkgver=1.1.1.r17.g7fb9ed8
pkgrel=1
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
arch=(x86_64 i386 armv7h)
url="https://gitlab.com/ananicy-cpp/ananicy-cpp.git"
license=('GPL-3.0-or-later')
depends=(
  gcc-libs
  glibc
  libbpf
  libelf
  libfmt.so
  libspdlog.so
  systemd
  systemd-libs
  zlib
  pcre2
)
makedepends=(
  bpf
  clang
  cmake
  git
  ninja
  nlohmann-json
)
optdepends=("ananicy-rules-git: community rules"
            "ananicy-rules: Rules based for ananicy-cpp")
source=("${_pkgname}::git+https://gitlab.com/ananicy-cpp/ananicy-cpp.git")
sha512sums=('SKIP')
provides=('ananicy-cpp')
conflicts=('ananicy-cpp')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  cmake -S . -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_EXTERNAL_SPDLOG=ON \
        -DUSE_EXTERNAL_JSON=ON \
        -DUSE_EXTERNAL_FMTLIB=ON \
        -DENABLE_SYSTEMD=ON \
        -DUSE_BPF_PROC_IMPL=ON \
        -DENABLE_REGEX_SUPPORT=ON

  cmake --build build --target ananicy-cpp
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build --component Runtime

  install -m755 -d "${pkgdir}/etc/ananicy.d"
}

# vim:set sw=2 sts=2 et:
