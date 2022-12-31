# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

pkgname=ananicy-cpp
_pkgver=1.0.2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
arch=(x86_64 x86_64_v3 i386 armv7h aarch64 pentium4)
url="https://gitlab.com/ananicy-cpp/ananicy-cpp"
license=('GPLv3')
depends=(fmt spdlog nlohmann-json systemd libelf zlib libbpf)
makedepends=(cmake ninja clang git nlohmann-json bpf)
optdepends=("ananicy-rules-git: community rules"
            "ananicy-rules: Rules based for ananicy-cpp")
source=("https://gitlab.com/ananicy-cpp/${pkgname}/-/archive/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz")

declare -g -A externals
externals['std-format']="dfa4fdc87c7cb9bb1683125009baa7278bb85901"

for external in "${!externals[@]}"; do
    source+=(https://gitlab.com/vnepogodin/${external}/-/archive/${externals[$external]}/${external}-${externals[$external]}.tar.gz)
done
sha512sums=('3fe4ef9fa929846dccbc1998b088c70fb3f7a3b81d85cd331a42f3faa9dc7651e6aae33601357fe0469f2616987643703cd224bbac968e86af384112590649ba'
            '5a8dd392b65ab613fc9072921135c9cbae6106f61170ad12d218a51b919c73018eda466c765d987f00483d6d47f9110338e9aecb7ad1b8016f2da76900edf80f')

prepare() {
  cd "$pkgname-v${_pkgver}"

  echo Externals: "${!externals[@]}"
  for external in "${!externals[@]}"; do
      mv -v "../${external}-${externals[$external]}/"* external/${external}/
  done
}

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
