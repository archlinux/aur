# Maintainer: LIghtJUNction

pkgname=lmm-api-go
pkgver=0.1.1.r376.g3cdab7e7f
pkgrel=1
pkgdesc='LMM API Go backend, native CLI, systemd service, and web frontend'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/api.lmm.best'
license=('AGPL-3.0-only')
depends=('ca-certificates' 'systemd' 'tzdata')
makedepends=('bun' 'git' 'go>=1.25.1')
optdepends=(
  'postgresql: production database'
  'valkey: cache, rate limiting, and login sessions'
)
conflicts=('lmm-api' 'lmm-api-bin' 'lmm-api-git' 'lmm-api-go-bin' 'lmm-api-go-git')
backup=('etc/lmm-api-go/lmm-api-go.env')
options=('!strip')

_commit=3cdab7e7f7c5c5788fa1f9b904671da5ce379c1a
source=("lmm-api-go::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd lmm-api-go || return
  bun install --frozen-lockfile
  VITE_REACT_APP_VERSION="${pkgver}" bun run --filter @lmm/web build
  (
    cd apps/api-go || return
    CGO_ENABLED=0 go build -trimpath \
      -ldflags="-s -w -X github.com/QuantumNous/new-api/common.Version=${pkgver}" \
      -o "${srcdir}/lmm-api-go-bin" .
  )
}

package() {
  local root="${srcdir}/lmm-api-go"
  local shared="${root}/packaging/common/lmm-api"
  local file

  install -Dm0755 "${srcdir}/lmm-api-go-bin" "${pkgdir}/usr/bin/lmm-api-go"
  ln -s lmm-api-go "${pkgdir}/usr/bin/lmm-api"
  install -Dm0644 "${shared}/lmm-api.service" \
    "${pkgdir}/usr/lib/systemd/system/lmm-api.service"
  install -Dm0600 "${shared}/lmm-api-go.env" \
    "${pkgdir}/etc/lmm-api-go/lmm-api-go.env"

  install -d -m0755 "${pkgdir}/usr/share/lmm-api-go/frontend-dist"
  cp -R --no-preserve=ownership,mode,timestamps -- "${root}/apps/web/dist/." \
    "${pkgdir}/usr/share/lmm-api-go/frontend-dist/"
  find "${pkgdir}/usr/share/lmm-api-go/frontend-dist" -type d -exec chmod 0755 {} +
  find "${pkgdir}/usr/share/lmm-api-go/frontend-dist" -type f -exec chmod 0644 {} +

  for file in LICENSE NOTICE THIRD-PARTY-LICENSES.md; do
    install -Dm0644 "${root}/${file}" "${pkgdir}/usr/share/licenses/${pkgname}/${file}"
  done
  printf '%s\n' "${_commit}" >"${srcdir}/REVISION"
  install -Dm0644 "${srcdir}/REVISION" "${pkgdir}/usr/share/doc/${pkgname}/REVISION"
}
