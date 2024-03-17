# Maintainer: Mark Collins <tera_1225 hat hotmail δot com>

pkgname=mautrix-meta
_name=meta
pkgver=0.2.0
pkgrel=1
pkgdesc="A Matrix-WhatsApp puppeting bridge"
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
sha256sums=('701bb2efffcc3a7beb9227f0e63f215f7c242a252de4201fa9865487bdff47db'
            '6888d152b7b6b0175160a452009b866eba53244ff844da9f6abeb02654e28be5'
            '7dfa012f34ec7f940b1c4111de701b97273b1c2f4075b2f5e67a4c2327f8fb2f'
            '221814dbeab867bcb5217e22cbdd2d4ba0031ac594bea5a79134f137ef302d22'
            '7dc76380ffd9541f4508e834f32c51766505ac9bc285525063b3336c304967ca')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  echo "Applying fix for log path"
  patch -Np1 < "$srcdir/log-path.diff"
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
  go build -ldflags "$GO_LDFLAGS" -o "$pkgname"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 "${srcdir}/sysusers-${pkgname}.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "example-config.yaml" "${pkgdir}/etc/${pkgname}/${pkgname}.yaml"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
