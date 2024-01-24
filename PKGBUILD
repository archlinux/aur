# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-bin
pkgver=3.121.4
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tuta.com"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gtk3' 'libsecret' 'nss')
makedepends=('openssl')
source=("${pkgname%-bin}-$pkgver.AppImage::https://app.tuta.com/desktop/${pkgname%-bin}-linux.AppImage"
        "linux-sig-$pkgver.bin::https://app.tuta.com/desktop/linux-sig.bin"
        "tutao-pub-$pkgver.pem::https://github.com/tutao/tutanota/raw/${pkgname%-bin}-release-$pkgver/tutao-pub.pem")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-linux")
replaces=("${pkgname%-bin}-linux")
sha512sums=('b6ca9f398d5df04d04c5fc8c64b403aa93c34f1056aa36fbc632c412951318ef56aa51dec079c4cd84df0e15fe9edc8f88f86245bf5e7ee92836c39ff016f5b1'
            'f5e05b3e11db72c4f785f3bdc2e30bd36563a043f94ca108eaa752cf4b1d203932ca16c4da0958a046ff2af631e87da2cfef8db33143c65e3ca8d61fc100b4a3'
            '7c6cf9f1074c08b4d38567ced95159c0809af025efe01b0163d9bb5107daabfa873064255186c071a7dc3a9177ccd0c1b2fcc8b085bdbff234965a6710b3ae45')

prepare() {
  # Validate the signature against public key:
  # https://tutanota.com/support/#verify-desktop
  openssl dgst -sha512 -verify tutao-pub-${pkgver}.pem -signature \
    linux-sig-${pkgver}.bin "${pkgname%-bin}-$pkgver.AppImage"

  chmod +x "${pkgname%-bin}-$pkgver.AppImage"
  ./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

  # Correct path for .desktop file
  sed -i 's|Exec=AppRun|Exec=/opt/tutanota-desktop/tutanota-desktop|g' \
    "squashfs-root/${pkgname%-bin}.desktop"

  # Remove X-AppImage-Version
  sed -i '/AppImage/d' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
  find squashfs-root/{locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

  install -d "$pkgdir/opt/${pkgname%-bin}/"
  cp -av squashfs-root/* "$pkgdir/opt/${pkgname%-bin}/"
  chmod 4755 "$pkgdir/opt/${pkgname%-bin}/chrome-sandbox"
  rm -rf "$pkgdir/opt/${pkgname%-bin}/usr/"
  rm "$pkgdir/opt/${pkgname%-bin}"/{"${pkgname%-bin}".desktop,AppRun}

  # Fix permisssions
  chmod 644 "$pkgdir/opt/${pkgname%-bin}"/resources/app{.asar,-update.yml}

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "$pkgdir/usr/bin/"

  install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/share/icons/"
  cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}
