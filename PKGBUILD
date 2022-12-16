# Maintainer: Dhruva Sambrani <dhruvasambrani19@gmail.com>
pkgname=sioyek-appimage
pkgver=2.0.0
pkgrel=1
pkgdesc="A PDF viewer designed for reading research papers and technical books"
arch=('x86_64')
url="https://github.com/ahrm/sioyek"
depends=('fuse2')
# makedepends=()
# optdepends=()
provides=('sioyek')
conflicts=('sioyek')
# replaces=()
# backup=()
options=(!strip)
# install=
# changelog=
_sourcezipname='sioyek-release-linux.zip'
source=(
  ${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_sourcezipname}
)
# noextract=()
_filename='Sioyek-x86_64.AppImage'
_install_path='/opt/appimages/Sioyek.AppImage'
md5sums=('ef86c7847ed7e04f3a8a3a50a9420caf') #autofill using updpkgsums

package() {
  echo Extracting icons and .desktop
  ./${_filename} --appimage-extract "usr/share/pixmaps" > /dev/null 2>&1
  ./${_filename} --appimage-extract "sioyek.desktop" > /dev/null 2>&1
  sed -i -E "s|Exec=sioyek|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 sioyek|" "squashfs-root/sioyek.desktop"

  # Install icons
  echo Installing icons...
  install -dm755 "${pkdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/pixmaps" "${pkgdir}/usr/share"
  chmod -R 755 "${pkgdir}/usr/share/pixmaps"
  find "${pkgdir}/usr/share/pixmaps" -type f -name "sioyek-icon-linux.png" -exec chmod 644 {} \;

  # install .desktop and AppImage file
  echo Installing AppImage and .desktop files...
  install -Dm644 "squashfs-root/sioyek.desktop" "${pkgdir}/usr/share/applications/sioyek.desktop"
  install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
  mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/sioyek"
}
