# Maintainer: robertoszek <robertoszek@robertoszek.xyz>
pkgname=bruno-appimage
pkgver=0.1.0
pkgrel=1
pkgdesc="The latest stable AppImage of Bruno - an Opensource API Collection Collaboration Suite"
arch=('x86_64')
url="https://github.com/usebruno/bruno"
provides=('bruno')
conflicts=('bruno')
license=("MIT")
options=(!strip)
_filename=bruno_${pkgver}_x86_64_linux.AppImage
source=(
  ${url}/releases/download/v${pkgver}/${_filename}
)
_install_path='/opt/appimages/Bruno.AppImage'
md5sums=(
  7e188bfedb0237bc53503b0f9644f173
)

package() {
  echo Extracting icons and .desktop
  chmod +x "${_filename}"
  ./${_filename} --appimage-extract "usr/share/icons" > /dev/null 2>&1
  ./${_filename} --appimage-extract "bruno.desktop" > /dev/null 2>&1
  sed -i -E "s|Exec=bruno|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 bruno|" "squashfs-root/bruno.desktop"
  sed -i "s/Exec=AppRun/Exec=\/usr\/bin\/bruno/" "squashfs-root/bruno.desktop"
  # Install icons
  echo Installing icons...
  install -dm755 "${pkdir}/usr/share/icons"
  mkdir -p "${pkgdir}/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
  chmod -R 755 "${pkgdir}/usr/share/icons"
  find "${pkgdir}/usr/share/icons" -type f -name "bruno.png" -exec chmod 644 {} \;

  # install .desktop and AppImage file
  echo Installing AppImage and .desktop files...
  install -Dm644 "squashfs-root/bruno.desktop" "${pkgdir}/usr/share/applications/bruno.desktop"
  install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
  mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/bruno"
}
