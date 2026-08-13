# Maintainer: Sato Ki <satoki at em dot advant dot click>
pkgname=qfinderpro-bin
pkgver=7.14.1.0727
pkgrel=1
pkgdesc="Quickly find and easily access all of the QNAP NAS on the same LAN."
url="https://www.qnap.com/en/utilities/essentials"
arch=('x86_64')
license=('custom')
makedepends=('patchelf')
depends=(
  'dbus'
  'desktop-file-utils'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'libglvnd'
  'libjpeg-turbo'
  'libpng'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'pcre2'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'zlib'
)
source=(
  "${pkgname}-${pkgver}.deb::https://download.qnap.com/Storage/Utility/QNAPQfinderProUbuntux64-${pkgver}.deb"
  "QNAPQfinderPro.desktop.patch"
  "QfinderPro.sh.patch"
  "QfinderUpload.sh.patch"
)
noextract=()
sha256sums=(
  '88ec61efcb643c710fa8c91dd0e1d1001244fb568b4cee5fd5a8ed0f1ea84844'
  '3994451507c01136c178feabd411ea7dbb44616370a174af34931a6114dc19ee'
  'd100cbe26eadfef6a7047569f276547825f72c7a14e1845d2366819205cf7abe'
  'aa1ff8338052ae63e8380d80ac35f0cd702c2bab1157187a78043f73bb3f848a'
)

package() {
  cd $srcdir

  ar x "${pkgname}-${pkgver}.deb"

  # The upstream deb ships binaries in /usr/local/bin/QNAP and the bundled Qt5
  # in /usr/local/lib/QNAP; merge both into /opt/QNAP/QfinderPro.
  tar --no-same-owner --transform='s#usr/local/bin/QNAP#opt/QNAP#' \
                      --transform='s#usr/local/lib/QNAP#opt/QNAP#' \
      -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"

  # The bare directory entries under usr/local survive the transform.
  rm -rf "${pkgdir}/usr/local"

  patch "${pkgdir}/usr/share/applications/QNAPQfinderPro.desktop" < "${srcdir}/QNAPQfinderPro.desktop.patch"
  patch "${pkgdir}/opt/QNAP/QfinderPro/QfinderPro.sh" < "${srcdir}/QfinderPro.sh.patch"
  patch "${pkgdir}/opt/QNAP/QfinderPro/QfinderUpload.sh" < "${srcdir}/QfinderUpload.sh.patch"

  # QfinderPro's RUNPATH still points at the old /usr/local location.
  patchelf --set-rpath '$ORIGIN' "${pkgdir}/opt/QNAP/QfinderPro/QfinderPro" \
                                 "${pkgdir}/opt/QNAP/QfinderPro/QfinderUpload"
}
