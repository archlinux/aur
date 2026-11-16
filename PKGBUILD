# Maintainer: agony <27015 at riseup dot net>

pkgname=database-lab
pkgver=4.2.2
pkgrel=1
pkgdesc='Database branching and thin cloning for any Postgres database, client tools'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/postgres-ai/database-lab'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
conflicts=('dblab')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('33a0cbbbdc02006606b6fe3e81da4d9bda3a3223b44d6798c1a0da07b2fd65b7')

prepare() {
  cd "${pkgname}-v${pkgver}/engine"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-v${pkgver}/engine"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  local _time
  _time="$(date -u -d "@${SOURCE_DATE_EPOCH}" '+%Y%m%d-%H%M')"
  go build -v -ldflags="-linkmode=external -X gitlab.com/postgres-ai/database-lab/v3/version.version=v${pkgver} -X gitlab.com/postgres-ai/database-lab/v3/version.buildTime=${_time}" -o bin/dblab ./cmd/cli
  go build -v -ldflags="-linkmode=external -X main.version=v${pkgver} -X main.buildTime=${_time}" -o bin/rds-refresh ./cmd/rds-refresh
}

check() {
  cd "${pkgname}-v${pkgver}/engine"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./...
}

package() {
  cd "${pkgname}-v${pkgver}/engine"
  install -Dm755 bin/dblab bin/rds-refresh -t "${pkgdir}/usr/bin"
  install -Dm644 scripts/bash_autocomplete "${pkgdir}/usr/share/bash-completion/completions/dblab"
  sed -i '1{/^#!/d}' "${pkgdir}/usr/share/bash-completion/completions/dblab"
  install -Dm644 configs/config.example.rds_refresh.yaml -t "${pkgdir}/usr/share/doc/${pkgname}"
}
