# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-bin
pkgver=230.240603.0
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tuta.com"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gtk3' 'libsecret' 'nss')
makedepends=('openssl')
source=("${pkgname%-bin}-$pkgver.AppImage::https://github.com/tutao/tutanota/releases/download/${pkgname%-bin}-release-$pkgver/${pkgname%-bin}-linux.AppImage"
        "linux-sig-$pkgver.bin::https://app.tuta.com/desktop/linux-sig.bin"
        "tutao-pub-$pkgver.pem::https://github.com/tutao/tutanota/raw/${pkgname%-bin}-release-$pkgver/tutao-pub.pem")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-linux")
sha512sums=('e7c05dd32593c710f2189e4f2fd168c789571a3bf6e2c1a56987c0c91fef59a450b0b50d0c3d7f2cbfaaab08e9f759a9b1a3efc2efcda0cd09f88f1d4e65e8cf'
            'f53142ecd8e5bc0676e066358783174b396c07eed061790df8c1349223745e97cb3ed4c4172b4fd2ff1a811eaf7d8de5d44ef3b7e3d376a1ec6611284f2aad87'
            '7c6cf9f1074c08b4d38567ced95159c0809af025efe01b0163d9bb5107daabfa873064255186c071a7dc3a9177ccd0c1b2fcc8b085bdbff234965a6710b3ae45')

prepare() {
  # Validate the signature against public key:
  # https://tuta.com/support/#verify-desktop
  openssl dgst -sha512 -verify tutao-pub-${pkgver}.pem -signature \
    linux-sig-${pkgver}.bin "${pkgname%-bin}-$pkgver.AppImage"

  chmod +x "${pkgname%-bin}-$pkgver.AppImage"
  ./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

  # Correct path for desktop file, remove unneeded desktop file keys
  desktop-file-edit --set-key=Exec --set-value="/opt/${pkgname%-bin}/${pkgname%-bin}" \
    --remove-key="X-AppImage-Version" \
    --remove-key="X-Desktop-File-Install-Version" \
    "squashfs-root/${pkgname%-bin}.desktop"
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
