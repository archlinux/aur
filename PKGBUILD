# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-bin
pkgver=2026.9.1
pkgrel=1
pkgdesc="A secure and free password manager for all of your devices."
arch=('x86_64' 'aarch64')
url="https://bitwarden.com"
license=('GPL-3.0-only')
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
source=("${pkgname%-bin}.sh")
source_x86_64=("https://github.com/bitwarden/clients/releases/download/desktop-v$pkgver/Bitwarden-$pkgver-amd64.deb")
source_aarch64=("https://github.com/bitwarden/clients/releases/download/desktop-v$pkgver/${pkgname%-bin}_${pkgver}_arm64.tar.gz")
noextract=("${pkgname%-bin}_${pkgver}_arm64.tar.gz")
sha256sums=('685a3279ba62b5ea90ec279b57644da747c4a83dcb67fd41bac3c25420dbb642')
sha256sums_x86_64=('da5e0177da10805152268ee9d29cbaf278c4ea10650b0ebcd03c5697537fab82')
sha256sums_aarch64=('7fc35f49580b0293d70d226529c031de68aa8ee3817c276a0d6dca297e7cdce7')

package() {
  if [ "${CARCH}" == "aarch64" ]; then
    install -d "$pkgdir/opt/Bitwarden"
    bsdtar xf "${pkgname%-bin}_${pkgver}_arm64.tar.gz" -C "$pkgdir/opt/Bitwarden/"

    desktop-file-edit --set-key=Exec --set-value="${pkgname%-bin} %U" \
      "$pkgdir/opt/Bitwarden/resources/com.${pkgname%-bin}.desktop.desktop"
    install -d "$pkgdir/usr/share/applications"
    ln -s "/opt/Bitwarden/resources/com.${pkgname%-bin}.desktop.desktop" \
      "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"

    for i in 16 32 64 128 256 512 1024; do
      install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
      ln -s "/opt/Bitwarden/resources/icons/${i}x${i}.png" \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-bin}.png"
    done
  else
    bsdtar xf data.tar.xz -C "$pkgdir/"

    desktop-file-edit --set-key=Exec --set-value="${pkgname%-bin} %U" \
    "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
  fi

  install -d "$pkgdir/etc/apparmor.d"
  ln -s /opt/Bitwarden/resources/apparmor-profile "$pkgdir/etc/apparmor.d/bitwarden"

  install -Dm755 "${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
}
