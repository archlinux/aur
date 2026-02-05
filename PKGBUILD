# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-bin
pkgver=2026.1.0
pkgrel=1
pkgdesc="A secure and free password manager for all of your devices."
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'libnotify'
  'org.freedesktop.secrets'
  'libxtst'
  'libxss'
  'libnss_nis'
  'nss'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=("https://github.com/bitwarden/clients/releases/download/desktop-v$pkgver/Bitwarden-$pkgver-amd64.deb"
        "${pkgname%-bin}.sh")
sha512sums=('0b0c9719ff4272ef93cc5b85f409fb1135ab0c4da12e3e2d8582576a01fa2c91bc01509370fa7aa6eef5654c6cf8cabd553eae54b04346f295dce69ffc9e079c'
            'b263968cafae65e2456f1ba6bc9fad3c2e5b502ef74b519866c9d028059442f56bf0579cdad9fd74e30d4352e05f72fc9b8e045d80bd49f0a43c113215431014')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

  chmod 04755 "$pkgdir/opt/Bitwarden/chrome-sandbox"

  install -d "$pkgdir/etc/apparmor.d"
  ln -s /opt/Bitwarden/resources/apparmor-profile "$pkgdir/etc/apparmor.d/bitwarden"

  desktop-file-edit --set-key=Exec --set-value="${pkgname%-bin} %U" \
    "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"

	install -Dm755 "${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
}
