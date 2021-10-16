# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
# Contributor: Marcel O'Neil <marcel at marceloneil dot com>

pkgname=hyperbeam
pkgver=0.21.0
pkgrel=1
pkgdesc='Shared Browser App'
arch=('x86_64')
depends=(dbus-glib gtk3 libdbusmenu-gtk2 libindicator-gtk2 nss)
url='https://hyperbeam.com/'
license=('custom')

_file="Hyperbeam-${pkgver}.AppImage"
source=("https://cdn.hyperbeam.com/${_file}")
sha256sums=('ed4631b5ba93eb9080767826ac8ab8dbdd0dcbcb02c9bb7815081b5191cc77b2')

prepare() {
  chmod +x "${_file}"
  "./${_file}" --appimage-extract &> /dev/null

  # update executable path in .desktop file
  sed -i "s/Exec=/Exec=${pkgname}/" "squashfs-root/resources/assets/xdg.desktop"
}

package() {
  cd squashfs-root/
  chmod 755 -R .

  # application
  install -dm 755 "${pkgdir}/opt/${pkgname}"
  cp -a . "${pkgdir}/opt/${pkgname}"

  # executable
  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin"

  # .desktop file
  install -Dm 644 "resources/assets/xdg.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # icons
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "resources/assets/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}
