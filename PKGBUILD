# Maintainer: witt <1989161762 at qq dot com>

pkgname=shotcut-bin
pkgver=25.08.16
pkgrel=1
pkgdesc="A free, open source(GPLv3), cross-platform (Qt), video editor."
arch=(x86_64)
url="https://www.shotcut.org/"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-imageformats' 'qt6-multimedia' 'qt6-translations'
         'mlt' 'movit' 'ffmpeg' 'libx264' 'libvpx' 'lame' 'frei0r-plugins' 'ladspa' 'qt6-charts' 'desktop-file-utils')
provides=('shotcut' 'shotcut-bin')
conflicts=("shotcut" "shotcut-git")
source=("${pkgname}-${pkgver}.txz::https://github.com/mltframework/shotcut/releases/download/v${pkgver}/shotcut-linux-x86_64-${pkgver//./}.txz")
sha256sums=('7a5689adc9a764b7495d09e85e2e9657c8531a08785fb04dce641f8bc6fdeda3')

package() {
  # bundle
  install -d "${pkgdir}/opt/shotcut"
  cp -a "${srcdir}/Shotcut/Shotcut.app/"* "$pkgdir/opt/shotcut/"

  # desktop file
  install -d "$pkgdir/usr/share/applications"
  ln -s /opt/shotcut/share/applications/org.shotcut.Shotcut.desktop "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
  ln -s /opt/shotcut/share/applications/org.mattbas.Glaxnimate.desktop "${pkgdir}/usr/share/applications/Glaxnimate.desktop"

  # binary
  install -d "$pkgdir/usr/bin"
  ln -s /opt/shotcut/shotcut "${pkgdir}/usr/bin/${pkgname%-bin}"
  ln -s /opt/shotcut/glaxnimate "${pkgdir}/usr/bin/glaxnimate"

  # icons
  find "${pkgdir}/opt/shotcut/share/icons" -type f | while read -r icon_file ; do
    local icon_src="/opt${icon_file#*/opt}";
    local icon_target="${pkgdir}/usr/share${icon_file#*/share}";
    local icon_target_dir=$(dirname "${icon_target}");

    install -dm755 "${icon_target_dir}";

    ln -s "${icon_src}" "${icon_target}"
  done

  # license
  install -d "${pkgdir}/usr/share/licenses"
  ln -s /opt/shotcut/COPYING "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
