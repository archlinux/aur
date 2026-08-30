# Maintainer: xihale <i@xihale.top>
# Contributor: xihale <i@xihale.top>
pkgname=snirect-bin
pkgver=0.3.4
pkgrel=1
pkgdesc='Local HTTP/HTTPS proxy that rewrites TLS SNI by rules to bypass SNI-based censorship (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/xihale/snirect'
license=('MIT')
depends=()
optdepends=(
  'ca-certificates: HTTPS MITM decryption'
  'nss: Firefox certificate store integration'
)
provides=('snirect')
conflicts=('snirect')
install=snirect.install
options=('!strip')
source=('LICENSE::https://raw.githubusercontent.com/xihale/snirect/v'"$pkgver"'/LICENSE')
sha256sums=('9170853f5f6a075badb2db222f98d1ae66eaac2f9a9bde463aa085f7711c25fc')
source_x86_64=("$pkgname-$pkgver-$CARCH::https://github.com/xihale/snirect/releases/download/v$pkgver/snirect-linux-amd64")
sha256sums_x86_64=('77ed6dbe9f255ed3cc2abcb9e5570245e218ca06c363bd8a75c6b483f44642dd')
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/xihale/snirect/releases/download/v$pkgver/snirect-linux-arm64")
sha256sums_aarch64=('7549edd9d39a6b18c33f2425843760488d2ba7a27af9e32d9bac80f7d64a99b8')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-${CARCH}" "$pkgdir/usr/bin/snirect"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Keep in sync with packaging/snirect.service in the source repo.
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/snirect.service" <<'UNIT'
[Unit]
Description=Snirect - SNI RST bypass proxy
Documentation=https://github.com/xihale/snirect
After=network.target

[Service]
ExecStart=/usr/bin/snirect
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
UNIT
}
