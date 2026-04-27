pkgname='mautrix-telegram'
pkgver=0.2605.0
pkgrel=1
pkgdesc="Matrix-Telegram hybrid puppeting/relaybot bridge"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mautrix/telegram"
license=('AGPL-3.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'libolm'
)
makedepends=(
  'go'
)
backup=(
  "etc/${pkgname}/config.yaml"
  "etc/${pkgname}/registration.yaml"
)
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('7826b531b9698f68ac74c518c13703517a6e05c85f040eeb252f44cef3d38f92'
            'afd12dd5194ca379cfb6db346d098f52d087703fcd6a0f0f89063867dc7cdb0f'
            '83dc721df0451c199d23ea74b60a065d92f98e9026dd779aca30d25195b88cf9'
            '71f12a1d39f9a08903e2046a02c39a9c21ac0bd2ac7ec38710afea90446fa9e9')
options=(!debug)

prepare() {
  cd "telegram-${pkgver}"
  go mod tidy
}

build() {
  cd "telegram-${pkgver}"
  export LIBRARY_PATH="${LIBRARY_PATH}:/usr/lib/"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  MAUTRIX_VERSION=$(cat go.mod | grep 'maunium.net/go/mautrix ' | awk '{ print $2 }')
  GO_LDFLAGS="-X main.Tag=${pkgver} -X 'main.BuildTime=`date '+%b %_d %Y, %H:%M:%S'`' -X 'maunium.net/go/mautrix.GoModVersion=$MAUTRIX_VERSION'"
  go build -gcflags="$GO_GCFLAGS" -ldflags="$GO_LDFLAGS" -o "${pkgname}" ./cmd/...
  ./${pkgname} --generate-example-config
}

package() {
  cd "telegram-${pkgver}"

  install -Dvm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  install -dm 750 "${pkgdir}/etc/${pkgname}"
  install -Dvm 640 "config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
  touch 'registration.yaml'
  install -Dvm 640 'registration.yaml' "${pkgdir}/etc/${pkgname}/registration.yaml"
}
