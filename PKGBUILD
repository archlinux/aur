# Maintainer: Mark Collins <tera_1225 hat hotmail δot com>

pkgname=mautrix-instagram
_name=instagram
_base_name=meta
pkgver=0.2608.0
pkgrel=1
pkgdesc="A Matrix-Instagram puppeting bridge"
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
            'd2b32fa5a94b95f2147e0fad47bc4ba0a8d9253cbf5e1db46c3ce8036b27ae5c'
            'fe826cbf14546f131cdda250b2c959ca0854d1769287b86ef0c1ce64f1d46b20'
            'b16101895a888cbaf89b1b73f91f67933996931cfdb2f223234b5f1ddfeb92a1'
            '2c4f89e9aff5a246590b62d6a350fad37b0ec76407773ff4c061eda8c4dfaadf')
options=(!debug !strip)

prepare() {
  cd "${srcdir}/${_base_name}-${pkgver}"
  go mod tidy
}

build() {
  cd "${srcdir}/${_base_name}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export MAUTRIX_VERSION=$(cat go.mod | grep 'maunium.net/go/mautrix ' | awk '{ print $2 }')
  export GO_LDFLAGS="-s -w -X main.Tag="v${_pkgver}" -X 'maunium.net/go/mautrix.GoModVersion=$MAUTRIX_VERSION'"
  go build -ldflags "$GO_LDFLAGS" -o "$pkgname" "./cmd/$pkgname"
}

package() {
  cd "${srcdir}/${_base_name}-${pkgver}"
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 "${srcdir}/sysusers-${pkgname}.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -dm755 "${pkgdir}/etc/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  echo "Generating config and applying fix for log path"
  ./mautrix-instagram -e -c "${pkgdir}/etc/${pkgname}/${pkgname}.yaml"
  cd "${pkgdir}/etc/${pkgname}/"
  patch -Np1 < "$srcdir/log-path.diff"
  chmod 644 "${pkgname}.yaml"
}
