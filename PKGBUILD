# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgbase="aescrypt"
pkgname=(
  "${pkgbase}_cli"
  "${pkgbase}_gui"
)
pkgver=4.7.0
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
b2sums=('f9ffa8a5b53e57a7c349479c1d19cd921381ee718b0e59889b17072204b498a9a867b6ebcd9749316c7a629484a530e56f68959cc1cdf34e547285daf80e3f42'
        '1bb2a043ef198658936b5e047007d7a1edc3d79ae788397bc5a42ca7b357df1334e2014c9e8c7b16e699becc69878ea0881c708b08e8f7dbab2aadb5eecc885b'
        '9fc212b078ffe36a367bdde1456aa02a62341c10700c0034628a1ff4a0a57a31cc733956ba0ee8d0a7d9331f9eef2441492fc2c562eee17ab6ee5c128ad02052'
        '5b9bc9051ba52df7d7df18332632d723e53d2aa25268e72d3d1e8fc77e16cedc0c9df47ff3a57c23f996e0e9ba0d2a895931817bdb825f14ec347061387c8971'
        'ed93b4321cdd92a639faefadc0647eb8be87714aaa2b44c728c76348fbc0fe1e8829f948fbc8828d4fd95042f688d0aa13924b2318e2e1db6e98d2344511a7b8'
        '09357cc45cca4a1bb77115249a83ff4a0a5a5e0559f064474b66e6ea81024dc4349f48d992e19dda4f1020f4a783645442852dab28a87300ffb599c8e5c196be'
        'ca673ca8c2b2972695e4f9128ac376f59495527c9f637005da203bfd1e61887309e3a1828ccfb4d9057aa64a836ab3668e281b887c504979efc0beb65c12513c'
        '303abed9d938c0dc0df4c31d935fae34d370dc478de1ea633372c1cf797a7babd32c534c9b625b845f413b3ee942bb2faf7752568ec80d08e4fe6bb5a91a11c0'
        '6642a180815a1857fd30d2fe0f94f5605501143c67ce5076075dc1d5518e6933ccf32b88ba73cac14f4d8c7b8e0d67e337a24af4eed54bb982a978649700c0c1'
        '9642a49c24e055a9d73ceaf6639bcb8e8478ca8b1ccf9a319570ab3d4462853ec029902226fd24f31fbe30f5ab88d7e2ab1543106b619a68b13962b2cd0e6566'
        '03718b21183960042bcfaad343047598cf05cdd3eec9d498ad9f9f62815ace3854e51b6f5ec3ad982b400c496355fbf6d3f3e7ea82a61a1069ea6b94c4e53ee4'
        'cfcd06052dc0b4941b830176ac77f8f436d6335554ba35d9d85482b36d0b9cc408311d93f53b152c9f691f15c4d315b056a6a14e14f8b0dfb61b66f3ddc1fc27'
        '81d2e940b9820a8780ac27b4d476a1a78a9a220f7714fe064ca91f0292fbc81bedf5c13fe99066eaa46d3bb0c0d87777150c8689e34495a04354185407c6c965')

declare -rAg _cmake_submodules=(
  # aescrypt_gui
  [aescrypt_cli]="${pkgver}"
  # aescrypt_cli
  [aescrypt_engine]=4.1.7
  # [aescrypt_lm]=1.1.2 # private repo
  [program_options]=1.0.7
  [conio]=1.0.9
  [logger]=1.1.1
  [secutil]=1.1.2
  [random]=1.0.8
  [charutil]=1.0.8
  # aescrypt_engine
  # [stf]=1.0.6 # only needed for tests
  [libaes]=1.1.7
  [libhash]=1.1.2
  [libkdf]=1.1.2
  # libaes
  [bitutil]=1.0.8
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
