# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgname="aescrypt"
pkgver=4.2.6
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
b2sums=('8aad99b8b8e9aa8a9d99ff3752732c592802bdf32f43d27686a24bcd182ccb41fd235df24be41fd4f5600603c63db24b2a0f60094c2985185f44935c4d567ee0'
        'c48e0ab1de4b5788341bd3e65e3a4f9ccabb3cee9b90aaaf6321606f764cf70cb362ae49faff3feaa9c6cec9997e47d685654ac3ac0533bd2fc828334c43b78a'
        '130a1e54fdbf3bf4f1728214ff0ee2354114c52c45eb951aaf3decf7425495a3e5ffcdeed825661989a3d3a3c63f16de8a3f5360e3e69acc38f68f1660288165'
        '06b89a59ed5882ea6bed5a3b65a5b821be488a647850674cd2a9e729eaf929b01c7d8f51510f03e97e1edc2e9f3e84083e14e7b468e44cab196f2c42a7289b8b'
        '1373da514afa7cca47e74558302cf09d31253dcc74b2a18bd9c6963547594604d25c81da3942cb00bf98fb6d824ff6c324614a8bb9a4edf19b441332a60aae35'
        'a992c4f2ecf530b561df99774f58e24a3d8466baed029abb13ff41e8bbaacf630b4516aa24aa99bff340495069372ab3f2a61d83aadec4659c270360c9a248cc'
        'c88285aa90496ca039245da06127c125c76569d30a45f98e22d1399447a330c9288c84e8341efe18ffabd49854ed597eaf536b358bc68fdc6c0f69e6e79710ac'
        '59652e327f63fa318ec179b46781b15d52d4bf46a4c5c159b95e6a9854e4eb11d032636fb111328519f861a92796bcd01bd24e443062416b122ceb4675b8c224'
        'b9bb30b3a9d5dad459304678a938df64e8ec5f509a5edd9e43abab4752d0514e83f80e34458263fca42a8cbe2b0a0005f78e322abc472b732a5d1932ca3414c2'
        '637756b59177ee6c3daa0999c7d921a2f0f5852cc90373a5eb08922437ef522582b9743a54dc8907f2a9282c963326b56dea4381bac0b277a01ef64b5400b782'
        '4465eb8c5e11b3edf10e80bee719110216438b32d5936374cc5d7e6cdf0e968e58a8dc8d0bd1b861502513a4f11debfa152426c540b30ca289c261526ef0fd7e'
        '6b3d351ed0330b141a3e7bd5a14fe5e76df4c21bfa7f10a86f913a48f57191456ce4b17f780d0e18e3a928a314e03852e9f4027795f103e041222882216f67f2')

declare -rAg _cmake_submodules=(
  # aescrypt_cli
  [aescrypt_engine]=4.0.10
  # [aescrypt_lm]=1.0.8 # private repo
  [program_options]=1.0.1
  [conio]=1.0.2
  [logger]=1.0.4
  [secutil]=1.0.5
  [random]=1.0.1
  [charutil]=1.0.2
  # aescrypt_engine
  # [stf]=1.0.1 # only needed for tests
  [libaes]=1.0.6
  [libhash]=1.0.6
  [libkdf]=1.0.6
  # libaes
  # [stf]=1.0.1 # only needed for tests
  [bitutil]=1.0.1
)

for _module in "${!_cmake_submodules[@]}"; do
  source+=("${pkgname}-${_module}-${_cmake_submodules[${_module}]}.tar.gz::${_url}/${_module}/archive/refs/tags/v${_cmake_submodules[${_module}]}.tar.gz")
done

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D FETCHCONTENT_FULLY_DISCONNECTED=ON
    -D aescrypt_cli_BUILD_TESTS=ON
    -D aescrypt_ENABLE_LICENSE_MODULE=OFF
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
