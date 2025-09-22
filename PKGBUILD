# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgname="aescrypt"
pkgver=4.4.0
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
b2sums=('c204b51ca45cc30c9bedf8cc6a254d1178fb333c079e3b6972771da14ecf8b388cb7d8e807d3b913f76367c6a538bd1b4f9e3c48ec70c989f503041f63af948a'
        'f0649922ff5c6ea59dd5d3b93a9bf030752c89ddd90c85f9385eb8884e4c6ca5399911fa999592d7570ee59281a406759f57776f85b3d6f493b9f7dc143888b9'
        '68505b4014f0d99a7df3a16ea3bb435ee19c5daa18c8e46ee253fb569273c64bbfa5f9fa1dfdd1239e1fc4f4bbe7bb043491d31511d495c9a2485cc4418a3cba'
        '2f21ff6499f1bf4edc4ac114d59fffd1c76dc7c12adf52fa244bf1e7c243dc1e15b003ba50af2dcecc22ca4bc16ea835291f11f5483e2642eff1ca4bdd7e60b8'
        'a603457116b281d88ed5b1a7bf74c3d8b762c9e9de8be662bf140b2f5c7b0abe134adfe4a3b687d21297df06622fa594490c9f6cbf2cdda9fd2b708bbc1de949'
        'd0f8d5afce23ebe007c96e8d910983e58c5e8e9621c15778c5e3bfab9d6a7af68fcce826444f49d05d9a2b9bc70981125aec01b498f0196dd86c8572b9251e9a'
        '6e76dd123c3ce2de6924d6dce73bf0d86ac2e71bf1ba4e0c30d5034dde3e4b769917d62eb249deafd51946d92339234b4ca02557ab712278bdb4d5b9ae8564c1'
        '4607b15c73a7c71205320f7efc2ea76ce6090ab630d962997a19cf5d1ae4d5adfa05d31b8c0069020252800c5ca06f862ae1e4aafef479f1f7f4de66d32f633d'
        '20388e745fcb811a93e45c77cba97e23a215b2cb46578df493a2a8e1aabd937a5c97183d1fffb2d2346085049ff8b92f3098980fe9271c8b95726d9bd22fb2cc'
        '923ad9fb57a0a785424427ead8d510ef9e5159bf74564542d71fba382c7ec9436cf6dd266b28eef3508c572809dad653278737d6eac6aaad721f24099b8cb657'
        '28313a8e41e38ad19e02d7e856f6dd5d8208add6a46d224ee70db08c23760621d88e7b139340878f882f9599d7d854b49391e0061e5ca2933772914388e5954f'
        'ec61954b12172642cdfc10fd656d39e50ac51e40824e4cae5b082a0afc28143373a4931884190f75b8a95be0cdbbd02f3fae5810d95586792dcc7d3fcec4a80d')

declare -rAg _cmake_submodules=(
  # aescrypt_cli
  [aescrypt_engine]=4.1.2
  # [aescrypt_lm]=1.0.11 # private repo
  [program_options]=1.0.3
  [conio]=1.0.5
  [logger]=1.0.7
  [secutil]=1.0.8
  [random]=1.0.4
  [charutil]=1.0.4
  # aescrypt_engine
  # [stf]=1.0.3 # only needed for tests
  [libaes]=1.1.2
  [libhash]=1.0.9
  [libkdf]=1.0.9
  # libaes
  [bitutil]=1.0.3
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
    -D aescrypt_cli_BUILD_TESTS:BOOL=ON
    -D aescrypt_ENABLE_LICENSE_MODULE:BOOL=OFF
  )
  for _module in "${!_cmake_submodules[@]}"; do
    cmake_options+=("-D FETCHCONTENT_SOURCE_DIR_${_module^^}=${srcdir}/${_module}-${_cmake_submodules[${_module}]}")
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
