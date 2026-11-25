# Maintainer: agony <27015 at riseup dot net>

pkgname=database-lab-git
pkgver=r1961.6ee274b
pkgrel=1
pkgdesc='Database branching and thin cloning for any Postgres database, client tools (git version)'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/postgres-ai/database-lab'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=('database-lab')
conflicts=('database-lab' 'dblab')
source=("database-lab::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd database-lab
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd database-lab/engine
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd database-lab/engine
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  local _version _time
  _version="$(git describe --tags --match 'v*')"
  _time="$(date -u -d "@${SOURCE_DATE_EPOCH}" '+%Y%m%d-%H%M')"
  go build -v -ldflags="-linkmode=external -X gitlab.com/postgres-ai/database-lab/v3/version.version=${_version} -X gitlab.com/postgres-ai/database-lab/v3/version.buildTime=${_time}" -o bin/dblab ./cmd/cli
  go build -v -ldflags="-linkmode=external -X main.version=${_version} -X main.buildTime=${_time}" -o bin/rds-refresh ./cmd/rds-refresh
}

check() {
  cd database-lab/engine
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./...
}

package() {
  cd database-lab/engine
  install -Dm755 bin/dblab bin/rds-refresh -t "${pkgdir}/usr/bin"
  install -Dm644 scripts/bash_autocomplete "${pkgdir}/usr/share/bash-completion/completions/dblab"
  sed -i '1{/^#!/d}' "${pkgdir}/usr/share/bash-completion/completions/dblab"
  install -Dm644 configs/config.example.rds_refresh.yaml -t "${pkgdir}/usr/share/doc/${pkgname}"
}
