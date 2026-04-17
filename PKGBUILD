# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
pkgname=mautrix-telegram-bin
provides=('mautrix-telegram')
conflicts=('mautrix-telegram')
pkgver=0.2604.0
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
sha256sums=('b0b5064231fcce9923f49e7aa7f75e999c93c9653dd11a159170a4a3536c26ec'
            '918db359125a6952e5fd138444f6a69d942e1ac79387bc59833b1cf9393a476b'
            'b5d32d45e5619ce7dca0e885262768852a868d20147572629644775fdaef3fab'
            '833506358e65cd8af721db030da97c4193f1d209c0a07bfb86b4564346f6624a')
sha256sums_x86_64=('33112369fe377dd0befbbcc79ed88df9e31d9d1488241fac6290087136403cae')
sha256sums_armv7h=('f9cddf7b52e2f3dd5ec71e8201465b4183dd2875e7ae6a57d6f030ef2c0e0b9c')
sha256sums_aarch64=('5f55a94816a6d5b7a4bd4080c7ae26f027098368d492f76288ecad9bbf38e512')
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
