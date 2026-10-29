# Maintainer: weselben <bengottwaldi04 at gmail dot com>
# Contributor: weselben <bengottwaldi04 at gmail dot com>

pkgname=gomodel-git
pkgver=0.1.109.r11.gc8cf3a6
pkgrel=2
pkgdesc="High-performance AI gateway (git main build, quasi-nightly)"
arch=('x86_64' 'aarch64')
url="https://github.com/ENTERPILOT/GoModel"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git' 'nodejs' 'npm')
provides=('gomodel')
conflicts=('gomodel')
optdepends=('bun: faster UI dependency install + build (auto-used when installed, GOMODEL_UI_PM=npm forces npm)'
            'go: build and load plugin shared objects (gomodel plugin build)'
            'redis: distributed rate limiting and response cache backend'
            'postgresql: cost/history storage backend')
install=gomodel.install
source=("${pkgname}::git+${url}.git#branch=main"
        "plugin-message-format-4.4.0.tgz::https://registry.npmjs.org/@inlang/plugin-message-format/-/plugin-message-format-4.4.0.tgz"
        "plugin-m-function-matcher-2.2.6.tgz::https://registry.npmjs.org/@inlang/plugin-m-function-matcher/-/plugin-m-function-matcher-2.2.6.tgz"
        "gomodel-user.service")
sha256sums=('SKIP'
            'c3027edad173f88ab94a7e4aca2e935aedad5820470230a3e0896977ade281be'
            '834622fe28c0195b1ae78008bb75688f3be3bb2612b5efce73f01ceb9ac782a8'
            'fe63ac54caa66676e59bfa5044ebe1372e3cc5546ac68fac9bde4ddb19f82973')
options=('!lto')

pkgver() {
  cd "${pkgname}"
  git describe --tags --long 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.g%s" \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # The inlang/paraglide plugin references moved into node_modules upstream
  # (declared in package.json). The sed below is now a no-op-safe rewrite
  # that also covers older CDN-URL forms on tag-based rebuilds.
  mkdir -p "${srcdir}/inlang-plugins/plugin-message-format"
  mkdir -p "${srcdir}/inlang-plugins/plugin-m-function-matcher"
  tar -xzf "${srcdir}/plugin-message-format-4.4.0.tgz" \
      -C "${srcdir}/inlang-plugins/plugin-message-format" --strip-components=1
  tar -xzf "${srcdir}/plugin-m-function-matcher-2.2.6.tgz" \
      -C "${srcdir}/inlang-plugins/plugin-m-function-matcher" --strip-components=1

  cd "${pkgname}"
  sed -i \
    "s|\"./node_modules/@inlang/plugin-message-format/dist/index.js\"|\"${srcdir}/inlang-plugins/plugin-message-format/dist/index.js\"|" \
    web/dashboard/project.inlang/settings.json
  sed -i \
    "s|\"./node_modules/@inlang/plugin-m-function-matcher/dist/index.js\"|\"${srcdir}/inlang-plugins/plugin-m-function-matcher/dist/index.js\"|" \
    web/dashboard/project.inlang/settings.json
}

build() {
  cd "${pkgname}"

  export CGO_ENABLED=1
  export GOFLAGS='-mod=readonly'
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"

  # UI build parallel to Go build; see gomodel/PKGBUILD for the rationale.
  ( cd web/dashboard
    case "${GOMODEL_UI_PM:-auto}" in
      npm) npm ci --no-audit --no-fund && npm run build ;;
      bun) bun install --frozen-lockfile && bun run build ;;
      auto)
        if command -v bun >/dev/null 2>&1; then
          bun install --frozen-lockfile && bun run build
        else
          npm ci --no-audit --no-fund && npm run build
        fi
        ;;
      *) echo "GOMODEL_UI_PM must be npm, bun or auto" >&2; exit 2 ;;
    esac
  ) &
  local ui_pid=$!

  local _commit _date
  _commit="$(git rev-parse HEAD)"
  _date="$(git log -1 --format=%cI)"

  go build -trimpath \
    -buildmode=pie \
    -ldflags "-s -w \
      -X github.com/enterpilot/gomodel/internal/version.Version=${pkgver} \
      -X github.com/enterpilot/gomodel/internal/version.Commit=${_commit} \
      -X github.com/enterpilot/gomodel/internal/version.Date=${_date}" \
    -o gomodel ./cmd/gomodel &
  local go_pid=$!

  local rc=0
  wait "$ui_pid" || rc=1
  wait "$go_pid" || rc=1
  return "$rc"
}

check() {
  # Skipped: integration tests need Redis, Postgres and live providers.
  true
}

package() {
  cd "${pkgname}"

  install -Dm755 gomodel "${pkgdir}/usr/bin/gomodel"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Per-user service only for the -git package: nightly builds belong to
  # developer/user setups, not servers. The release package ships both units.
  install -Dm644 "${srcdir}/gomodel-user.service" \
    "${pkgdir}/usr/lib/systemd/user/gomodel.service"
}
