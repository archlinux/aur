# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgname="aescrypt"
pkgver=4.3.1
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
b2sums=('5b27a34ae40b33e6c7fac3669833bb7dba16d7d944374f4ef39a4225bc90bd7a7189c62adc8a52da5dd979d0ffb14ade2aa070a928a5ebcf563d68e98462c241'
        '24931fe338cc584e8111c1fd9830951157d2dd4834e4e166463840a9737517106239247b3c0439c1a4bdac88cb915ae989c4a9f5f9ea442a5b8f6e26ff5aedec'
        '16cfaefc5bf59c531d1902b948a2b789158121423cb19c624dc3ef7d915c44947cb2cb5c992b9a2dc34b6b039f8779215df48068f4d57acf4d22ab0b46eb3436'
        '1b0d188f355569fb60b7b2364954073259a95a91dda57b6e38f84b379590a1917d8f1658bc0850e97303c81748c3b0b206a62874401059e4239706ab76fe596e'
        'd9090053e69f69aa36cbb009bf7fcfa96c6567f217e13ba0a95a1ddb06eb1458de52c0879c83b6d9951ec478906225ab75891eca49f9c8f307f32dfd385150ad'
        '5415d6b2d302825460ec294eb4c96ba5240dcd209b5d82569d4a383179ff181b0c8d88dbff0e2ffc295e50ec299219476fc1bc535a8085ed316170bb1e0b6f6f'
        'd6406ed3baaf476c88012e776b1466a76672768ceabd8f31ba77e60feb34028108f637aac8b9d5ed115d15889177a815f1192f1167acd5b0ade7b44c74360951'
        '484d7ffdf2dc65c71a431cc96b90f2e2b9a5a0160a4fdb0c57b1aed06e2ccd3bb42fd3bfc605240eced5278d04d15d626f51c07c39e8e75d37525811835639b8'
        '8a1d4c4808020a1384a9b4d32f75f17884befc225ed6d2bbe23b01284bdaa117d9bd02a5b2d9af4ac6f51e12dcab295aa878c2a9936f8a91484ab1319a5dac9f'
        'ae8b6f372b4a011a61397410a43aeccf75601034bb59ff2d6d46cdf2bea7639e413ae6d38a51c9000736d6df637c3a8cae872f04ed31f789732d1133ce56da3e'
        '8ab2c1f20e11e3568e3c9426e9b1a22d9a0afdd528fa94deebc8dd227a9ebc7c560351222bcfe6ad5d769e64ac4f59666f8d40edbc19936d126e91fb35ba7975'
        '8dcadb73d55e4fadca57b6c3f61eed9e6a0dfa9491c0358929a3079e45faccf4f5666d95fe2730463dc2a6e79c0d205bcefb2608a6ba076a54b254fdc6b5a309')

declare -rAg _cmake_submodules=(
  # aescrypt_cli
  [aescrypt_engine]=4.1.1
  # [aescrypt_lm]=1.0.10 # private repo
  [program_options]=1.0.2
  [conio]=1.0.4
  [logger]=1.0.6
  [secutil]=1.0.7
  [random]=1.0.3
  [charutil]=1.0.3
  # aescrypt_engine
  # [stf]=1.0.2 # only needed for tests
  [libaes]=1.1.1
  [libhash]=1.0.8
  [libkdf]=1.0.8
  # libaes
  [bitutil]=1.0.2
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

  rm -rf "${pkgdir}/usr/share/licenses/${pkgname}_cli"
}
