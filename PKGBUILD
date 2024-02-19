# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-bin
pkgver=218.240219.0
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
sha512sums=('d59ac336f17cec035e5f1cc56497bedeb5610bb203c83da1beb9358a8ad7cf68fdc218941bf40733d9c1dea68a39dc237b8b03dd24728cf02856b0e26fa58f3c'
            'b3e8cf7607d2305f2bbb75e4095bef55132e085829b8d120599222de51090509d3d7369762e6910bcc0f1cf67f7e7f95136c1867ae40bef46c23021602585243'
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
