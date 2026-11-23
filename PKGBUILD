# Maintainer: Gyula Kisrákói <krakoi90@gmail.com>
pkgname=ib-clientportal-bin
# Upstream publishes one unversioned zip. This date is the gateway build
# printed at startup (24 Apr 2023). Bump it when the zip checksum changes.
pkgver=20230424
pkgrel=1
pkgdesc="Interactive Brokers Client Portal Gateway for the Web API"
arch=('any')
url="https://www.interactivebrokers.com/campus/ibkr-api-page/cpapi-v1/"
license=('LicenseRef-proprietary')
depends=('java-runtime-headless>=11' 'sh')
options=('!strip' '!debug')
noextract=("clientportal.gw-$pkgver.zip")
source=(
  "clientportal.gw-$pkgver.zip::https://download2.interactivebrokers.com/portal/clientportal.gw.zip"
  "ib-clientportal-gw.sh"
)
sha256sums=('2f2d380b2f9424520ff5f9c11fe45e82ef39459329ac056258a3274bea6f76f9'
            '59b1566e72c44d92cc32e063be74d481a7df5bc782a4bd0b15c00115df40f1e7')

package() {
  local dest="$pkgdir/usr/share/ib-clientportal-gw"

  install -dm755 "$dest"
  bsdtar -xf "$srcdir/clientportal.gw-$pkgver.zip" -C "$dest" --no-same-owner
  rm -f "$dest/bin/run.bat"
  chmod 755 "$dest/bin/run.sh"

  install -Dm755 "$srcdir/ib-clientportal-gw.sh" "$pkgdir/usr/bin/ib-clientportal-gw"
  install -Dm644 "$dest/doc/GettingStarted.md" \
    "$pkgdir/usr/share/doc/$pkgname/GettingStarted.md"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
This software is proprietary to Interactive Brokers.
The upstream clientportal.gw.zip ships no license file.
EOF

  chown -R root:root "$pkgdir"
}
