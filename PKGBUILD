# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=apk-editor-studio-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Powerful yet easy to use APK editor"
arch=('x86_64')
provides=("${pkgname%-bin}")
url='https://github.com/kefir500/apk-editor-studio'
license=('GPL3')
depends=('qt5-base'
         'java-runtime>=8'
         'hicolor-icon-theme'
         'android-sdk-build-tools'
         'android-sdk-platform-tools')
optdepends=('libsecret: Enable password manager backend')
source=("https://github.com/kefir500/apk-editor-studio/releases/download/v${pkgver}/apk-editor-studio_linux_${pkgver}.AppImage")
sha256sums=('548cdee09e9951b577c0f2b9818ba90dbedef13ca4d57a7e20eab488c5ab1892')

prepare() {
  chmod +x "${pkgname%-bin}_linux_$pkgver.AppImage"
  ./"${pkgname%-bin}_linux_$pkgver.AppImage" --appimage-extract

  # Remove X-AppImage-Version
  sed -i '/AppImage/d' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
	install -d "$pkgdir/usr/bin"
	install -Dm755 "squashfs-root/usr/bin/${pkgname%-bin}" -t "$pkgdir/usr/bin/"

	install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications/"

	install -d "$pkgdir/usr/share/${pkgname%-bin}"
	cp -r "squashfs-root/usr/share/${pkgname%-bin}/" "$pkgdir/usr/share/"

	install -d "$pkgdir/usr/share/icons/"
	cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}
