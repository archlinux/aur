# Maintainer: warmwaffles <warmwaffles@gmail.com>
pkgname="sleek"
pkgver=2.0.20
pkgrel=1
pkgdesc="Todo manager based on the todo.txt syntax for Linux, free and open-source (FOSS)"
arch=("x86_64")
url="https://github.com/ransome1/sleek/"
license=("MIT")
options=(!strip)
makedepends=("nodejs" "npm" "unzip")
depends=("electron" "nodejs")

source=("${url}archive/refs/tags/v${pkgver}.zip" "sleek.desktop" "sleek")
sha512sums=('8df8ad53825a90dffa7d6e9936fdecca212f8fc67eea3c3f97ae77b21486f1b13ea4fbab1b2089df0385347f01c857aeafde4761577b69c34afc6e1139d8da80'
            'c3ebfc99947ba484d8ba8a3cd9b4c4d5a984a95e7cb24faac1ac59506f7f144d4e9c92ea9fcfa585f4d9fee779366d4eb9db0795c910fb221bb266e3c9d5be24'
            'ea1d322bd56c7944a9eae97f4968a6a2e937b510eb3c1c21266428450c5b2ddcd8576718d0b66b69fbce5694ba94e80a692d04bda1e8c2b24a8d814a5ed50963')

build() {
  msg2 "Unzipping v${pkgver}.zip"
  unzip -o "v${pkgver}.zip"
  cd "$srcdir/$pkgname-${pkgver}"

  msg2 "Installing node modules"
  npm install
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  msg2 "Building sleek with electron-builder"
  npm run build:unpack

  msg2 "Moving files"
  install -Dm644 "./dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
  install -d -Dm644 "${pkgdir}/usr/share"
  chmod 755 "${pkgdir}/usr/share"
  cp -r "./dist/linux-unpacked/${pkgname}" "${pkgdir}/usr/share"

  msg2 "Installing LICENSE"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 "Installing startup script and desktop file"
  install -Dm755 "../${pkgname}" -t "$pkgdir/usr/bin/"
  install -Dm644 "../${pkgname}.desktop" -t "$pkgdir/usr/share/applications/"

  msg2 "Installing icons"
  for size in 22 24 32 48 64 128 256 512; do
    install -Dm644 "./build/${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done
  install -Dm644 "./build/512x512.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
}
