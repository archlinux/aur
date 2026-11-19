# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-bin
pkgver=2026.11.0
pkgrel=1
pkgdesc="A secure and free password manager for all of your devices."
arch=('x86_64' 'aarch64')
url="https://bitwarden.com"
license=('GPL-3.0-only AND LicenseRef-Bitwarden-License-v1.0')
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
makedepends=('desktop-file-utils')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=("LICENSE_BITWARDEN-$pkgver.txt::https://raw.githubusercontent.com/bitwarden/clients/refs/tags/desktop-v$pkgver/LICENSE_BITWARDEN.txt"
        "${pkgname%-bin}.sh")
source_x86_64=("https://github.com/bitwarden/clients/releases/download/desktop-v$pkgver/bit-Bitwarden-$pkgver-amd64.deb")
source_aarch64=("https://github.com/bitwarden/clients/releases/download/desktop-v$pkgver/bit-${pkgname%-bin}_${pkgver}_arm64.tar.gz")
noextract=("bit-${pkgname%-bin}_${pkgver}_arm64.tar.gz")
sha256sums=('955ba776275f22852e50034ca83acff1e9fffea58e7ffde9f5d1b0c6f0bce79a'
            '685a3279ba62b5ea90ec279b57644da747c4a83dcb67fd41bac3c25420dbb642')
sha256sums_x86_64=('e8c95d91a96661ea827fbc0626d76a1ef7825ee54c8f46f23f218d7c1c88c95a')
sha256sums_aarch64=('13b7500c2b300aa64eda238bfac2c20170958eae4b89e3e9b0661ccc87b767ff')

package() {
  if [ "${CARCH}" == "aarch64" ]; then
    install -d "$pkgdir/opt/Bitwarden"
    bsdtar xf "bit-${pkgname%-bin}_${pkgver}_arm64.tar.gz" -C "$pkgdir/opt/Bitwarden/"

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

  # Files have the world writable bit set
  find "$pkgdir/opt/Bitwarden/" -type f -exec chmod 644 {} \;
  chmod 0755 "$pkgdir"/opt/Bitwarden/{bitwarden,bitwarden-app,chrome_crashpad_handler,*{.so,.so.*}}
  find "$pkgdir/opt/Bitwarden/locales/" -type f -exec chmod 644 {} \;

  install -d "$pkgdir/etc/apparmor.d"
  ln -s /opt/Bitwarden/resources/apparmor-profile "$pkgdir/etc/apparmor.d/bitwarden"

  install -Dm644 LICENSE_BITWARDEN-$pkgver.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE_BITWARDEN.txt"

  install -Dm755 "${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
}
