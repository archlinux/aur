# Maintainer: yjun <jerrysteve1101@gmail.com>
# Maintainer: Maik93 <michael.mugnai@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: GPereira <goncalo_pereira@outlook.pt>
# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=stm32cubeprog
pkgver=2.23.0
pkgrel=3
pkgdesc='An all-in-one multi-OS software tool for programming STM32 products.'
arch=('x86_64')
url='https://www.st.com/en/development-tools/stm32cubeprog.html'
license=('custom:SLA0048')

depends=(
  'gtk3'
  'libglvnd'
)

optdepends=(
  'stlink: udev rules for ST-LINK devices'
)

makedepends=(
  'gendesk'
  'icoutils'
)

provides=('stm32cubeprogrammer')
options=('!strip' '!debug')

source=(
  "SetupSTM32CubeProgrammer_linux_64-${pkgver}.zip::https://www.st.com/cloudfront/publish/stm32cubeprg-lin-v${pkgver//./-}/${pkgver}/en/SetupSTM32CubeProgrammer_linux_64.zip"
  'SLA0048_STM32CubeProg.pdf'
)

sha256sums=('6a9e60a5a048c45eb3241f9bb66bdc2e6cbd0119fb2e42568dc059fc6167442a'
            'c6d92c00dee63e0f4a54d8ea62f82a646243c3e1480142ae3e7f4ca5d77d5702')

prepare() {
  cd "${srcdir}"

  chmod u+x jre/bin/java

  gendesk -f -n \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --path "/opt/${pkgname}/bin" \
    --name "STM32CubeProgrammer" \
    --exec "/opt/${pkgname}/bin/STM32CubeProgrammer" \
    --icon "${pkgname}" \
    --categories "Development"

  # STM32CubeMX also bundles a copy of STM32TrustedPackageCreator. However,
  # UM2238 identifies it as part of the STM32CubeProgrammer tool set.
  # Therefore, this package provides its public command wrappers and desktop entry,
  # while the copy bundled with STM32CubeMX remains private to that package.
  gendesk -f -n \
    --pkgname "${pkgname}-trusted-package-creator" \
    --pkgdesc "STM32 Trusted Package Creator" \
    --path "/opt/${pkgname}/bin" \
    --name "STM32 Trusted Package Creator" \
    --exec "/opt/${pkgname}/bin/STM32TrustedPackageCreator" \
    --icon "stm32trustedpackagecreator" \
    --categories "Development"
}

build() {
  cd "${srcdir}"

  rm -rf build icon
  mkdir -p build icon

  ./jre/bin/java "-DINSTALL_PATH=${srcdir}/build" -jar "SetupSTM32CubeProgrammer-${pkgver}.exe" -options-system

  icotool -x "build/util/Programmer.ico" -o "icon"
  icotool -x "build/util/STM32TrustedPackageCreator.ico" -o "icon"
}

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a --no-preserve=ownership "${srcdir}/build/." "${pkgdir}/opt/${pkgname}"

  # icons
  for entry in \
    'Programmer:stm32cubeprog' \
    'STM32TrustedPackageCreator:stm32trustedpackagecreator'; do
    prefix=${entry%%:*}
    icon_name=${entry#*:}

    for icon_file in "${srcdir}/icon/${prefix}_"*x32.png; do
      size=${icon_file##*_}
      size=${size%%x*}

      install -Dm644 "${icon_file}" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${icon_name}.png"
    done
  done

  # documentation
  install -Dm644 "${pkgdir}/opt/${pkgname}/doc/Readme.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname}/doc/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/SLA0048_STM32CubeProg.pdf" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # desktop entries
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-trusted-package-creator.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}-trusted-package-creator.desktop"

  # command wrappers
  for entry in \
    'stm32cubeprogrammer:STM32CubeProgrammer' \
    'stm32_programmer_cli:STM32_Programmer.sh' \
    'stm32_keygen_cli:STM32_KeyGen_CLI' \
    'stm32_signingtool_cli:STM32_SigningTool_CLI' \
    'stm32trustedpackagecreator:STM32TrustedPackageCreator' \
    'stm32trustedpackagecreator_cli:STM32TrustedPackageCreator_CLI'; do
    wrapper_name=${entry%%:*}
    target_name=${entry#*:}

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${wrapper_name}" <<EOF
#!/bin/sh
exec "/opt/${pkgname}/bin/${target_name}" "\$@"
EOF
  done

  # remove unused installer components
  rm -rf \
    "${pkgdir}/opt/${pkgname}/updater" \
    "${pkgdir}/opt/${pkgname}/.installationinformation"
}
# vim: set sw=2 ts=2 et:
