# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-stardew-valley'
pkgver=1.3.32
pkgrel=1
# Fix upstream versioning shenanigans:
epoch=1
pkgdesc="You’ve inherited your grandfather’s old farm plot in Stardew Valley. Armed with hand-me-down tools and a few coins, you set out to begin your new life."
url='http://stardewvalley.net/'
license=('custom')
arch=('x86_64')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  'file://stardew_valley_1_3_32_25307.sh'
  'StardewValley'
)
sha256sums=(
  'bb34c68f0f161ef9f55c211f08b4d9391c763be7f99b9521dd966241c9d70036'
  'ca0fe151f73f5e8b594b226e1b0539655a2d95a7848eb0e43961cb6daa0de2ff'
  '4245c5063442a57852c11a5867e5dfb6db558953c6b85b198cab0b1765fbdfc8'
  '0c6826084d72917748e54f9308b7395f8d3780b4a745860839203e2af428d202'
)

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/opt/${pkgname}/support/"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/pixmaps/"

  cp -r data/noarch/game "${pkgdir}/opt/${pkgname}/"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;

  install -m 755           \
    "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -m 755         \
    data/noarch/start.sh \
    "${pkgdir}/opt/${pkgname}/"
  install -m 755                     \
    data/noarch/support/*.{sh,shlib} \
    "${pkgdir}/opt/${pkgname}/support/"
  install -m 644                                      \
    'data/noarch/docs/End User License Agreement.txt' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644                   \
    "data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m 644                   \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Workarounds for upstream silliness:
  cd "${pkgdir}/opt/gog-stardew-valley/game"
  # Unless i686 is requested, I am only going to support machines that I can
  # test with:
  ln -s mcs.bin.x86_64 mcs
  # Simplified "bootstrapping" script:
  install -m 755 "${srcdir}/StardewValley" StardewValley
}

# vim: ts=2 sw=2 et:
