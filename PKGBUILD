# Maintainer: illusory <becomeillusory@gmail.com>
pkgname=kcxy-wifi-bin
pkgver=1.0.4
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

sha256sums_x86_64=('7c99341b37b159579ca03fb65835ff2e157b06c1fb3d7a7136aadb38b1ea9b5f')
sha256sums_aarch64=('c00a9014d0ca8cff3df77896c2611df91552c83840041c6b401c075005ac5ebc')
sha256sums_armv7h=('950440987a475c9a316846ce488d61b47726f8fd759389cd5a940d763ad500a4')

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
