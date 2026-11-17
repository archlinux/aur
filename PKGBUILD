# Maintainer: Mathew Kamkar <me at matkam dot net>
# Maintainer: a2sc <a_dev at a2sc dot eu>

# Builds found here: https://mau.dev/mautrix/signal/-/pipelines?ref=main
# More info: https://docs.mau.fi/bridges/go/setup.html?bridge=signal
# pkgver format: r<build pipeline number>.<short commit hash>

pkgname=mautrix-signal-bin
provides=('mautrix-signal')
conflicts=('mautrix-signal' 'mautrix-signal-bin-nightly')
pkgver="0.2611.0"
pkgrel=2
pkgdesc="A Matrix-Signal puppeting bridge (Golang version)"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
depends=()
options=(!debug)
url="https://github.com/mautrix/signal"
_ci_job_url="https://mau.dev/mautrix/signal/-/jobs"
source_x86_64=("${pkgname}-x86_64"::"${url}/releases/download/v${pkgver}/mautrix-signal-amd64")
source_aarch64=("${pkgname}-aarch64"::"${url}/releases/download/v${pkgver}/mautrix-signal-arm64")
source=(
          "sysusers-${pkgname/-bin}.conf"
          "${pkgname/-bin}.tmpfiles"
          "${pkgname/-bin}.service"
        )
backup=("etc/${pkgname/-bin}/config.yaml")
sha256sums=('3384dd44aa72937047f03f4a524efdf92162029ab85e830f5c7d4747b40359d8'
            '2515ba90e73c054289c3877a86b01ae57117aaa8096348e69d4d0cbe01304a9d'
            '2582791c2210b568afcb916112299a929424c18b381ae8b6b57a2144d0f18b63')
sha256sums_x86_64=('ebe29141f18ff1918b68d8993f9d4a56ae2e4c1aef9785d4010a0585e79f0559')
sha256sums_aarch64=('8d7db9dcd4d9ddb0560fe2b1fe14a906394f9e956e62c8ab3c030c457fbfbaf0')

prepare() {
  cd "${srcdir}/"
  local _binary="${pkgname}-${CARCH}"
  chmod u+x "./${_binary}"
  ./"${_binary}" --generate-example-config
}

package() {
  local _binary="${pkgname}-${CARCH}"
  install -Dm755 "$srcdir/${_binary}" "$pkgdir/usr/bin/${pkgname/-bin}"

  install -Dm644 "$srcdir/sysusers-${pkgname/-bin}.conf" "$pkgdir/usr/lib/sysusers.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-bin}.service" "$pkgdir/usr/lib/systemd/system/${pkgname/-bin}.service"

  cd "${srcdir}/"
  install -dm 770 "${pkgdir}/etc/$pkgname"
  install -Dvm 640 "config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
  touch 'registration.yaml'
  install -Dvm 640 'registration.yaml' "${pkgdir}/etc/${pkgname}/registration.yaml"
}


