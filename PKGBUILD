# Maintainer: Denis Vadimov <me @ bloody.pw>

_baseurl="https://qn.phie.ovh/binaries/desktop/"
_version=$(curl ${_baseurl}current_version)
_filename="Carnet-${_version}-${CARCH}"
pkgname=carnet
pkgver=0.18.5
pkgrel=1
pkgdesc='Carnet is a complete and rich note taking app for Android and Linux with sync capabilities'
arch=('i386' 'x86_64')
url='https://github.com/PhieF/CarnetDocumentation'
license=('GPLv3')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss' 'mime-types' 'libappindicator-gtk3' 'gconf' 'libindicator-gtk3' 'libnotify' 'libxss' 'libxtst' 'curl')
install=carnet.install
source=('carnet.desktop'
	'carnet.install'
	"carnet.AppImage::${_baseurl}daily/${_filename}.AppImage")
sha512sums=('5627f8463af368c1208dc7de81f8c957ea03584fe0bd95a5eaebb258c7c6c7024c7014e2f78dea2a411fad58753b4155c86ffa7e2a94954f143edf5c7f264348'
	    'f8699c39bb4fc4bd097077f5cee4b1269875711497eb4aa1e5ff695eaf1bf1f9403f7dd5c8e9fe84623b3408059f762d9c51a07754bd86b5017f6b3392fe08b3'
	    'SKIP')
pkgver() {
  echo "${_version}"
}

package() {
  chmod u+x ${srcdir}/carnet.AppImage
  ${srcdir}/carnet.AppImage --appimage-extract
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps,icons}},opt}
  cp -r ${srcdir}/squashfs-root "${pkgdir}/opt/"
  mv "${pkgdir}/opt/squashfs-root" "${pkgdir}/opt/carnet" 
  rm -rf "${pkgdir}/opt/carnet/usr/" "${pkgdir}/opt/carnet/carnet.desktop" "${pkgdir}/opt/carnet/AppRun" "${pkgdir}/opt/carnet/carnet.png"
  chmod 0755 "${pkgdir}/opt/carnet" -R

  ln -s /opt/carnet/carnet "${pkgdir}/usr/bin/carnet"

  # Install .desktop
  cat "${srcdir}/squashfs-root/carnet.desktop" | grep -E "X-AppImage-BuildId=" | tee -a "${srcdir}/carnet.desktop"
  cat "${srcdir}/squashfs-root/carnet.desktop" | grep -E "X-AppImage-Version=" | tee -a "${srcdir}/carnet.desktop"
  install -m755 "${srcdir}/carnet.desktop" "${pkgdir}/usr/share/applications/"

  # Install icons
  chmod 0755 "${srcdir}/squashfs-root/usr/share/icons" -R
  cp -dr --no-preserve=ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  ln -s /usr/share/icons/hicolor/512x512/apps/carnet.png "${pkgdir}/usr/share/pixmaps/carnet.png"
}
