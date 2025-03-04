# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgname="aescrypt"
pkgver=4.2.3
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
b2sums=('822ce448d2ef0e246746871c18c8f65e32fcd0d6e2f38a3acf23a67753fb5803e10f449db4ef37f62c74eeff8a6747066293aba3661a99d494b05c98253b5955'
        'a93f1aad16a3c5bf45c054417524bae0332c672779b6636cf5a2f52fc60de8a4bbf3bac4fba30142b997d6d6fb40556ac08d21f2b78f834602f0773cba48e4a0'
        '072c2dc47d3afe15cd90cd45fdedde1f3572caff34e284f4a34b4a5fb55a943a9fc943bd1a3b5f860d5e434a05eda3df09989dd6679c73dffced05c3481c0670'
        '6e0babeea88e0b0f48e466ff70652d50c4f4bc37e4cc835e599f40117b2e31b302f8ecb63fda315290151646482869789f612ca0c557503341d0c840b4763d3b'
        'ea2a1c945c672473d8d245e51834487ec891d72216d7aab257f7051e2624e0f92b1ad189fc4319d1b90b526408f7aacbc783b8b68b6021b80fa59be03d35961e'
        'a992c4f2ecf530b561df99774f58e24a3d8466baed029abb13ff41e8bbaacf630b4516aa24aa99bff340495069372ab3f2a61d83aadec4659c270360c9a248cc'
        '8a861949793d4d099fe7033242db1f340ce14d5dce0945f2018c3eb08be54765e821baa160e4e2b0584286b9bba1e436bcedc05c83bfc544540484ffb48498ae'
        '59652e327f63fa318ec179b46781b15d52d4bf46a4c5c159b95e6a9854e4eb11d032636fb111328519f861a92796bcd01bd24e443062416b122ceb4675b8c224'
        '549ed5c7ffd4dcb6ec48b91d1a0bc435802482882e184e2b6a4f60f1e05f26ac0895bf8fc4626a656036426c1a7437e756ade30f8b152cb31faa77d420e56f19'
        '8cff19cd10c715c6afc61296b1dba1d2306ce1535dd612b6a4984d554221e612b400ee1d4b9b188cac1edbe8fc2cbbcd42e0f8e8147e32e16b033c45a5eb9610'
        '4465eb8c5e11b3edf10e80bee719110216438b32d5936374cc5d7e6cdf0e968e58a8dc8d0bd1b861502513a4f11debfa152426c540b30ca289c261526ef0fd7e'
        '6b3d351ed0330b141a3e7bd5a14fe5e76df4c21bfa7f10a86f913a48f57191456ce4b17f780d0e18e3a928a314e03852e9f4027795f103e041222882216f67f2')

declare -rAg _cmake_submodules=(
  # aescrypt_cli
  [aescrypt_engine]=4.0.7
  # [aescrypt_lm]=1.0.5 # private repo
  [program_options]=1.0.1
  [conio]=1.0.1
  [logger]=1.0.2
  [secutil]=1.0.3
  [random]=1.0.1
  [charutil]=1.0.2
  # aescrypt_engine
  # [stf]=1.0.1 # only needed for tests
  [libaes]=1.0.4
  [libhash]=1.0.3
  [libkdf]=1.0.3
  # libaes
  # [stf]=1.0.1 # only needed for tests
  [bitutil]=1.0.1
)

for _module in "${!_cmake_submodules[@]}"; do
  source+=("${_module}-${_cmake_submodules[${_module}]}.tar.gz::${_url}/${_module}/archive/refs/tags/v${_cmake_submodules[${_module}]}.tar.gz")
done

build() {
  cd "${srcdir}"
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
