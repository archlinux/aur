# Maintainer: LIghtJUNction

pkgname=lmm-api-go-git
pkgver=0.1.20.r1291.g1db462ebe
pkgrel=1
pkgdesc='LMM API Go backend, native CLI, systemd service, and web frontend (git)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/api.lmm.best'
license=('AGPL-3.0-only')
depends=('ca-certificates' 'coreutils' 'libarchive' 'pacman' 'paru' 'sudo' 'systemd' 'tzdata' 'util-linux')
makedepends=('bun' 'git' 'go>=1.25.1')
optdepends=(
  'postgresql: production database'
  'valkey: cache, rate limiting, and login sessions'
)
source "${startdir:?}/lmm-api-cli-phase.sh"
_lmm_cli_phase=$LMM_CLI_SOURCE_PHASE
lmm_cli_phase_apply_metadata "$_lmm_cli_phase" "$pkgver" \
  'lmm-api' 'lmm-api-bin' 'lmm-api-git' 'lmm-api-go' 'lmm-api-go-bin'
# pkgver() runs after PKGBUILD evaluation; keep VCS provides unversioned so they
# cannot retain the checked-in bootstrap version after the fetched commit moves.
provides=('lmm-api' 'lmm-api-go')
backup=('etc/lmm-api-go/lmm-api-go.env')
options=('!strip')
source=('lmm-api-go::git+https://github.com/LIghtJUNction/api.lmm.best.git#branch=main' 'lmm-api-cli-phase.sh')
sha256sums=('SKIP' '2b93864b302a7901a4688fd5b7df9b7e262f193a666a915718f434db20054935')

_source_pkgver_epoch=0.1.20

pkgver() {
  cd lmm-api-go || return
  printf '%s.r%s.g%s' "$_source_pkgver_epoch" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

build() {
  cd lmm-api-go || return
  bun install --frozen-lockfile
  VITE_REACT_APP_VERSION="${pkgver}" bun run --filter @lmm/web build
  (
    cd apps/api-go || return
    CGO_ENABLED=0 go build -trimpath \
      -ldflags="-s -w -X github.com/LIghtJUNction/api.lmm.best/common.Version=${pkgver}" \
      -o "${srcdir}/lmm-api-cli" .
  )
}

package() {
  local root="${srcdir}/lmm-api-go"
  local shared="${root}/packaging/common/lmm-api"
  local file

  install -Dm0755 "${srcdir}/lmm-api-cli" "${pkgdir}/usr/bin/lmm-api"
  lmm_cli_phase_install_compatibility_alias "$_lmm_cli_phase" "$pkgdir"
  install -Dm0644 "${shared}/lmm-api.service" \
    "${pkgdir}/usr/lib/systemd/system/lmm-api.service"
  if [[ -f ${shared}/lmm-api-operator.sysusers ]]; then
    [[ -f ${shared}/lmm-api-operator.tmpfiles && -f ${shared}/lmm-api-operator.sudoers ]] || return 1
    install -Dm0644 "${shared}/lmm-api-operator.sysusers" \
      "${pkgdir}/usr/lib/sysusers.d/lmm-api-operator.conf"
    install -Dm0644 "${shared}/lmm-api-operator.tmpfiles" \
      "${pkgdir}/usr/lib/tmpfiles.d/lmm-api-operator.conf"
    install -Dm0440 "${shared}/lmm-api-operator.sudoers" \
      "${pkgdir}/etc/sudoers.d/lmm-api-operator"
  fi
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
  git -C "${root}" rev-parse HEAD > "${srcdir}/REVISION"
  install -Dm0644 "${srcdir}/REVISION" "${pkgdir}/usr/share/doc/${pkgname}/REVISION"
}
