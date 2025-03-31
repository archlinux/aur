# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgname="aescrypt"
pkgver=4.2.5
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption Standard (AES)"
arch=('i686' 'x86_64')
url="https://www.aescrypt.com"
_url="https://github.com/terrapane"
license=('custom:Commercial')
depends=('gcc-libs' 'glibc')
makedepends=('cmake>=3.21')
_pkgsrc="${pkgname}_cli-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/aescrypt_cli/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a5ce49f25a348dbf7b00d809dc8ff5491fb9c94fe8c76ab4ce64334849129099da8563a6506f7c2d143496002657c735389afdec1c06ab5cc833f2648fd41fb1'
        'c48e0ab1de4b5788341bd3e65e3a4f9ccabb3cee9b90aaaf6321606f764cf70cb362ae49faff3feaa9c6cec9997e47d685654ac3ac0533bd2fc828334c43b78a'
        'cdb88dc44ae824eba4bdfb0627acf5e55c99116c0348ec78cfa09554d426172dbb3b87c6050e534de28ca7c5bce7ca8bc8a26f1cbb828c09823a03ebb0345f5e'
        'b76e34bcab4cfd3657036d886fd3b3313e9a4f1ee32c2f2a086443b2f8255ad84c08674fbf7451bdb22dd8c37a73f27879fbde14e3979fed0b9d0f3e5300cdf6'
        '05672a0329fcf7ec038b591d4f5f43dc0e841f509806a55af9e45e6687b2fd865e1f1dadaca6935d423a14586e2afc5450a212579b31210b40051dd25e53a762'
        'a992c4f2ecf530b561df99774f58e24a3d8466baed029abb13ff41e8bbaacf630b4516aa24aa99bff340495069372ab3f2a61d83aadec4659c270360c9a248cc'
        'c12bd96aff94660b4a6056a63034345791f6e3ab10355c5d6a8154a04421e5164a2649ea9e33d18d622d74479d08616561f5d0405bd146b664480d4bdb7006af'
        '59652e327f63fa318ec179b46781b15d52d4bf46a4c5c159b95e6a9854e4eb11d032636fb111328519f861a92796bcd01bd24e443062416b122ceb4675b8c224'
        '45a17952091098be9c2884fddc8aec9fdaf237b5fc1b506450a3f688bc280a762aa0deeb3a831f4858f8843375d39acd2c5a50d4307032f0eb8d35fd52f20da3'
        'c2ef8a7c3f6ec92ed27894d66cf4e85e843fad03bc8ff136fd21e6f425a74c9f495d4c6087adc67ee1c2d75ba1bf85ca6573985c770f73c7a5cec71cfe082416'
        '4465eb8c5e11b3edf10e80bee719110216438b32d5936374cc5d7e6cdf0e968e58a8dc8d0bd1b861502513a4f11debfa152426c540b30ca289c261526ef0fd7e'
        '6b3d351ed0330b141a3e7bd5a14fe5e76df4c21bfa7f10a86f913a48f57191456ce4b17f780d0e18e3a928a314e03852e9f4027795f103e041222882216f67f2')

declare -rAg _cmake_submodules=(
  # aescrypt_cli
  [aescrypt_engine]=4.0.9
  # [aescrypt_lm]=1.0.7 # private repo
  [program_options]=1.0.1
  [conio]=1.0.2
  [logger]=1.0.3
  [secutil]=1.0.4
  [random]=1.0.1
  [charutil]=1.0.2
  # aescrypt_engine
  # [stf]=1.0.1 # only needed for tests
  [libaes]=1.0.5
  [libhash]=1.0.5
  [libkdf]=1.0.5
  # libaes
  # [stf]=1.0.1 # only needed for tests
  [bitutil]=1.0.1
)

for _module in "${!_cmake_submodules[@]}"; do
  source+=("${_module}-${_cmake_submodules[${_module}]}.tar.gz::${_url}/${_module}/archive/refs/tags/v${_cmake_submodules[${_module}]}.tar.gz")
done

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -Daescrypt_cli_BUILD_TESTS=ON
    -Daescrypt_ENABLE_LICENSE_MODULE=OFF
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON
  )
  for _module in "${!_cmake_submodules[@]}"; do
    cmake_options+=("-DFETCHCONTENT_SOURCE_DIR_${_module^^}=${srcdir}/${_module}-${_cmake_submodules[${_module}]}")
  done
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
  ctest "${ctest_flags[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
