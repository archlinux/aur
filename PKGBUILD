# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=srt-xtransmit
pkgver=0.2.0
pkgrel=3
pkgdesc="A testing utility with support for SRT and UDP network protocols"
arch=('x86_64')
url="https://github.com/maxsharabayko/srt-xtransmit"
license=('MPL-2.0')
options=('!lto')
conflicts=('srt')
depends=(
  'bash'
  'gcc-libs'
  'glibc'
  'openssl'
  'python-bokeh'
  'python-click'
  'python-pandas'
)
makedepends=(
  'cmake'
  'git'
  'make'
  'ninja'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/maxsharabayko/srt-xtransmit/archive/refs/tags/v${pkgver}.tar.gz"
  "git+https://github.com/CLIUtils/CLI11.git#commit=0d06d21b56eadef9dcb24907ee2866b2b6f0babe"
  "git+https://github.com/Naios/function2.git#commit=3a0746bf5f601dfed05330aefcb6854354fce07d"
  "git+https://github.com/nlohmann/json.git#commit=9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
  "git+https://github.com/gabime/spdlog.git#commit=22a169bc319ac06948e7ee0be6b9b0ac81386604"
  "git+https://github.com/maxsharabayko/srt.git#commit=6ab86d8acb85849859ac9aa020f95b2da44674d8"
)
sha256sums=('3888847cd74f57b7535ecced0f8cd4ac53efb0403f9de897a8d6102915e9baec'
            'e93509d4280de9378a666ccfd73fe9f1531e57017913d6120459a409e98aed90'
            '45e95da7de858ceb21e6792b3d9d9c37a9f6993bf4a3818cb2fc9a34b249e095'
            '758268d6b3c0fdcba8ec1d6f0ff35a59b2453f6c468ba4c075a42964d065472b'
            '55eeb14d48e119795d2493996f24d2b691c03fe2badcff41306bc5c08761fc19'
            '6fc3e352a93a34ffd84c33efb6b02dfd363d0c3334cb240a0c4ca46355140bd0')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Copy each submodule to the appropriate directory
  cp -Pr "${srcdir}/CLI11"/* submodule/CLI11
  cp -Pr "${srcdir}/function2"/* submodule/function2
  cp -Pr "${srcdir}/json"/* submodule/nlohmann_json
  cp -Pr "${srcdir}/spdlog"/* submodule/spdlog
  cp -Pr "${srcdir}/srt"/* submodule/srt
}

build() {
  cd "${pkgname}-${pkgver}"
  #mkdir -p build

  # Define CMake options as a local variable
  local cmake_options=(
    -G Ninja
    -Wno-dev
    -DCMAKE_INSTALL_PREFIX=/usr
    -DENABLE_TESTING=ON
    -DENABLE_APPS=ON
    -DENABLE_SHARED=OFF
    -DENABLE_ENCRYPTION=ON
    -DENABLE_CXX17=ON
    -DENABLE_BONDING=ON
  )

  # Run CMake with the specified options
  cmake "${cmake_options[@]}" -B build
  ninja -C build
}

package() {
  cd "${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}

# vim:set ts=2 sw=2 et:
