# Maintainer: laserK <echo 'Y29udGFjdEBrYXJzdGVucHVmYWhsLmRlCg==' | base64 -d>
# Maintainer: CloverGit <clovergit@hotmail.com>

pkgbase=stm32cubemx
pkgname=(stm32cubemx stm32cubemx-jre)
pkgver=6.17.0
pkgrel=3
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemx.html"
license=('custom')
options=(!strip !debug)
makedepends=('rsync')
source=("https://sw-center.st.com/packs/resource/library/stm32cube_mx_v${pkgver//./}-lin.zip"
  "stm32cubemx.desktop"
  "stm32cubemx.sh")
sha512sums=('a4ea1f481b37afd68d4e4ef904224329972bd33f6038854009effc776f9a931c9ad057a9be927cb354fc4e99639804896553923c58f2c27c123c36b2af1cb60c'
  '83c67bef3e8f8434903fe0c067442cc7473459386fdcb0225af1b3a75fd75e2be393f91f877c8410f1055ca4ec531b2df707fcab10663cae382a7f4066c8548b'
  'c28bf62bef34ed5469eb5852907d1b52215705434bb9daa15dd11ba8cbf44e910bddcc1b6784397c32287dde9dde148f6485db3c0c3fb505e4f1c2e0bc58bf51')

prepare() {
  cd "${srcdir}"
  bsdtar -x -f JavaJre.zip -C MX
}

package_stm32cubemx() {
  pkgdesc="Graphical software configuration tool for STM32 microcontrollers that allows generating C initialization code"
  groups=('stm32cube')
  optdepends=(
    'stm32cubemx-jre: ST packaged Java Runtime'
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
