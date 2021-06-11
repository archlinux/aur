# Maintainer: Marcel O'Neil <marcel at marceloneil dot com>

pkgname=tutturu
pkgver=0.18.0
pkgrel=1
pkgdesc='Shared Browser App'
arch=('x86_64')
depends=(libxss nss gtk3)
url='https://tutturu.tv/'
license=('custom')

_file="Tutturu-${pkgver}.AppImage"
source=("https://cdn.tutturu.it/${_file}")
sha256sums=('5719e302d8e19f494fdc1e3c6593f036248c75463a74aab7ef18971b2c1cdc7c')

prepare() {
  chmod +x "${_file}"
  "./${_file}" --appimage-extract &> /dev/null

  # update executable path in .desktop file
  sed -i "s/Exec=/Exec=${pkgname}/" "squashfs-root/resources/assets/${pkgname}.desktop"
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
  install -Dm 644 "resources/assets/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

  # icons
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "resources/assets/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}
