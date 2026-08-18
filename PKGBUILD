# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=imibrowser
pkgver=16.0.6002
pkgrel=1
pkgdesc="Freeware MIB browser tool for SNMP API (requires SLA acceptance)"

url="https://www.ireasoning.com/mibbrowser.shtml"
arch=('x86_64')
license=('LicenseRef-custom' 'GPL-2.0-or-later')
depends=('bash' 'java-runtime' 'hicolor-icon-theme')
makedepends=('imagemagick')
options=('!strip' '!debug' '!emptydirs')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::https://www.ireasoning.com/download/mibfree/mibbrowser.zip"
        "iMIBrowser.desktop"
        "SLA")
sha256sums=('b6049e270d2fc80c3f5e860e1a2b2395d803231a7389add938f50fda99e42a98'
            'ecfc557a66cb3e11f50c0034019fff55960d4b9551ba0639754ed14647cb6446'
            'f15a61ab9c02cdab41460763608bfd5b5f0624826724e0f80120ecef3285acfa')

prepare() {
  # Create the launch script that points to the real browser.sh
  cat >"${srcdir}/imibrowser.sh" <<-EOF
	#!/usr/bin/env sh
	/opt/${pkgname}/browser.sh &
	EOF
}

package() {
  # Install the launch script to /usr/bin
  install -Dm755 "${srcdir}/imibrowser.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install the application files
  install -Dm644 "${srcdir}/ireasoning/mibbrowser/audio/alarm.wav" -t "${pkgdir}/opt/${pkgname}/audio"
  install -Dm644 "${srcdir}/ireasoning/mibbrowser/scripts/sample.txt" -t "${pkgdir}/opt/${pkgname}/scripts"
  cp -Pr "${srcdir}/ireasoning/mibbrowser"/{config,docs,images,lib,mibs} "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${srcdir}/ireasoning/mibbrowser"/*.sh "${pkgdir}/opt/${pkgname}"

  # Install license files
  install -Dm644 "${srcdir}/ireasoning/mibbrowser/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ireasoning/mibbrowser/THIRDPARTYLICENSEREADME.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTY_LICENSE"
  install -Dm644 "${srcdir}/SLA" \
    "${pkgdir}/usr/share/licenses/${pkgname}/SLA"

  # Icon sizes and their corresponding layers in the ICO file
  declare -A icon_layers=(
    [16]=5
    [24]=4
    [32]=3
    [48]=2
    [128]=1
    [256]=0
  )

  # Install icons
  for size in "${!icon_layers[@]}"; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    magick "${srcdir}/ireasoning/mibbrowser/images/browser.ico[${icon_layers[$size]}]" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done

  # Install /usr/share/pixmaps PNG file
  install -Dm644 "${srcdir}/ireasoning/mibbrowser/images/browser.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the desktop entry file
  install -Dm644 "${srcdir}/iMIBrowser.desktop" "${pkgdir}/usr/share/applications/iMIBrowser.desktop"
}

# vim:set ts=2 sw=2 et:
