# Maintainer: Mathew Kamkar <me at matkam dot net>

# Builds found here: https://mau.dev/mautrix/signal/-/pipelines?ref=main
# More info: https://docs.mau.fi/bridges/go/setup.html?bridge=signal
# pkgver format: r<build pipeline number>.<short commit hash>

pkgname=mautrix-signal-bin
provides=('mautrix-signal')
pkgver="0.2609.0"
_libsigver="0.102.2"
pkgrel=1
pkgdesc="A Matrix-Signal puppeting bridge (Golang version)"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'libolm'
  "libsignal-ffi=$_libsigver" # AUR
)
url="https://github.com/mautrix/signal"
_ci_job_url="https://mau.dev/mautrix/signal/-/jobs"
source_x86_64=("$pkgname"::"${url}/releases/download/v${pkgver}/mautrix-signal-amd64")
source_aarch64=("$pkgname"::"${url}/releases/download/v${pkgver}/mautrix-signal-arm64")
source=(
          "sysusers-${pkgname/-bin}.conf"
          "${pkgname/-bin}.tmpfiles"
          "${pkgname/-bin}.service"
        )
backup=("etc/${pkgname/-bin}/config.yaml")
sha256sums=('3384dd44aa72937047f03f4a524efdf92162029ab85e830f5c7d4747b40359d8'
            '2515ba90e73c054289c3877a86b01ae57117aaa8096348e69d4d0cbe01304a9d'
            '2582791c2210b568afcb916112299a929424c18b381ae8b6b57a2144d0f18b63')
sha256sums_x86_64=('e4481d0abb0e8cd98eba54d3d42e119cd2bd03faac3885c544286e602b5f7b06')
sha256sums_aarch64=('e4481d0abb0e8cd98eba54d3d42e119cd2bd03faac3885c544286e602b5f7b06')

prepare() {
  cd "${srcdir}/"
  chmod u+x ./mautrix-signal-bin
  ./mautrix-signal-bin --generate-example-config
}

package() {
  install -Dm755 "$srcdir/${pkgname}" "$pkgdir/usr/bin/${pkgname/-bin}"

  install -Dm644 "$srcdir/sysusers-${pkgname/-bin}.conf" "$pkgdir/usr/lib/sysusers.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-bin}.service" "$pkgdir/usr/lib/systemd/system/${pkgname/-bin}.service"

  cd "${srcdir}/"
  install -dm 770 "${pkgdir}/etc/$pkgname"
  install -Dvm 640 "config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
  touch 'registration.yaml'
  install -Dvm 640 'registration.yaml' "${pkgdir}/etc/${pkgname}/registration.yaml"
}


