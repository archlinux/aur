# Maintainer: illusory <becomeillusory@gmail.com>
pkgname=kcxy-wifi-bin
pkgver=1.0.3
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

sha256sums_x86_64=('f14bc6e0feae00ca824bca764b730d62ac8dae64980a76942d541daa0d3aa82f')
sha256sums_aarch64=('4c59bbf02905c26b5c205e39c4ab102ebb49a0b2eabc876fb06ab2ea74193523')
sha256sums_armv7h=('55cb645a660f65374141be64a59450358d5cc775c5845aad850ec2b76f8cb5a6')

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
