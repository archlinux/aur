# Maintainer: JasonLandbridge

pkgname=omniroute-bin
pkgver=3.7.0 # renovate: datasource=github-tags depName=diegosouzapw/OmniRoute
pkgrel=2
pkgdesc="OpenAI-compatible AI gateway with routing, retries, caching, and observability"
arch=('x86_64')
url="https://github.com/diegosouzapw/OmniRoute"
license=('MIT')
depends=('nodejs-lts-krypton')
makedepends=('npm' 'python')
optdepends=('systemd: user service management via systemctl --user')
install="${pkgname}.install"
options=('!strip')
source=(
  "${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/omniroute/-/omniroute-${pkgver}.tgz"
  'omniroute.sh'
  'omniroute.service'
  '.env.example'
)
sha512sums=(
  '9132ede38804d14262161488662ccb022f2e740aa566cbb0fa088a1ca530f4e052499d44d6229c7f27e9cbb9300a2f37470f787ae92b2ac5ec9e9388b7fe8aa3'
  'SKIP'
  'SKIP'
  'SKIP'
)

_omniroute_pkgroot() {
  local _candidate
  local -a _candidates=()

  for _candidate in "${srcdir}"/*; do
    [[ -d "${_candidate}" ]] || continue
    [[ "${_candidate}" == "${srcdir}/npm-home" ]] && continue
    [[ "${_candidate}" == "${srcdir}/npm-cache" ]] && continue
    [[ -f "${_candidate}/package.json" ]] || continue
    _candidates+=("${_candidate}")
  done

  if (( ${#_candidates[@]} != 1 )); then
    printf 'Expected one extracted omniroute package root, found %d:\n' "${#_candidates[@]}" >&2
    printf '  %s\n' "${_candidates[@]}" >&2
    return 1
  fi

  printf '%s\n' "${_candidates[0]}"
}

build() {
  local _pkgroot
  local _app_binary

  _pkgroot="$(_omniroute_pkgroot)"
  _app_binary="${_pkgroot}/app/node_modules/better-sqlite3/build/Release/better_sqlite3.node"

  cd "${_pkgroot}"

  export HOME="${srcdir}/npm-home"
  export npm_config_cache="${srcdir}/npm-cache"
  export npm_config_build_from_source=true
  export npm_config_audit=false
  export npm_config_fund=false
  export npm_config_update_notifier=false

  mkdir -p "${HOME}" "${npm_config_cache}"

  npm install --omit=dev --ignore-scripts --no-audit --no-fund
  npm rebuild better-sqlite3 --build-from-source
  if [[ -f scripts/postinstall.mjs ]]; then
    node scripts/postinstall.mjs
  fi

  [[ -f "${_app_binary}" ]] || {
    printf 'Missing repaired better-sqlite3 binary at %s\n' "${_app_binary}" >&2
    return 1
  }

  rm -rf "${_pkgroot}/node_modules"
}

package() {
  local _pkgroot
  _pkgroot="$(_omniroute_pkgroot)"

  install -dm755 "${pkgdir}/usr/lib/omniroute"
  cp -a "${_pkgroot}/." "${pkgdir}/usr/lib/omniroute/"
  ln -s app/node_modules "${pkgdir}/usr/lib/omniroute/node_modules"

  install -Dm755 "${srcdir}/omniroute.sh" "${pkgdir}/usr/bin/omniroute"
  install -Dm644 "${srcdir}/omniroute.service" "${pkgdir}/usr/lib/systemd/user/omniroute.service"
  install -Dm644 "${srcdir}/.env.example" "${pkgdir}/usr/share/doc/${pkgname}/.env.example"
  install -Dm644 "${_pkgroot}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_pkgroot}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
