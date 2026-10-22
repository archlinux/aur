# Maintainer: illusory <becomeillusory@gmail.com>
pkgname=kcxy-wifi-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="河南开封科技传媒学院校园网（锐捷 RG-SAM+ eportal）自动认证与掉线重连（预编译）"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Become-ILLUSORY/kcxy-wifi"
license=('MIT')
depends=('glibc')
provides=('kcxy-wifi')
conflicts=('kcxy-wifi')
backup=('etc/kcxy-wifi/config.ini' 'etc/kcxy-wifi/accounts.json')

_gh="$url/releases/download/v$pkgver"
_asset_amd64="kcxy-wifi-linux-amd64.tar.gz"
_asset_arm64="kcxy-wifi-linux-arm64.tar.gz"
_asset_armv7="kcxy-wifi-linux-armv7.tar.gz"

source_x86_64=("$_gh/$_asset_amd64")
source_aarch64=("$_gh/$_asset_arm64")
source_armv7h=("$_gh/$_asset_armv7")

sha256sums_x86_64=('85e5d6427b81dccfa42c50a28118292de142cdd98c181e227aef01eddafae50e')
sha256sums_aarch64=('c4235fa23f18ace0b96d54711bc2a5d63a2ec70af13b3b0e7426ecb9b9175bea')
sha256sums_armv7h=('38b377525a1d6a5c52975609048946e2974a93131e5201a06aaace42742f0ae7')

package() {
  case "$CARCH" in
    x86_64)  _asset="$_asset_amd64" ;;
    aarch64) _asset="$_asset_arm64" ;;
    armv7h)  _asset="$_asset_armv7" ;;
  esac

  tar -xzf "$srcdir/$_asset" -C "$srcdir"

  install -Dm755 "$srcdir/kcxy-wifi" "$pkgdir/usr/bin/kcxy-wifi"
  install -Dm644 "$srcdir/kcxy-wifi.service" "$pkgdir/usr/lib/systemd/system/kcxy-wifi.service"
  install -Dm644 "$srcdir/kcxy-wifi@.service" "$pkgdir/usr/lib/systemd/system/kcxy-wifi@.service"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 配置文件放 /etc 并列入 backup，升级时保留用户修改
  install -Dm644 "$srcdir/config.example.ini" "$pkgdir/etc/kcxy-wifi/config.ini"
  install -Dm644 "$srcdir/accounts.example.json" "$pkgdir/etc/kcxy-wifi/accounts.json"
  chmod 600 "$pkgdir/etc/kcxy-wifi/accounts.json"
}
