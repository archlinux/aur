# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
pkgname=mautrix-telegram-bin
provides=('mautrix-telegram')
conflicts=('mautrix-telegram')
pkgver=0.2609.0
pkgrel=1
pkgdesc="A Matrix-Telegram puppeting bridge (binary release)"
arch=('x86_64' 'armv7h' 'aarch64')
license=('AGPL-3.0-or-later')
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/telegram"
source_x86_64=("$pkgname-x86_64-$pkgver::${url}/releases/download/v${pkgver}/mautrix-telegram-amd64")
source_armv7h=("$pkgname-armv7h-$pkgver::${url}/releases/download/v${pkgver}/mautrix-telegram-arm")
source_aarch64=("$pkgname-aarch64-$pkgver::${url}/releases/download/v${pkgver}/mautrix-telegram-arm64")
source=("${pkgname/-bin}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
        sysusers-mautrix-telegram.conf
        mautrix-telegram.tmpfiles
	mautrix-telegram.service)
sha256sums=('42a7b214aca7f012cd158d5fbbcf000fc85e44b81498458e9926f7acfb6f703e'
            '918db359125a6952e5fd138444f6a69d942e1ac79387bc59833b1cf9393a476b'
            'b5d32d45e5619ce7dca0e885262768852a868d20147572629644775fdaef3fab'
            '833506358e65cd8af721db030da97c4193f1d209c0a07bfb86b4564346f6624a')
sha256sums_x86_64=('a0a731a8a63b9296ca0b7d1e02ec8161e1ee7160c45ddad03ffc74c88c4d8518')
sha256sums_armv7h=('225af61329d9087604ca36978daf73d543ae53304d709a5e53b97bb09b8f0304')
sha256sums_aarch64=('0cf3cc634c0202fa367d4a3b7c926c13be32b60c5b765dd758f3e3534f87cc1d')
backup=("etc/${pkgname/-bin}/mautrix-telegram.yaml")


package() {
  install -Dm755 "$srcdir/$pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/${pkgname/-bin}"
  install -Dm644 "$srcdir/sysusers-mautrix-telegram.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-telegram.conf"
  install -Dm644 "$srcdir/mautrix-telegram.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-telegram.conf"
  install -Dm644 "$srcdir/mautrix-telegram.service" "$pkgdir/usr/lib/systemd/system/mautrix-telegram.service"
  install -dm750 "$pkgdir/etc/${pkgname/-bin}"
  install -Dm644 "$srcdir/telegram-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
  
  echo "Generating config"
  chmod +x "$srcdir/$pkgname-$CARCH-$pkgver"
  "$srcdir/$pkgname-$CARCH-$pkgver" -e -c "${pkgdir}/etc/${pkgname/-bin}/${pkgname/-bin}.yaml"
  chmod 644 "${pkgdir}/etc/${pkgname/-bin}/${pkgname/-bin}.yaml"
  echo "Fixing log path in config file"
  sed -i 's#filename: ./logs/mautrix-whatsapp.log#filename: /var/log/mautrix-whatsapp/mautrix-whatsapp.log#' "${pkgdir}/etc/${pkgname/-bin}/${pkgname/-bin}.yaml"
}
