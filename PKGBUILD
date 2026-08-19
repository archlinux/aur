# Maintainer: Adam Nielsen <malvineous@shikadi.net>
# Co-maintainer: w568w <w568w at outlook dot com>

pkgname=micron-storage-executive-cli
_execname='msecli'
pkgver=12.03.032026.00
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
  "$pkgname-$pkgver-x86_64.run::https://www.micron.com/content/dam/micron/global/public/products/storage/ssds/data-center/storage-executive/msecli-linux.run"
)
source_aarch64=(
  "$pkgname-$pkgver-aarch64.zip::https://www.micron.com/content/dam/micron/global/public/products/storage/ssds/data-center/storage-executive/msecli-arm.zip"
)
sha256sums=('7b385cd18e9b747cf76ac5999dd01768c2931358f6da2751cdb8745d6dde32c7')
sha256sums_x86_64=('1eb68dee6bf93a094389eda90b9f9c963eeb59351c48636d43ed8d0dc7c410e1'
                   '10be69f534e1ee7ccfa250e2661389b24d588270e3ef1f15bc38ea681f150aa4')
sha256sums_aarch64=('d2a1c0d7f7e5693b62fe57d7f64ecfc58a52b03e9f3f6a8ca8c0fdf145d6d185')

build() {
  if [[ "$CARCH" == "x86_64" ]]; then
    chmod +x "$srcdir/$pkgname-$pkgver-x86_64.run"
    bwrap \
      --ro-bind / / \
      --dev-bind /tmp /tmp \
      --dev-bind "$srcdir" "$srcdir" \
      --bind "$srcdir/fake-lsb-release" /etc/lsb-release \
      --unshare-all \
      -- fakeroot "$srcdir/$pkgname-$pkgver-x86_64.run" --mode unattended --installer-language en --prefix "$srcdir/msecli-tmp-x86_64" || echo "Ignoring error during extraction. They are expected!"
  fi
}

package() {
	case "$CARCH" in
    x86_64)
      install -Dm755 "$srcdir/msecli-tmp-x86_64/msecli" "$pkgdir/usr/bin/$_execname"
      ;;
    aarch64)
      install -Dm755 "$srcdir/msecli_arm_" "$pkgdir/usr/bin/$_execname"
      ;;
    *)
      echo "Unsupported architecture: $CARCH"
      return 1
      ;;
  esac
  install -Dm644 "$srcdir/SLA" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
