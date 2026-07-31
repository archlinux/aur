# Maintainer: LIghtJUNction

pkgname=lmm-api-git
pkgver=0.0.0.r2.g98a18e4
pkgrel=1
pkgdesc='LMM API model management and distribution system (git version)'
arch=('x86_64')
url='https://github.com/LIghtJUNction/api.lmm.best'
license=('AGPL-3.0-only')
depends=('ca-certificates' 'tzdata')
makedepends=('git' 'go>=1.25.1' 'bun')
provides=("lmm-api=${pkgver}" "new-api=${pkgver}")
conflicts=('lmm-api' 'new-api' 'new-api-git')
replaces=('new-api-git')
backup=('etc/lmm-api/lmm-api.env')
source=(
  'lmm-api::git+https://github.com/LIghtJUNction/api.lmm.best.git#branch=main'
  'lmm-api.service'
  'lmm-api.env'
)
sha256sums=(
  'SKIP'
  '67462494928ff479b9db41f222cbc1936044a234f55d206847bde2bdb6abab22'
  'f204c6576c27812573b155b3f8649537de1f49b576cbb56523d0e3a02c0c9b98'
)

pkgver() {
  cd "${srcdir}/lmm-api"

  local version
  version=$(tr -d '[:space:]' < VERSION)
  version=${version#v}
  [[ -n ${version} ]] || version='0.0.0'
  version=${version//-/.}

  printf '%s.r%s.g%s' \
    "${version}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/lmm-api/web"
  bun install --frozen-lockfile

  cd "${srcdir}/lmm-api"
  go mod download
}

build() {
  cd "${srcdir}/lmm-api/web"
  DISABLE_ESLINT_PLUGIN=true \
    VITE_REACT_APP_VERSION="${pkgver}" \
    bun run build

  cd "${srcdir}/lmm-api"
  CGO_ENABLED=0 \
    GOEXPERIMENT=greenteagc \
    GOFLAGS='-buildmode=pie -trimpath' \
    go build \
      -mod=readonly \
      -ldflags "-s -w -X github.com/QuantumNous/new-api/common.Version=${pkgver}" \
      -o lmm-api \
      .
}

package() {
  cd "${srcdir}/lmm-api"

  install -Dm755 lmm-api "${pkgdir}/usr/bin/lmm-api"
  install -Dm644 "${srcdir}/lmm-api.service" \
    "${pkgdir}/usr/lib/systemd/system/lmm-api.service"
  install -Dm600 "${srcdir}/lmm-api.env" \
    "${pkgdir}/etc/lmm-api/lmm-api.env"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/lmm-api/LICENSE"
  install -Dm644 NOTICE \
    "${pkgdir}/usr/share/licenses/lmm-api/NOTICE"
  install -Dm644 THIRD-PARTY-LICENSES.md \
    "${pkgdir}/usr/share/licenses/lmm-api/THIRD-PARTY-LICENSES.md"
}
