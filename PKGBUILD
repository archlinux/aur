# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgbase="aescrypt"
pkgname=(
  "${pkgbase}_cli"
  "${pkgbase}_gui"
)
pkgver=4.6.0
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
b2sums=('97721e6b921543933ce950b2e0d1bf28516bf946c696c1fa7a67fd49848b343ba6aede940e4beccdca8b0148388fa4cc6a7d9c2f875d6d55d4c60407926d662d'
        '6cf1275ca5b37e98f407f30ce23eb50add4c16b77e186737f650f504914179ec47ba3a2b5b9974666e8731034cb7a7471168053f622e93f232c84ec6cdcb9fe9'
        '4dffaff89cf57a971a36cd43cfb6bd4829f5a9803a472b768e89efbc0f10041523bfbe7b5ddb4d17492a9cde5737ae10b9379e75aae0c83e9aec1d45c7b08b65'
        '40e2389e7cede6dbce6c852c029f24b140bbca66497bbd52813b068994529b1f394ef9da46296ff2b3a4311234a7815523a1e8560087f7facf0123066276620a'
        'a9bcd709c6c9b08e3e851eeab735fab633150777caade94f019744402e225b16b59bbf84fd8240168eb989f2842f92bc3a9f90e190a3aa05ffa5e2cdc44ee751'
        '2b9c910bf1664dacbf918bcd300b849b3ad58ac915dafbcf179e9cb58e184fec57af35b1c7bf665945980ef92b35f40890312fad26e4c5940547555f4b92693f'
        '0ec8b38242cf3be7909d080b996238df2b4d61ea9887d92d1f597da0a22b11a55abf0700e67330179f26e96adba070bb8249188ee51c72320f79063abea9d9b9'
        'b03991ae31dbabdd718592bf35cc8fe0b5c1ea9d78049383e158bc59f88549bcfcb38f1d085c3187343c4de093f64518a7aa23b0785251f749c43c2f8296f5e0'
        '8cf285e2352d437deda49daef4a5778cfc209e9f0953bfd5cabb03beeea3616949eac95be84370f56f0387427d7be9ecd5cdfca581ff743c649d865454712262'
        '7cf1fb6db917488c0bd69eafc8ae85899ac8d71a02e3e352c19b4aabc95b76b43a7467376ef750481739fbda89ba23e998e5ca12336f9c08b0b512ae648b6950'
        '24d48b14b83b3aaf15bce18bd6d505850daa5bbc828d92440de11b1188afd249a750e2bfac97d4182ffc47d76096f6fb5ca273e3a50e4621fe8c2fc65ca7896e'
        '8c856784f6c2a0621c01474b441c87dd2b4217d242d9f28e3ba5920dd009608b2d6ce87bca4b44bb14d0d98fbb9dec241c46eab6324cf07b3d14b72b172a0536'
        'ae35e80ffd0ed184907808eb323495ed705524fbce0b45fbbe93da5942681313b801eac9e057ebac07b426e5bb60ad79fd519bc039517fbe7f1491a618237d44')

declare -rAg _cmake_submodules=(
  # aescrypt_gui
  [aescrypt_cli]="${pkgver}"
  # aescrypt_cli
  [aescrypt_engine]=4.1.5
  # [aescrypt_lm]=1.1.0 # private repo
  [program_options]=1.0.5
  [conio]=1.0.7
  [logger]=1.0.9
  [secutil]=1.1.0
  [random]=1.0.6
  [charutil]=1.0.6
  # aescrypt_engine
  # [stf]=1.0.5 # only needed for tests
  [libaes]=1.1.6
  [libhash]=1.1.1
  [libkdf]=1.1.1
  # libaes
  [bitutil]=1.0.7
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
    -W no-author
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
    'which'
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
