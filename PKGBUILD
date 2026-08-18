# Maintainer: Mark Collins <tera_1225 hat hotmail δot com>

pkgname=mautrix-meta
_name=meta
pkgver=0.2608.0
pkgrel=1
pkgdesc="A Matrix-meta (Facebook, Instagram) puppeting bridge"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
makedepends=(
  go
)
depends=(
  glibc
  libolm
)
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/meta"
source=(
  "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
  sysusers-${pkgname}.conf
  ${pkgname}.tmpfiles
  ${pkgname}.service
  log-path.diff
)
backup=("etc/${pkgname}/${pkgname}.yaml")
sha256sums=('2f22393a81f4e7af2abca79c1a89da28f6b0308b976f1c093d4c02d1fa324e53'
            '6888d152b7b6b0175160a452009b866eba53244ff844da9f6abeb02654e28be5'
            '7dfa012f34ec7f940b1c4111de701b97273b1c2f4075b2f5e67a4c2327f8fb2f'
            '9460950662be4d89a8f2f457922f0eaffbf43e9d30842b8aa3b3524dae48efae'
            '9a9f1a58360b3bab0f217ba4c9dccfbadd7c3441af4bd0af3b57e6e223062a94')
options=(!debug !strip)

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  go mod tidy
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export MAUTRIX_VERSION=$(cat go.mod | grep 'maunium.net/go/mautrix ' | awk '{ print $2 }')
  export GO_LDFLAGS="-s -w -X main.Tag="v${_pkgver}" -X 'maunium.net/go/mautrix.GoModVersion=$MAUTRIX_VERSION'"
  go build -ldflags "$GO_LDFLAGS" -o "$pkgname" ./cmd/"$pkgname"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 "${srcdir}/sysusers-${pkgname}.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -dm755 "${pkgdir}/etc/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  echo "Generating config and applying fix for log path"
  ./mautrix-meta -e -c "${pkgdir}/etc/${pkgname}/${pkgname}.yaml"
  cd "${pkgdir}/etc/${pkgname}/"
  patch -Np1 < "$srcdir/log-path.diff"
  rm "${pkgdir}/etc/${pkgname}/${pkgname}.yaml.orig"
  chmod 644 "${pkgname}.yaml"
}
