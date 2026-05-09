# Maintainer:  Adam Mlady <adam.mlady@elevated.ovh>

pkgname="grok-desktop-bin"
pkgver="2.2.0"
pkgrel=1
pkgdesc="Grok Desktop Application Wrapper - Turning Grok by xAI into a Standalone App"

arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Ash-Bash/Grok-Desktop-Wrapper"
license=('unknown')
provides=('grok-desktop')
conflicts=('grok-desktop')
options=('!strip')

source_x86_64=("${url}/releases/download/${pkgver}/grok-desktop_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/grok-desktop_${pkgver}_arm64.deb")
source_armv7h=("${url}/releases/download/${pkgver}/grok-desktop_${pkgver}_armv7l.deb")
sha256sums_x86_64=('0b48e755679ad142c5cfcedab6b649e52b1fb77e29c88e46360da036f8456c7c')
sha256sums_aarch64=('e2b707037748c5bf32f6908712e6e2111acee27cba6554cf3614fdc50fbb2cff')
sha256sums_armv7h=('f069c712bdd24b9e4142f41c84b904406edaca008c372ce6569766e3b24d58bb')

package() {
  case ${CARCH} in
    x86_64)   _deb="grok-desktop_${pkgver}_amd64.deb" ;;
    aarch64)  _deb="grok-desktop_${pkgver}_arm64.deb" ;;
    armv7h)   _deb="grok-desktop_${pkgver}_armv7l.deb" ;;
  esac

  # Archive Extracting
  cd "${srcdir}"
  ar x "${_deb}"
  mkdir -p "${srcdir}/data"
  bsdtar -x -f data.tar.* -C "${srcdir}/data"
  cd "${srcdir}/data"

  # Install Binary Files
  install -vd "${pkgdir}/opt/grok-desktop" "${pkgdir}/usr/bin"
  cp -ar --no-preserve=ownership "${srcdir}/data/opt/Grok Desktop/." "${pkgdir}/opt/grok-desktop/"
  ln -vsf "${pkgdir}/opt/grok-desktop/grok-desktop" "${pkgdir}/usr/bin/grok-desktop"

  # Install and create auxillary files
  install -vd "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${pkgdir}/usr/share/doc/grok-desktop"
  cp -a --no-preserve=ownership "${srcdir}/data/usr/share/icons/hicolor/256x256/apps/grok-desktop.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
  cp -a --no-preserve=ownership "${srcdir}/data/usr/share/doc/grok-desktop/changelog.gz" "${pkgdir}/usr/share/doc/grok-desktop/"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/grok-desktop.desktop" <<EOF
[Desktop Entry]
Name=Grok Desktop
Exec="/opt/grok-desktop/grok-desktop" %U
Terminal=false
Type=Application
Icon=grok-desktop
StartupWMClass=Grok Desktop
Comment=A desktop wrapper application for Grok (by xAI) and X.com
Categories=Network;ArtificialIntelligence;
EOF
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/grok-desktop/LICENSE" <<EOF
No license provided by upstream as of $(date +%Y-%m-%d).
All rights reserved by the copyright holder.
See: ${url}
EOF
}
