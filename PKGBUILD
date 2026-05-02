# Maintainer: JasonLandbridge

pkgname=omniroute-bin
pkgver=3.7.8 # renovate: datasource=github-tags depName=diegosouzapw/OmniRoute
pkgrel=1
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
sha512sums=('10f33c4a1cbea2e0855aa5f58c40d7d4d1bc0a3231fa0830d7a21bf33663088c1a5dc1be70f124ccb8162c8532121ead71386342965cb997ac17c01b097ff4c5'
            '1ea7cea23b87ea3eeb4a204ce54d9a32f666a365570b40d5b7c5a1bb2b85820f40d49b29d91bc1774351b4c82a83cdaa26a693e2f3a23752da3b53bea758e8fe'
            'f0097170061b862d53f82efa17534e10ad2d8e5666b25ad1011f0908a688099f374c8fb752fe313d12b7523886b4b5b11247c04b2850f08edbb88f1cf7a71502'
            '50256ea8d6eaed68e90c877776df8203954af174d9dabe451b1e23543f7704bf90be785dcf62b34f9cf6afc4e2702fee68109d60686e3343575b78605034f685')

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
  local _app_wreq_js_dir

  _pkgroot="$(_omniroute_pkgroot)"
  _app_binary="${_pkgroot}/app/node_modules/better-sqlite3/build/Release/better_sqlite3.node"
  _app_wreq_js_dir="${_pkgroot}/app/node_modules/wreq-js"

  cd "${_pkgroot}"

  export HOME="${srcdir}/npm-home"
  export npm_config_cache="${srcdir}/npm-cache"
  export npm_config_build_from_source=true
  export npm_config_audit=false
  export npm_config_fund=false
  export npm_config_update_notifier=false

  mkdir -p "${HOME}" "${npm_config_cache}"

  npm install --omit=dev --ignore-scripts --no-audit --no-fund
  rm -rf "${_app_wreq_js_dir}"
  npm install --prefix app --omit=dev --ignore-scripts --no-audit --no-fund wreq-js
  npm rebuild better-sqlite3 --build-from-source
  if [[ -f scripts/postinstall.mjs ]]; then
    node scripts/postinstall.mjs
  fi

  [[ -f "${_app_binary}" ]] || {
    printf 'Missing repaired better-sqlite3 binary at %s\n' "${_app_binary}" >&2
    return 1
  }

  [[ -f "${_app_wreq_js_dir}/dist/wreq-js.js" ]] || {
    printf 'Missing required wreq-js ESM entrypoint at %s\n' "${_app_wreq_js_dir}/dist/wreq-js.js" >&2
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
