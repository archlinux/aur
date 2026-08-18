# Maintainer: Kcocoa <kamforzn2@proton.me>

pkgname=cpa-usage-keeper-systemd-bin
pkgver=1.14.5
pkgrel=1
pkgdesc="CPA usage persistence and analytics dashboard (prebuilt binary with systemd service)"
arch=('x86_64' 'aarch64')
url="https://github.com/Willxup/cpa-usage-keeper"
license=('MIT')
depends=('glibc' 'ca-certificates')
# ca-certificates is needed by Go's x509 system trust store for HTTPS CPA endpoints.
# The upstream release is intentionally used here; this package cannot relink its ELF.
conflicts=('cpa-usage-keeper')
provides=('cpa-usage-keeper')
backup=('etc/cpa-usage-keeper/cpa-usage-keeper.env')
install='cpa-usage-keeper.install'
source=(
  'cpa-usage-keeper.service'
  'cpa-usage-keeper.sysusers'
  'cpa-usage-keeper.tmpfiles'
)
source_x86_64=(
  "$pkgname-$pkgver-amd64.tar.gz::$url/releases/download/v${pkgver}/cpa-usage-keeper_v${pkgver}_linux_amd64.tar.gz"
)
source_aarch64=(
  "$pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v${pkgver}/cpa-usage-keeper_v${pkgver}_linux_arm64.tar.gz"
)
sha256sums=('bb8358668d819291ca111df9ba81dbbbcc7ee47f2bae22fce8da616aca2a2ad7'
            '881ae236ce3f3e5c1bf8aa806a288ac67accf1a0bb848fd4baa3d16df84d81a0'
            '69319d4ab7251749afddd8cdb697020a438b18e93edc6bfaac7db4ebe10608cd')
sha256sums_x86_64=('a4ba95d46afe2ea8cfe63f4657a57527c0a6c4e8408b099b2e0dfc6613b81338')
sha256sums_aarch64=('ab34bbcff7243724c547e01f912eedcb25e188b1ff529bf919842a5b6cfd44e1')

package() {
  local _pkgdir
  _pkgdir="$(find "$srcdir" -maxdepth 1 -mindepth 1 -type d \
    -name "cpa-usage-keeper_v${pkgver}_linux_*" -print -quit)"

  install -Dm755 "$_pkgdir/cpa-usage-keeper" \
    "$pkgdir/usr/bin/cpa-usage-keeper"

  # This file will contain management and login credentials after setup.
  install -Dm640 "$_pkgdir/.env.example" \
    "$pkgdir/etc/cpa-usage-keeper/cpa-usage-keeper.env"
  sed -i \
    's|^WORK_DIR=./data$|WORK_DIR=/var/lib/cpa-usage-keeper|' \
    "$pkgdir/etc/cpa-usage-keeper/cpa-usage-keeper.env"

  install -Dm644 "$srcdir/cpa-usage-keeper.service" \
    "$pkgdir/usr/lib/systemd/system/cpa-usage-keeper.service"
  install -Dm644 "$srcdir/cpa-usage-keeper.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/cpa-usage-keeper.conf"
  install -Dm644 "$srcdir/cpa-usage-keeper.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/cpa-usage-keeper.conf"
  install -Dm644 "$_pkgdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
