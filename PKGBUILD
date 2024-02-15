# Maintainer: tarball <bootctl@gmail.com>

pkgname=narrowlink-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='Securely connect devices and services, even in restricted networks'
url='https://narrowlink.com'
arch=(i686 x86_64 aarch64)
license=(MPL-2.0 AGPL-3.0-only)
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
sha256sums=('b60d1792b67d877064fd8164177f2d5dca7e220e42e0679f53216a4ec8a6f46d')
sha256sums_i686=('475dce9f1dfeb787f6470e07f4f67f5957d998c9a39421f02d78ce4e8acec09b'
                 '600f11af03936f38b187903b19293c7de8f6f16bca722023a1430aa0fbf0e974'
                 '9025244e55e8d4c433224354fe20f8fe04fb971d0f70df1ff019898392aa0ed6'
                 '25a821b5b604ca160380eff0e3b1aed49a40403cbbf81dfdfcc11678b92eb0f5')
sha256sums_x86_64=('e824a1d0f7b6cde74deffb9133761244563465591a5c65543cdad480515d863e'
                   '53c9f1b32b37bbd247cc75f05061ff4d0d901da7eb2c9479d12f6ae7c6de9df3'
                   '8db3daba02113a83b839babf6af9be0e7e96853a56e7c5ea47071c5e229376f1'
                   '91d27b3d531a98cb25b0e1748fd0e6bbe6ccda40f6347ce6813e310e69bb9a99')
sha256sums_aarch64=('aa7fd4acba1db088565766ef9e1f66a1456aa3f735db3a15d4eca7cbbfa16f8b'
                    'd4d17aa428d849f1412676643e78df7e23b61658718e68772c2bf30bd6a68d2e'
                    '1fe4314baab3c95951f0fe18db52e9f47f2bff6bfe106d7947864a0184f280b1'
                    '10576af6fff0c55c9d4b3c36f90b51fe12a8cb961fd9f950b69dda6f306a9d2c')

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
