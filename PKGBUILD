# Maintainer: Adam Nielsen <malvineous@shikadi.net>
# Co-maintainer: w568w <w568w at outlook dot com>

pkgname=micron-storage-executive-cli
_execname='msecli'
pkgver=11.08.082025.00
pkgrel=1
pkgdesc="Micron Storage Executive Command Line (msecli) for configuring and managing Micron SSDs"
arch=(x86_64 aarch64)
url="https://www.micron.com/sales-support/downloads/software-drivers/storage-executive-software#cli"
license=('LicenseRef-SLA')
provides=("$_execname")
depends=('glibc')
makedepends_x86_64=(fakeroot bubblewrap)
optdepends=()
source=("SLA")
source_x86_64=(
  "fake-lsb-release"
  "$pkgname-$pkgver-x86_64.run::https://assets.micron.com/adobe/assets/urn:aaid:aem:f60bf728-a665-4760-b099-31631a1f02bc/renditions/original/as/msecli-linux.run"
)
source_aarch64=(
  "$pkgname-$pkgver-aarch64.zip::https://assets.micron.com/adobe/assets/urn:aaid:aem:3faea2e9-b3dd-4e12-9320-02299b15b646/renditions/original/as/msecli-arm.zip"
)
sha256sums=('7b385cd18e9b747cf76ac5999dd01768c2931358f6da2751cdb8745d6dde32c7')
sha256sums_x86_64=('1eb68dee6bf93a094389eda90b9f9c963eeb59351c48636d43ed8d0dc7c410e1'
                   '20e473793afc39cc0b968c79a40c56a6ea8e0676c0f27ccfc72be68b4458318b')
sha256sums_aarch64=('4d5119e68dc695e4d3441cd50952cc9826d6bc6e2f4d35d8e7a2dc929793ad25')

build() {
  if [[ "$CARCH" == "x86_64" ]]; then
    chmod +x "$srcdir/$pkgname-$pkgver-x86_64.run"
    bwrap \
      --ro-bind / / \
      --dev-bind /tmp /tmp \
      --dev-bind "$srcdir" "$srcdir" \
      --bind "$srcdir/fake-lsb-release" /etc/lsb-release \
      --unshare-all \
      -- fakeroot "$srcdir/$pkgname-$pkgver-x86_64.run" --disable-components GUI --mode unattended --installer-language en --prefix "$srcdir/msecli-tmp-x86_64" || echo "Ignoring error during extraction. They are expected!"
  fi
}

package() {
	case "$CARCH" in
    x86_64)
      install -Dm755 "$srcdir/msecli-tmp-x86_64/msecli" "$pkgdir/usr/bin/$_execname"
      ;;
    aarch64)
      install -Dm755 "$srcdir/msecli-arm" "$pkgdir/usr/bin/$_execname"
      ;;
    *)
      echo "Unsupported architecture: $CARCH"
      return 1
      ;;
  esac
  install -Dm644 "$srcdir/SLA" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
