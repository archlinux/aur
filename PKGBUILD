# Maintainer: tarball <bootctl@gmail.com>

pkgname=narrowlink-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Securely connect devices and services, even in restricted networks'
url='https://narrowlink.com'
arch=(i686 x86_64 aarch64)
license=(MPL2 AGPL3)
provides=(narrowlink narrowlink-agent narrowlink-token-generator narrowlink-gateway)
conflicts=("${provides[@]}")

_base="https://github.com/narrowlink/narrowlink/releases/download/$pkgver/narrowlink"

source=(narrowlink.service.in)
source_i686=(
  narrowlink-agent-i686-$pkgver::$_base-agent-i686-unknown-linux-musl
  narrowlink-gateway-i686-$pkgver::$_base-gateway-i686-unknown-linux-musl
  narrowlink-i686-$pkgver::$_base-i686-unknown-linux-musl
  narrowlink-token-generator-i686-$pkgver::$_base-token-generator-i686-unknown-linux-musl
)
source_x86_64=(
  narrowlink-agent-x86_64-$pkgver::$_base-agent-x86_64-unknown-linux-musl
  narrowlink-gateway-x86_64-$pkgver::$_base-gateway-x86_64-unknown-linux-musl
  narrowlink-token-generator-x86_64-$pkgver::$_base-token-generator-x86_64-unknown-linux-musl
  narrowlink-x86_64-$pkgver::$_base-x86_64-unknown-linux-musl
)
source_aarch64=(
  narrowlink-aarch64-$pkgver::$_base-aarch64-unknown-linux-musl
  narrowlink-agent-aarch64-$pkgver::$_base-agent-aarch64-unknown-linux-musl
  narrowlink-gateway-aarch64-$pkgver::$_base-gateway-aarch64-unknown-linux-musl
  narrowlink-token-generator-aarch64-$pkgver::$_base-token-generator-aarch64-unknown-linux-musl
)
sha256sums=('2f596a79cac41bde25dd610d1aa1580509412556a8a0cb36c0e7226ea11b67db')
sha256sums_i686=('f6b08f9d75677de43c057609520ce89235a9ffabc05a1031c467aad1911ca3d7'
                 'c048b6132a2703ca1e6395362caf105cc396860c07c1ab4ec76d6ad7b0e8b0f8'
                 '71709320207813adf6e0f2ffc4ed1df2f2334dcf4a1c45a63ef44b77e88b58ad'
                 'ee2409ba87e1d8202878fc6cd25ab301d27cdc09616ae404ed27fc34df12b6b1')
sha256sums_x86_64=('27812a76d1bf099824b71edfef6fe0fbe87c10b263dd740df145e95912ed44f8'
                   '90c864a53db4ceddcf656245302420c2b831ac9cb8a620d22e958e42f935c6fd'
                   '5afa802d9bb8bf4effb44c126d0242e2b18a7ea24af312378c0914c80ce4e553'
                   '9441e1f0a3f75587c1ef22357cda9be48885adfa7b29fefd72ac3fbfeea493ea')
sha256sums_aarch64=('4442e3daacc0c91fa87ef18fe145f2072946f160f4c5cd167a4f06618de30f08'
                    'a7d44bcd67e7561fa4961a513cf7a547bc06bbc64fd758ce77a494c614e50280'
                    '3e65c07ed5fd3ab121acd8df0f869a52735681b4126e33d28a5072015e443081'
                    'e37fb1fc22a21ecd3a476f1043296f5e2d1e2e07a65583d50e867424ccb74dcf')

# Splitting this into four separate packages would be a bit too much IMHO
package() {
  install -Dm755 "narrowlink-$CARCH-$pkgver" \
    "$pkgdir/usr/bin/narrowlink"

  install -Dm755 "narrowlink-agent-$CARCH-$pkgver" \
    "$pkgdir/usr/bin/narrowlink-agent"

  install -Dm755 "narrowlink-gateway-$CARCH-$pkgver" \
    "$pkgdir/usr/bin/narrowlink-gateway"

  install -Dm755 "narrowlink-token-generator-$CARCH-$pkgver" \
    "$pkgdir/usr/bin/narrowlink-token-generator"

  install -dm700 "$pkgdir/etc/narrowlink"
  install -dm755 "$pkgdir/usr/lib/systemd/system"

  for svc in agent gateway; do
    sed "s/__NAME__/$svc/g" \
      <narrowlink.service.in \
      >"$pkgdir/usr/lib/systemd/system/narrowlink-$svc.service"
  done
}
