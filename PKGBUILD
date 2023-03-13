# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-bin
pkgver=3.110.1
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'libsecret' 'nss')
makedepends=('openssl')
source=("${pkgname%-bin}-$pkgver.AppImage::https://mail.tutanota.com/desktop/${pkgname%-bin}-linux.AppImage"
        "linux-sig-$pkgver.bin::https://mail.tutanota.com/desktop/linux-sig.bin"
        "tutao-pub-$pkgver.pem::https://github.com/tutao/tutanota/raw/${pkgname%-bin}-release-$pkgver/tutao-pub.pem")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-linux")
replaces=("${pkgname%-bin}-linux")
sha512sums=('2bbb296f4f5f967f6012880dd35a1416cd9f9f6798100b7b98cebf258f7d76bd5f4973977335d85a55f2c57d5fedd70bd08545c37f3ef501407055d6d8032c28'
            '1761c64f284049f58dc531d7a33843e32f2d583e9f9bd36ecc7a0871520111c106220c5a23a6001521dffe3653a48b3762a0946547140a8fd7188af2b24f32fc'
            '7c6cf9f1074c08b4d38567ced95159c0809af025efe01b0163d9bb5107daabfa873064255186c071a7dc3a9177ccd0c1b2fcc8b085bdbff234965a6710b3ae45')

prepare() {
  # Validate the signature against public key:
  # https://tutanota.com/howto/#verify-desktop
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
