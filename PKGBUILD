# Maintainer: illusory <becomeillusory@gmail.com>
pkgname=kcxy-wifi-bin
pkgver=1.0.5
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

sha256sums_x86_64=('fc543cff556f26c9eba3bd90120dd0322eafe4ea6ba87e074372a8628518261d')
sha256sums_aarch64=('d09a666b869edf07ec68e885caf942887087c6e6c4ca1f524b323e131f291f2f')
sha256sums_armv7h=('1d4cf381cc7f40c7faf12b14dc43cb6d843920fc33430718fe6ecd6cb12826b8')

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
