# Maintainer: a2sc <a_dev at a2sc dot eu>
# Contributer: Mathew Kamkar <me at matkam dot net>

# Builds found here: https://mau.dev/mautrix/signal/-/pipelines?ref=main
# More info: https://docs.mau.fi/bridges/go/setup.html?bridge=signal
# pkgver format: r<build pipeline number>.<short commit hash>

pkgname=mautrix-signal-nightly-bin
provides=('mautrix-signal')
conflicts=('mautrix-signal' 'mautrix-signal-bin')
pkgver=0.2610.0.r24660.d451962b
_job_x86_64='124704'
_job_aarch64='124705'
pkgrel=1
pkgdesc="A Matrix-Signal puppeting bridge (Golang version)"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
depends=()
makedepends=('unzip')
options=(!debug)
url="https://mau.dev/mautrix/signal/-/jobs"
source_x86_64=("${pkgname}-x86_64.zip"::"${url}/${_job_x86_64}/artifacts/download")
source_aarch64=("${pkgname}-aarch64.zip"::"${url}/${_job_aarch64}/artifacts/download")
source=(
          "sysusers-${pkgname/-nightly-bin}.conf"
          "${pkgname/-nightly-bin}.tmpfiles"
          "${pkgname/-nightly-bin}.service"
        )
backup=("etc/${pkgname/-nightly-bin}/config.yaml")
sha256sums=('3384dd44aa72937047f03f4a524efdf92162029ab85e830f5c7d4747b40359d8'
            '2515ba90e73c054289c3877a86b01ae57117aaa8096348e69d4d0cbe01304a9d'
            '2582791c2210b568afcb916112299a929424c18b381ae8b6b57a2144d0f18b63')
sha256sums_x86_64=('526137857b81fa33318bec12331511bd4be9a106142da1f3fc310da77109632b')
sha256sums_aarch64=('896320b7b16092097f200d9c166060666beceb32300455ce7387f53acbd26281')

prepare() {
  cd "${srcdir}/"
  local _binary="${pkgname/-nightly-bin}"
  rm -f ./config.yaml
  ./"${_binary}" --generate-example-config
}

package() {
  local _binary="${pkgname/-nightly-bin}"
  install -Dm755 "$srcdir/${_binary}" "$pkgdir/usr/bin/${pkgname/-nightly-bin}"

  install -Dm644 "$srcdir/sysusers-${pkgname/-nightly-bin}.conf" "$pkgdir/usr/lib/sysusers.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-nightly-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-nightly-bin}.service" "$pkgdir/usr/lib/systemd/system/${pkgname/-bin}.service"

  cd "${srcdir}/"
  install -dm 770 "${pkgdir}/etc/$pkgname"
  install -Dvm 640 "config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
  touch 'registration.yaml'
  install -Dvm 640 'registration.yaml' "${pkgdir}/etc/${pkgname}/registration.yaml"
}
