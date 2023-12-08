# Maintainer: Zoey Mertes (zmertes at zmertes dot net)
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=playdate-mirror
pkgver=1.0.0
pkgrel=1
pkgdesc='Screen viewer and controller for the Playdate console'
arch=('x86_64')
url='https://play.date/mirror/'
license=('custom:proprietary')
depends=(
  'gtk3'
  'webkit2gtk'
  'libserialport'
)
makedepends=('libicns')
optdepends=()
options=()

source=(
  "https://download.panic.com/mirror/Linux/Mirror-1.0.0.tar.gz"
  "https://download-cdn.panic.com/mirror/Mirror-1.0.0.zip" # macOS version, which we extract the icon out of
  "date.play.Mirror.desktop"
)

sha512sums=(
  '9d24e6cec47e64d8eab359e0d945a0e46abeae0fb05b1992a3bc8b936a2a4f334fbddac77090237baaff8a2c8ab82c6ee8490ec2febebcf556af7750a91a0303'
  '8ad9ee2ff9446f1d3cd0138ab89f9411707e8030998061cc607d935e6e9cd6f2ca66c79527748a0144feec3ea37c58bd5c4cae444445a0c2262b6d7a0c5bed4b'
  '6c89ab283862499713e779aabe046cfe23c8117f82f3e79a73a79f477ecb428753b1835e62eeb30247101dfa0f14b68f7b2c4ef026c678657dac644888503952'
)

package() {
  # make needed directories
  mkdir -p "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/licenses/playdate-mirror/"

  echo >&2 'Packaging the mirror binary'
  install -m755 "${srcdir}/Mirror-1.0.0/Mirror" "${pkgdir}/usr/bin/PlaydateMirror"
  
  echo >&2 'Extracting the icons from the macOS package'
  icns2png -x --output "${srcdir}" "${srcdir}/Mirror.app/Contents/Resources/AppIcon.icns"
  install -D -m 644 "${srcdir}/AppIcon_256x256x32.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/date.play.Mirror.png"
  install -D -m 644 "${srcdir}/AppIcon_512x512x32.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/date.play.Mirror.png"
  install -D -m 644 "${srcdir}/AppIcon_1024x1024x32.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/date.play.Mirror.png"

  echo >&2 'Packaging the license'
  # the NSHumanReadableCopyright string from the macOS Info.plist
  # which matches the text in the Linux version's About dialog
  echo "Copyright © Panic, Inc. All rights reserved." > "${pkgdir}/usr/share/licenses/playdate-mirror/license.txt"

  echo >&2 'Packaging the desktop file'
  install -D -m 755 -T \
    "${srcdir}/date.play.Mirror.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}

