# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

pkgname=ananicy-cpp
_pkgver=1.1.1
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
arch=(x86_64 i386 armv7h aarch64 pentium4)
url="https://gitlab.com/ananicy-cpp/ananicy-cpp"
license=('GPL-3.0-or-later')
depends=(libfmt.so libspdlog.so systemd libelf zlib libbpf)
makedepends=(cmake ninja clang git nlohmann-json bpf)
optdepends=("ananicy-rules-git: community rules"
            "ananicy-rules: Rules based for ananicy-cpp")
source=("https://gitlab.com/ananicy-cpp/${pkgname}/-/archive/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz")
sha512sums=('61fe40a2da09b7d6a6a92ca6a2c7ba273200a83e893e5c5156edfbeb2fdfa0bdb4cdae402d6b1b4a1d12c5ea820e3d2e1a6d287d1314e8daf1889c3f0e7aa5ce')

build() {
  cd "${srcdir}/${pkgname}-v${_pkgver}"

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

  cmake --build build --target ananicy-cpp
}

package() {
  cd "${srcdir}/${pkgname}-v${_pkgver}"
  DESTDIR="${pkgdir}" cmake --install build --component Runtime

  install -m755 -d "${pkgdir}/etc/ananicy.d"
}

# vim:set sw=2 sts=2 et:
