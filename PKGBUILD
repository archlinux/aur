# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
pkgname=mautrix-telegram-bin
provides=('mautrix-telegram')
conflicts=('mautrix-telegram')
pkgver=0.2608.0
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
sha256sums=('aa7506fddc11d0b96756be97f75e4936224634072c5a45bd506d8bbab9ef253c'
            '918db359125a6952e5fd138444f6a69d942e1ac79387bc59833b1cf9393a476b'
            'b5d32d45e5619ce7dca0e885262768852a868d20147572629644775fdaef3fab'
            '833506358e65cd8af721db030da97c4193f1d209c0a07bfb86b4564346f6624a')
sha256sums_x86_64=('e8d6fed1deaec5d9bcb8eb93e084362309d5d454d6af2ec73de32ca0daaf3db5')
sha256sums_armv7h=('824fbdefe7a70aeb3c2faaccffc62e896c18e42ebed3b336cf3fed03e202c67b')
sha256sums_aarch64=('b5e179fd6f1bba48e73102590f7c5e92599244ec6fae1740306a52c3bd5780b0')
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
}
