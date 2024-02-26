# Maintainer: Mathew Kamkar <me at matkam dot net>

# Builds found here: https://mau.dev/mautrix/signal/-/pipelines?ref=main
# More info: https://docs.mau.fi/bridges/go/setup.html?bridge=signal
# pkgver format: r<build pipeline number>.<short commit hash>

pkgname=mautrix-signal-bin
provides=('mautrix-signal')
pkgver="0.5.0"
pkgrel=1
pkgdesc="A Matrix-Signal puppeting bridge (Golang version)"
arch=('x86_64' 'aarch64')
license=('AGPL')
makedepends=('unzip')
url="https://github.com/mautrix/signal"
_ci_job_url="https://mau.dev/mautrix/signal/-/jobs"
source_x86_64=("$pkgname-x86_64-$pkgver.zip"::"${_ci_job_url}/44140/artifacts/download")
source_aarch64=("$pkgname-aarch64-$pkgver.zip"::"${_ci_job_url}/44141/artifacts/download")
source=(
          "sysusers-${pkgname/-bin}.conf"
          "${pkgname/-bin}.tmpfiles"
          "${pkgname/-bin}.service"
        )
backup=("etc/${pkgname/-bin}/config.yaml")
sha256sums=('3384dd44aa72937047f03f4a524efdf92162029ab85e830f5c7d4747b40359d8'
            'f086d8c1c187e22faced78fb885607c4fb11e99960958e54b884983158d8ec0e'
            'a6c23d8bb6ca5bd36853a954ee30fa75302ce2a9c3e03897169869743dad2cc6')
sha256sums_x86_64=('79567d473a10f7ffb1801ef4e8853989931cc6272a18edba376128f3dcfd66e5')
sha256sums_aarch64=('e603c4e15507dd00527bb80b3771e6598a9bd39c995ceb6694af4e8bfb02d53f')

prepare() {
  unzip "$srcdir/$pkgname-$CARCH-$pkgver.zip"
}

package() {
  install -Dm755 "$srcdir/${pkgname/-bin}" "$pkgdir/usr/bin/${pkgname/-bin}"

  install -Dm644 "$srcdir/sysusers-${pkgname/-bin}.conf" "$pkgdir/usr/lib/sysusers.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-bin}.service" "$pkgdir/usr/lib/systemd/system/${pkgname/-bin}.service"

  install -Dm640 "$srcdir/example-config.yaml" "$pkgdir/etc/${pkgname/-bin}/config.yaml"
}

