# Maintainer: laserK <echo 'Y29udGFjdEBrYXJzdGVucHVmYWhsLmRlCg==' | base64 -d>
# Maintainer: CloverGit <clovergit@hotmail.com>

pkgbase=stm32cubemx
pkgname=(stm32cubemx stm32cubemx-jre)
pkgver=6.19.0
pkgrel=1
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemx.html"
license=('custom')
options=(!strip !debug)
makedepends=('rsync')
source=("https://sw-center.st.com/packs/resource/library/stm32cube_mx_v${pkgver//./}-lin.zip"
  "stm32cubemx.desktop"
  "stm32cubemx.sh")
sha512sums=('f985b245ed715fd4954faaf4e1c5a734ea4bd37320c6b9a0c059ee16c24ce5e25632ae2eb71bc3cf7670492e9211ed86970b437a7f3533260b863c2764fed793'
            '151d4e51e095d9142235f04738a9061096cce493c33d617ae0cb76aa5af1df83f90acb303448cce1a54f35a867cbbc1660e7b4adb306a2941be4dadb1b00a93c'
            'c28bf62bef34ed5469eb5852907d1b52215705434bb9daa15dd11ba8cbf44e910bddcc1b6784397c32287dde9dde148f6485db3c0c3fb505e4f1c2e0bc58bf51')

prepare() {
  cd "${srcdir}"
  bsdtar -x -f JavaJre.zip -C MX
}

package_stm32cubemx() {
  pkgdesc="Graphical software configuration tool for STM32 microcontrollers that allows generating C initialization code"
  groups=('stm32cube')
  optdepends=(
    'stm32cubemx-jre: ST packaged Java Runtime (Recommended)'
    'java-runtime>=21: System Java Runtime (Required if stm32cubemx-jre is not installed)'
    'archlinux-java-run>=10: Required to launch with system Java runtime'
  )

  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/stm32cubemx"

  rsync -rtl "${srcdir}/MX/" "${pkgdir}/opt/stm32cubemx" --exclude=/jre

  install -Dm 755 "${srcdir}/stm32cubemx.sh" "${pkgdir}/usr/bin/${pkgbase}"

  # Icon and desktop file
  install -Dm 644 "${srcdir}/MX/help/STM32CubeMX.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
  install -Dm 644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications/${pkgbase}.desktop"

  # License
  install -Dm 644 "${srcdir}/MX/help/software_license_agreement.pdf" "$pkgdir/usr/share/licenses/${pkgbase}/LICENSE.pdf"
}

package_stm32cubemx-jre() {
  pkgdesc="ST packaged custom Java Runtime for STM32CubeMX"
  depends=("${pkgbase}=${pkgver}-${pkgrel}"
    'ca-certificates-utils' 'freetype2' 'glibc' 'harfbuzz' 'hicolor-icon-theme' 'lcms2' 'libelf' 'libgcc' 'giflib' 'libjpeg-turbo' 'libnet' 'libpng' 'libstdc++' 'nss' 'gtk3')

  cd "${srcdir}"
  install -d -m755 "${pkgdir}/opt/stm32cubemx"
  rsync -rtl "${srcdir}/MX/jre" "${pkgdir}/opt/stm32cubemx/"
}
# vim: set sw=2 ts=2 et:
