# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-bin
pkgver=317.251217.0
pkgrel=1
pkgdesc="The desktop client for Tutanota, the secure e-mail service."
arch=('x86_64')
url="https://tuta.com/secure-email"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'libsecret'
  'nss'
)
makedepends=('openssl')
source=("${pkgname%-bin}-$pkgver.AppImage::https://app.tuta.com/desktop/${pkgname%-bin}-linux.AppImage"
        "linux-sig-$pkgver.bin::https://app.tuta.com/desktop/linux-sig.bin"
        "tutao-pub-$pkgver.pem::https://github.com/tutao/tutanota/raw/${pkgname%-bin}-release-$pkgver/tutao-pub.pem")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-linux")
sha512sums=('48a979f152458c3f67b38638895c1ff3e6c913909bc4c3aee97f75bfab01e35ca0b726b66616fa50ace6a0717aad12a5f64241b631f572268588fc0e60d2e2f2'
            'b5bf364841a95590bc860f526ac984a47d7895a98be9c19caf3da77347a89cb0b21045799bf0a48280cd672720a4c4948f6b62ed6a8d2fd1bb8f4d7195cc20ab'
            '7c6cf9f1074c08b4d38567ced95159c0809af025efe01b0163d9bb5107daabfa873064255186c071a7dc3a9177ccd0c1b2fcc8b085bdbff234965a6710b3ae45')

prepare() {
  # Validate the signature against public key:
  # https://tuta.com/support#verify-desktop
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
