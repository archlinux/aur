# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=imibrowser
pkgver=15.0.5010
pkgrel=2
pkgdesc="iReasoning Freeware MIB browser tool for SNMP API"
url="https://www.ireasoning.com/mibbrowser.shtml"
arch=('x86_64')
license=('LicenseRef-custom' 'GPL-2.0-or-later')
depends=('bash' 'java-runtime' 'hicolor-icon-theme')
makedepends=('imagemagick')
source=("${pkgname}-${pkgver}.zip::https://www.ireasoning.com/download/mibfree/mibbrowser.zip"
        'iMIBrowser.desktop'
        'SLA')
sha256sums=('996adcf0a547fa65a2bdc322223530bcadc9557207084487ea0b024f45187d26'
            'ecfc557a66cb3e11f50c0034019fff55960d4b9551ba0639754ed14647cb6446'
            'f15a61ab9c02cdab41460763608bfd5b5f0624826724e0f80120ecef3285acfa')

prepare() {
  # Information about license agreement for free Personal Edition version
  msg2 "Please read carefully through MIB Browser License Agreement (Personal Edition) at"
  msg2 "https://www.ireasoning.com/downloadmibbrowserlicense.shtml"

  # Acceptance of the software license agreement
  while true; do
    read -p "Do you accept the software license agreement? (y/n) " yn

    case $yn in
    [yY])
      msg2 "Accepted agreement."
      break
      ;;
    [nN])
      msg2 "Declined agreement, exiting."
      exit
      ;;
    *) echo "Invalid response" ;;
    esac

  done

  # Create executable /usr/bin file
  cat >imibrowser.sh <<EOF
#!/bin/sh
/opt/imibrowser/browser.sh &
EOF
}

package() {
  # Install /usr/bin executable file
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install application files
  install -d "${pkgdir}/opt/${pkgname}"/{config,docs,images,lib,mibs}
  install -Dm755 "${srcdir}/ireasoning/mibbrowser"/*.sh "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${srcdir}/ireasoning/mibbrowser/audio/alarm.wav" "${pkgdir}/opt/${pkgname}/audio/alarm.wav"
  install -Dm644 "${srcdir}/ireasoning/mibbrowser/scripts/sample.txt" "${pkgdir}/opt/${pkgname}/scripts/sample.txt"
  cp -a --no-preserve='ownership' "${srcdir}/ireasoning/mibbrowser"/{config,docs,images,lib,mibs} "${pkgdir}/opt/${pkgname}"

  # Install license files
  install -Dm644 "$srcdir/ireasoning/mibbrowser/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ireasoning/mibbrowser/THIRDPARTYLICENSEREADME.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTY_LICENSE"
  install -Dm644 "${srcdir}/SLA" "${pkgdir}/usr/share/licenses/${pkgname}/SLA"
  # Sign the accepted software license agreement
  echo ">> I Accept <<" >>"${pkgdir}/usr/share/licenses/${pkgname}/SLA"

  # Install icons
  for d in 16 24 32 48 128 256; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${d}x${d}/apps"
  done

  for i in 16 24 32 48 128 256; do
    if [ ${i} = '16' ]; then
      layer=5
    elif [ ${i} = '24' ]; then
      layer=4
    elif [ ${i} = '32' ]; then
      layer=3
    elif [ ${i} = '48' ]; then
      layer=2
    elif [ ${i} = '128' ]; then
      layer=1
    elif [ ${i} = '256' ]; then layer=0; fi

    magick "${srcdir}/ireasoning/mibbrowser/images/browser.ico[${layer}]" -define icon:auto-resize=${icons} \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done

  # Install /usr/share/pixmaps png file
  install -Dm644 "${srcdir}/ireasoning/mibbrowser/images/browser.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install desktop file
  install -Dm644 "${srcdir}/iMIBrowser.desktop" "${pkgdir}/usr/share/applications/iMIBrowser.desktop"
}

# vim:set ts=2 sw=2 et:
