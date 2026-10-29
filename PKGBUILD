# Maintainer: weselben <bengottwaldi04 at gmail dot com>
# Contributor: weselben <bengottwaldi04 at gmail dot com>

pkgname=gomodel
pkgver=0.1.109
pkgrel=2
pkgdesc="High-performance AI gateway with caching, cost tracking, budgets, rate limits, virtual models and plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/ENTERPILOT/GoModel"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('go: build and load plugin shared objects (gomodel plugin build)'
            'redis: distributed rate limiting and response cache backend'
            'postgresql: cost/history storage backend')
backup=('etc/gomodel/config.yaml')
install=gomodel.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ENTERPILOT/GoModel/archive/refs/tags/v${pkgver}.tar.gz"
        "gomodel_${pkgver}_dashboard.tar.gz::https://github.com/ENTERPILOT/GoModel/releases/download/v${pkgver}/gomodel_${pkgver}_dashboard.tar.gz"
        "gomodel.service"
        "gomodel-user.service"
        "gomodel.sysusers"
        "gomodel.tmpfiles")
sha256sums=('9aa2f76cd15abab2b99a31a5acd8f654d348794d2d7e48c689a327f3967f6eaf'
            'e8b21b47a9ebbf5afdc6c997d9ac139641a08effcf6c1ed2b1e3a0abd669c9e9'
            'e6c2719a296d21e39793d572959efb0356c3f98ad47e9a2c98f21f6e6c2c64f6'
            'fe63ac54caa66676e59bfa5044ebe1372e3cc5546ac68fac9bde4ddb19f82973'
            '0381e411b3245933da1fe3c7021de4727c7f596c55464c993333153d57781ad3'
            '093568d86cda64db582c2c4f6ce88875a4ee448941c9d11422a0f1127ab0cf04')
options=('!lto')

prepare() {
  cd "GoModel-${pkgver}"
  # goreleaser's dashboard archive unpacks to
  # internal/admin/dashboard/static/dist — go:embed consumes it. The git
  # archive only ships a .gitkeep placeholder there, so plain extract is
  # correct.
  tar -xzf "${srcdir}/gomodel_${pkgver}_dashboard.tar.gz"
}

build() {
  cd "GoModel-${pkgver}"

  export CGO_ENABLED=1
  export GOFLAGS='-mod=readonly'
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"

  # Source-only build: the dashboard dist ships as its own release asset
  # (gomodel_<ver>_dashboard.tar.gz), so no nodejs/npm/bun toolchain is
  # needed here.
  go build -trimpath \
    -buildmode=pie \
    -ldflags "-s -w \
      -X github.com/enterpilot/gomodel/internal/version.Version=${pkgver} \
      -X github.com/enterpilot/gomodel/internal/version.Commit=v${pkgver} \
      -X github.com/enterpilot/gomodel/internal/version.Date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
    -o gomodel ./cmd/gomodel
}

check() {
  cd "GoModel-${pkgver}"
  # Skipped: integration tests need Redis, Postgres and live provider
  # endpoints. Same decision as upstream's NixOS package.
  true
}

package() {
  cd "GoModel-${pkgver}"

  install -Dm755 gomodel "${pkgdir}/usr/bin/gomodel"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Example config as the seed for /etc/gomodel/config.yaml (backup-protected).
  # gomodel group does not exist while BUILDING (sysusers runs at install);
  # create ownership in the tmpfiles rule instead of here.
  install -Dm640 config/config.example.yaml "${pkgdir}/etc/gomodel/config.yaml"
  install -d -m750 "${pkgdir}/etc/gomodel"

  # System state dir for the DynamicUser service: ownership applied by
  # tmpfiles.d at install/boot (gomodel user is created by sysusers.d then).
  # No plugins/ subdir here: it is created by the install message instructions
  # and its absence avoids an "empty directory" namcap warning.
  install -d -m750 "${pkgdir}/var/lib/gomodel"

  # System service (root installs: systemctl enable --now gomodel).
  install -Dm644 "${srcdir}/gomodel.service" \
    "${pkgdir}/usr/lib/systemd/system/gomodel.service"

  # User service (every user, enable per login: systemctl --user enable --now gomodel).
  install -Dm644 "${srcdir}/gomodel-user.service" \
    "${pkgdir}/usr/lib/systemd/user/gomodel.service"

  install -Dm644 "${srcdir}/gomodel.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/gomodel.conf"
  install -Dm644 "${srcdir}/gomodel.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/gomodel.conf"
}
