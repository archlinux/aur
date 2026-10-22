# Maintainer: illusory <becomeillusory@gmail.com>
pkgname=kcxy-wifi
pkgver=1.0.1
pkgrel=1
pkgdesc="河南开封科技传媒学院校园网（锐捷 RG-SAM+ eportal）自动认证与掉线重连"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Become-ILLUSORY/kcxy-wifi"
license=('MIT')
depends=('glibc')
makedepends=('go')
backup=('etc/kcxy-wifi/config.ini' 'etc/kcxy-wifi/accounts.json')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/raw/v$pkgver/kcxy-wifi.service"
        "$url/raw/v$pkgver/kcxy-wifi@.service"
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('ed9646478faa81c251d003fb0263ed7fbfe49824ac098cb67cefa8356122c3e1'
            '6c31aca36f7aad6d69965089494187b15136effe227d50f987443e52b02b5210'
            '6b685e40746940d434b516da0567878b0e046e8b35dddf65ac90316e17966089'
            'ebd433f2a76a203420f6d8608bce6b9acdd72b780309ed9f1e180686a3ad6fd5')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath \
    -ldflags "-s -w -X main.version=$pkgver" \
    -o kcxy-wifi .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 kcxy-wifi "$pkgdir/usr/bin/kcxy-wifi"
  install -Dm644 "$srcdir/kcxy-wifi.service" "$pkgdir/usr/lib/systemd/system/kcxy-wifi.service"
  install -Dm644 "$srcdir/kcxy-wifi@.service" "$pkgdir/usr/lib/systemd/system/kcxy-wifi@.service"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 配置文件放 /etc 并列入 backup，升级时保留用户修改
  install -Dm644 config.example.ini "$pkgdir/etc/kcxy-wifi/config.ini"
  install -Dm644 accounts.example.json "$pkgdir/etc/kcxy-wifi/accounts.json"
  chmod 600 "$pkgdir/etc/kcxy-wifi/accounts.json"
}
