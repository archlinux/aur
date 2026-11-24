# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: CloverGit <clovergit@hotmail.com>
# Contributor: yjun <jerrysteve1101@gmail.com>
# Contributor: Maik93 <michael.mugnai@gmail.com>
# Contributor: GPereira <goncalo_pereira@outlook.pt>

pkgname=stm32cubeprog
pkgver=2.24.0
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
  'archlinux-java-run: System Java runtime for STM32CubeProgrammer (For Wayland Launcher Only)'
  'java-openjfx-bin: System JavaFX runtime for STM32CubeProgrammer (For Wayland Launcher Only)'
  'stlink: udev rules for ST-LINK devices'
)

makedepends=(
  'gendesk'
  'icoutils'
)

provides=('stm32cubeprogrammer')
options=('!strip' '!debug')

_installer="STM32CubeProgrammer${pkgver}_linux64.zip"
source=(
  "${_installer}::https://sw-center.st.com/packs/cubeprog_test/Updater/Linux/${_installer}"
  'STM32CubeProgrammer_Wayland'
  'pathfix.c')

sha256sums=('273975212fcf80f71a31ed091559f9289b589d5eb3cbbd090b6068abe80f317c'
            'dde835c8c11db23fee8b35c84fa37d17e4a093ff5eb1128b8c2178c08134e096'
            '652c2a57b83e6b25a273fbaad804c63fee32aa9cc61d48a42c84727ef28b5723')

prepare() {
  cd "${srcdir}"

  gendesk -f -n \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --path "/opt/${pkgname}/bin" \
    --name "STM32CubeProgrammer" \
    --exec "/opt/${pkgname}/bin/STM32CubeProgrammer" \
    --icon "${pkgname}" \
    --categories "Development"

  gendesk -f -n \
    --pkgname "${pkgname}_wayland" \
    --pkgdesc "${pkgdesc}" \
    --path "/opt/${pkgname}/bin" \
    --name "STM32CubeProgrammer (Wayland)" \
    --exec "/opt/${pkgname}/bin/STM32CubeProgrammer_Wayland" \
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
  mkdir -p "desktop-icons"
  icotool -x "util/Programmer.ico" -o "desktop-icons"
  icotool -x "util/STM32TrustedPackageCreator.ico" -o "desktop-icons"

  gcc -shared -fPIC "${srcdir}/pathfix.c" -o "${srcdir}/libstm32-pathfix.so" -ldl
}

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a --no-preserve=ownership "${srcdir}"/{api,bin,doc,lib,util,Data_Base,Drivers,SVD} "${pkgdir}/opt/${pkgname}/"

  install -Dm644 "${srcdir}/libstm32-pathfix.so" "${pkgdir}/opt/${pkgname}/lib/libstm32-pathfix.so"

  # util/rights*.sh
  chmod a+x "${pkgdir}/opt/${pkgname}/bin/"{STM32CubeProgrammer,STM32CubeProgrammerLauncher,STM32_Programmer.sh,STM32_Programmer_CLI} \
    "${pkgdir}/opt/${pkgname}/bin/"{STM32TrustedPackageCreator,STM32TrustedPackageCreator_CLI,STM32_KeyGen_CLI,STM32_SigningTool_CLI} \
    "${pkgdir}/opt/${pkgname}/bin/Utilities/Linux/PSA_ADAC" \
    "${pkgdir}/opt/${pkgname}/bin/jre/bin/java"

  # icons
  for entry in \
    'Programmer:stm32cubeprog' \
    'STM32TrustedPackageCreator:stm32trustedpackagecreator'; do
    prefix=${entry%%:*}
    icon_name=${entry#*:}

    for icon_file in "${srcdir}/desktop-icons/${prefix}_"*x32.png; do
      size=${icon_file##*_}
      size=${size%%x*}

      install -Dm644 "${icon_file}" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${icon_name}.png"
    done
  done

  # documentation
  install -Dm644 "${pkgdir}/opt/${pkgname}/doc/Readme.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname}/doc/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # desktop entries
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}_wayland.desktop" "${pkgdir}/usr/share/applications/${pkgname}_wayland.desktop"
  install -Dm644 "${srcdir}/${pkgname}-trusted-package-creator.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}-trusted-package-creator.desktop"

  install -Dm755 "${srcdir}/STM32CubeProgrammer_Wayland" "${pkgdir}/opt/${pkgname}/bin/STM32CubeProgrammer_Wayland"

  # command wrappers
  for entry in \
    'stm32cubeprogrammer:STM32CubeProgrammer' \
    'stm32cubeprogrammer_wayland:STM32CubeProgrammer_Wayland' \
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
  rm -rf "${pkgdir}/opt/${pkgname}/.installationinformation"
}

# vim: set sw=2 ts=2 et:
