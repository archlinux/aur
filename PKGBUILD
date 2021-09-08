# Maintainer: katoitalia
pkgname=cubbit-appimage
pkgdesc='Cubbit file-sync application - this package always fetches the latest and greatest, reinstall periodically to update to the latest version'
pkgver=latest
pkgrel=1
arch=('x86_64')
url='https://www.cubbit.io/'
license=('custom')
depends=('gtk2' 'hicolor-icon-theme' 'libxss' 'libxtst')
options=('!strip')
provides=('cubbit')
_pkgver=$(curl -s https://cubbit.s3.eu-central-1.amazonaws.com/desktop/linux/latest-linux.yml | awk '/version/ {print $2}')
source=("https://get.cubbit.io/desktop/linux/Cubbit-${_pkgver}.AppImage")
sha256sums=('SKIP')

pkgver() { echo ${_pkgver} 
}

prepare() {
  chmod +x Cubbit-${_pkgver}.AppImage
  ./Cubbit-${_pkgver}.AppImage --appimage-extract
  sed -e 's/Exec=AppRun/Exec=cubbit/;s/Icon=@cubbitdesktop/Icon=cubbit/g' squashfs-root/@cubbitdesktop.desktop > "$srcdir"/cubbit.desktop
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/Cubbit-${_pkgver}.AppImage" "${pkgdir}/usr/bin/cubbit"
  for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 400x400; do
    install -Dm644 "$srcdir"/squashfs-root/usr/share/icons/hicolor/${i}/apps/@cubbitdesktop.png \
                   "$pkgdir"/usr/share/icons/hicolor/$i/apps/cubbit.png
  done
  install -Dm644 "$srcdir"/squashfs-root/license.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 "$srcdir"/squashfs-root/LICENSE.electron.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 "$srcdir"/squashfs-root/LICENSES.chromium.html -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 "$srcdir"/cubbit.desktop -t "$pkgdir"/usr/share/applications
}
