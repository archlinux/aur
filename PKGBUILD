# Maintainer: Sabu Siyad <hello@ssiyad.com>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

# Past Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.me>
# Past Maintainer: Emerson Almeida <duke.m16@gmail.com>
# Past Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.5.3
pkgrel=1
pkgdesc="The desktop version of your favorite mailsuite!"
arch=('x86_64')
license=('custom')
url="https://www.zoho.com/mail/desktop"

source=("https://downloads.zohocdn.com/zmail-desktop/linux/zoho-mail-desktop-x64-v${pkgver}.AppImage"
        "zoho-mail-desktop.desktop")
sha256sums=("8618e8ba59dc1dfd287b09d923c260f57a85cc8000ae5999ebc14dc21485c15b"
            "SKIP")

prepare() {
  chmod +x "zoho-mail-desktop-x64-v${pkgver}.AppImage"
  ./"zoho-mail-desktop-x64-v${pkgver}.AppImage" --appimage-extract
}

package() {
  mkdir -p "${pkgdir}/opt"
  cp -Lr "${srcdir}/squashfs-root" "${pkgdir}/opt"
  mv "${pkgdir}/opt/squashfs-root" "${pkgdir}/opt/zoho-mail-desktop"
  find "${pkgdir}/opt" -type d -exec chmod +rx {} \;

  mkdir -p "${pkgdir}/usr/bin"
  echo '#!/usr/bin/env bash
       gtk-launch zoho-mail-desktop.desktop' | tee "${pkgdir}/usr/bin/zoho-mail-desktop"
  chmod +x "${pkgdir}/usr/bin/zoho-mail-desktop"

  mkdir -p "${pkgdir}/usr/share/applications"
  cp -Lr "${srcdir}/zoho-mail-desktop.desktop" "${pkgdir}/usr/share/applications"

  for img in 1024x1024 128x128 16x16 256x256 32x32 48x48 512x512 64x64; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${img}/apps"
    cp -Lr "${srcdir}/squashfs-root/usr/share/icons/hicolor/${img}/apps/zoho-mail-desktop.png" "${pkgdir}/usr/share/icons/hicolor/${img}/apps/"
  done
}
