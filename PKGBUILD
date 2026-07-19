# Maintainer: Adam Mlady <adam.mlady@elevated.ovh>

pkgname="deepskystacker-bin"
pkgdesc="An tool for astrophotographers that simplifies all the pre-processing steps of deep sky pictures."
pkgrel=1
pkgver=6.2.2

url="https://github.com/deepskystacker/DSS"
arch=('x86_64')
license=('BSD 3-Clause')
provides=('deepskystacker')
conflicts=('deepskystacker')
depends=('libicns')
option=('!strip')

source=("https://github.com/deepskystacker/DSS/releases/download/${pkgver}/DeepSkyStacker-${pkgver}-linux-x64-installer.run")
sha256sums=("210fe41446dd3700c5b21c6a308a2a7353949299535af50c536550837359c524")

prepare() {
  chmod +x "${srcdir}/DeepSkyStacker-${pkgver}-linux-x64-installer.run"
  echo "[INFO] Extracting DSS Installer"
  echo "       Requires Root for Extraction"
  sudo -u root "${srcdir}/DeepSkyStacker-${pkgver}-linux-x64-installer.run" --unattendedmodeui none --mode unattended --prefix "${srcdir}/DSS"
  sudo chown -R "$UID":"$(id -gn)" "${srcdir}/DSS"
  sudo rm -f /usr/share/applications/*DeepSkyStacker*.desktop

  cat >"${srcdir}/DSS.desktop" <<EOF
[Desktop Entry]
Type=Application
Exec=/opt/DSS/DeepSkyStacker
Name=DeepSkyStacker
GenericName=The preferred application for stacking astronomical images
MimeType=text/dssfilelist
Icon=/opt/DSS/DeepSkyStacker.png
Categories=Astronomy;Science
EOF

  cat >"${srcdir}/DSSLive.desktop" <<EOF
[Desktop Entry]
Type=Application
Exec=/opt/DSS/DeepSkyStackerLive
Name=DeepSkyStacker Live
GenericName=The preferred application for live stacking astronomical images
Icon=/opt/DSS/DSSLive.png
Categories=Astronomy;Science
EOF
}

package() {
  mkdir -p "${srcdir}/icons"
  icns2png -o "${srcdir}/icons" -x "${srcdir}/DSS/DeepSkyStacker.icns" >>/dev/null
  icns2png -o "${srcdir}/icons" -x "${srcdir}/DSS/DSSLive.icns" >>/dev/null

  install -d "${pkgdir}/opt/DSS"
  cp -r "${srcdir}/DSS/"* "${pkgdir}/opt/DSS/"
  cp "${srcdir}/icons/DeepSkyStacker_1024x1024x32.png" "${pkgdir}/opt/DSS/DeepSkyStacker.png"
  cp "${srcdir}/icons/DSSLive_1024x1024x32.png" "${pkgdir}/opt/DSS/DSSLive.png"

  install -Dm644 "${srcdir}/DSS.desktop" "${pkgdir}/usr/share/applications/DSS.desktop"
  install -Dm644 "${srcdir}/DSSLive.desktop" "${pkgdir}/usr/share/applications/DSSLive.desktop"

  install -Dm644 "${srcdir}/DSS/LICENSE" "${pkgdir}/usr/share/licenses/DSS/LICENSE"
}
