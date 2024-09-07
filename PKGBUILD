# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=srt-xtransmit
pkgver=0.2.0
pkgrel=2
pkgdesc='Secure Reliable Transport (SRT) transmission utility used for internal testing and performance evaluation'
url='https://github.com/maxsharabayko/srt-xtransmit'
arch=('x86_64')
license=('MPL-2.0')
depends=('gcc-libs' 'glibc' 'openssl' 'srt')
makedepends=('cmake' 'ninja')
_cli11=2.4.2
_function2=4.1.0
_nlohmann_json=3.11.3
_spdlog=1.6.1
_srt=1.5.3
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maxsharabayko/srt-xtransmit/archive/refs/tags/v${pkgver}.tar.gz"
        "CLI11-${_cli11}.tar.gz::https://github.com/CLIUtils/CLI11/archive/refs/tags/v${_cli11}.tar.gz"
        "function2-${_function2}.tar.gz::https://github.com/Naios/function2/archive/refs/tags/${_function2}.tar.gz"
        "nlohmann_json-${_nlohmann_json}.tar.gz::https://github.com/nlohmann/json/archive/refs/tags/v${_nlohmann_json}.tar.gz"
        "spdlog-${_spdlog}.tar.gz::https://github.com/gabime/spdlog/archive/refs/tags/v${_spdlog}.tar.gz"
        "srt-${_srt}.tar.gz::https://github.com/maxsharabayko/srt/archive/refs/tags/v${_srt}.tar.gz")
sha256sums=('3888847cd74f57b7535ecced0f8cd4ac53efb0403f9de897a8d6102915e9baec'
            'f2d893a65c3b1324c50d4e682c0cdc021dd0477ae2c048544f39eed6654b699a'
            'c3aaeaf93bf90c0f4505a18f1094b51fe28881ce202c3bf78ec4efb336c51981'
            '0d8ef5af7f9794e3263480193c491549b2ba6cc74bb018906202ada498a79406'
            '378a040d91f787aec96d269b0c39189f58a6b852e4cbf9150ccfacbe85ebbbfc'
            'befaeb16f628c46387b898df02bc6fba84868e86a6f6d8294755375b9932d777')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Submodules
  cp -r ../CLI11-${_cli11}/* submodule/CLI11
  cp -r ../function2-${_function2}/* submodule/function2
  cp -r ../json-${_nlohmann_json}/* submodule/nlohmann_json
  cp -r ../spdlog-${_spdlog}/* submodule/spdlog
  cp -r ../srt-${_srt}/* submodule/srt
}

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DENABLE_TESTING=ON
    -DENABLE_APPS=ON
    -DENABLE_SHARED=OFF
    -DENABLE_ENCRYPTION=ON
    -DENABLE_CXX17=ON
    -Wno-dev
  )

  cmake -S ${pkgname}-${pkgver} -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd build
  ./uriparser-test
  ./utility-test
}

package() {
  cd build
  install -vDm755 bin/srt-xtransmit "${pkgdir}/usr/bin/srt-xtransmit"
}

# vim:set ts=2 sw=2 et:
