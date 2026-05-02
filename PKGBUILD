# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgbase="aescrypt"
pkgname=(
  "${pkgbase}_cli"
  "${pkgbase}_gui"
)
pkgver=4.5.0
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption Standard (AES)"
arch=(
  'x86_64'
)
url="https://www.aescrypt.com"
_url="https://github.com/terrapane"
license=(
  'custom:Commercial'
)
makedepends=(
  'cmake>=3.21'
)
_pkgsrc="${pkgbase}_gui-${pkgver}"
source=(
  "${_url}/aescrypt_gui/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('605df038541afa3cd33cbc9011a96b2f7308ab0bcf8a838310b3a6a5f62cc83482f4d7723c593dff60306b46f36b4c61f2e707cbc867cd33c72a394a70d248a1'
        '0b3853ca88af564fc6ef09de39b2f72b238e896f75da3ff6f20cc5e723bbfe6dd200d02a9900f4be060ff175927e9a4f668a394209460ecee55562a86a47044f'
        'a57325282332fe5bf1ab1b4041b831929731e8069f07d21c9db44edf9e2ec051eb761c4dd698464cf4c73ec359ad470adcbe3ae6409dee5f7269f7c54039c0d5'
        '2d00ad1e3e4cb963db1834cb374e78a267ffe1d277c96437f5798d540f6d6f2740e69fe500cfd8feaa2e4a38d142bab6adfcee5441696c09a660090d9860ee1d'
        '67586e1e0a635c8c532883e595a17dd3a9b29dae0fb7456856415c7ed09708571a4a8f9e54e4c2cb8d70524a88c6f83dc413965b3b79a2c410d579642fafec92'
        '7883fb6b63d209c72c5f990fbf5f7e53d50d8e3b55fd311a9cb0096c7138c79968600ec85b0c4863c92ecddb7669dfbad079235f7cf897dd201b32eeaf0f0db4'
        '2d219cff0397c106be3ae24f84e3afd36a6d5cbc63dd1f7074eb1490cca22e063a7767b2e7d8be0d21b937df08ab8b84fcacf58020493925a94a8ad156a11443'
        '3172f69fe834e0ee56241c810c5735649ace06ddcf42bd9987cb047f708a231d9b65b6de8095fea9272517e2a012ea635d56e8f503b32b019fa336871736ec84'
        '37ad086c2a67e248148b6d218e485945765bde5d699b980fcfd7b67300fe6d7842df879957d3f6ea8ad58ebd225b40d7ea840d9e4adbcb36fcbcf452f522010d'
        '6ad2686a58ac104dee4c8aead75870c1f65314167c17f33356f401c12d93f9178f685dfae5b2e54e9556e8ca7b3f42c8f17ac717de8d684134c1d6dddf55c95a'
        '8b687df20f9c8617a1cf79970a0b58ffd0e31a68b5aa090bf7daca3dee6469d0dad7c5a1f3ea8acd230729a23a50faaac83c3ec66c6698901ac0780f4ee29ee1'
        '7adc1644eb2fb25ae754abb1d9137a79b643c212b3926736bbb7c77bccd325eea04acbd5162eea020f728148dd9af50ee88e9ef533afcfdce65b8b42db8af2ef'
        '79abaed6efe10dbee4b238b73b090bc4cab648378645f8c93714ef03094386609ac91ed63db808d98342f34f968ef102288c3d8b2a7625e1bf2f40e2d21f2734')

declare -rAg _cmake_submodules=(
  # aescrypt_gui
  [aescrypt_cli]="${pkgver}"
  # aescrypt_cli
  [aescrypt_engine]=4.1.4
  # [aescrypt_lm]=1.0.13 # private repo
  [program_options]=1.0.4
  [conio]=1.0.6
  [logger]=1.0.8
  [secutil]=1.0.9
  [random]=1.0.5
  [charutil]=1.0.5
  # aescrypt_engine
  # [stf]=1.0.4 # only needed for tests
  [libaes]=1.1.4
  [libhash]=1.0.11
  [libkdf]=1.0.11
  # libaes
  [bitutil]=1.0.5
)

for _module in "${!_cmake_submodules[@]}"; do
  source+=(
    "${pkgbase}-${_module}-${_cmake_submodules[${_module}]}.tar.gz::${_url}/${_module}/archive/refs/tags/v${_cmake_submodules[${_module}]}.tar.gz"
  )
done

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D FETCHCONTENT_FULLY_DISCONNECTED=ON
    -D aescrypt_gui_BUILD_TESTS:BOOL=ON
    -D aescrypt_ENABLE_LICENSE_MODULE:BOOL=OFF
  )
  for _module in "${!_cmake_submodules[@]}"; do
    cmake_options+=(
      "-D FETCHCONTENT_SOURCE_DIR_${_module^^}=${srcdir}/${_module}-${_cmake_submodules[${_module}]}"
    )
  done
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

check() {
  local ctest_exclude_regex=""
  local ctest_options=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )

  cd "${srcdir}"
  ctest "${ctest_options[@]}"
}

package_aescrypt_cli() {
  pkgdesc+=" (CLI)"
  depends=(
    'glibc'
    'libgcc'
    'libstdc++'
  )
  provides=(
    "aescrypt=${pkgver}"
  )
  conflicts=(
    'aescrypt'
  )
  replaces=(
    'aescrypt<=4.4.0-1'
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -f "bin/aescrypt-gui"

  find "share" -mindepth 1 -maxdepth 1 -type d ! -name 'man' -exec \
    rm -rf "{}" +

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vDm644 "LICENSE.md"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.md"
}

package_aescrypt_gui() {
  pkgdesc+=" (GUI)"
  arch=(
    'any'
  )
  depends=(
    "${pkgbase}_cli>=${pkgver}-${pkgrel}"

    'hicolor-icon-theme'
    'perl'
  )
  optdepends=(
    'kdialog: Qt-based password prompt'
    'zenity: GTK-based password prompt'
  )
  provides=(
    "aescrypt-gui=${pkgver}"
  )
  conflicts=(
    'aescrypt-gui'
  )
  replaces=(
    'aescrypt-gui<=4.4.0-1'
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -f "bin/aescrypt"

  cd "share"
  rm -rf "licenses" "man"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
