# Maintainer: Keithsel <keithsel@disroot.org>
pkgname=9router-bin
pkgver=0.4.29
pkgrel=1
pkgdesc="AI router and proxy providing an OpenAI-compatible endpoint for multiple AI providers"
arch=('x86_64')
url="https://github.com/decolua/9router"
license=('MIT')
depends=('nodejs>=18.0.0')
makedepends=('npm' 'python')
optdepends=('systemd: user service management via systemctl --user')
install="${pkgname}.install"
options=('!strip')
source=(
  "${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/9router/-/9router-${pkgver}.tgz"
  '9router.sh'
  '9router.service'
  '.env.example'
)
sha512sums=('d5d3ab594d5788b2df008733fdd3d7adc93d98c8c57a6cb80078320e88786821e71057d236e3ca649c69c5836f25ac965ab58b20a89b2d1c545401ae15be42a6'
            '6fe5b69a2801c4deb99a66a09700ff4dc649b2584bd04a4f3afe0e3c06678330ad976e4874c13e43e29ac23c422479990d6d705809d29373e3d51047bf52174b'
            'ee90928c03257aa32e6e0a2a7fc1d5ea63bbfa0b3565dc1bf1d41f4ff7e96ec813d51ae0b802ae3de001f1b510560ff7c04f949beecd6312874bb77edc851914'
            '01bd0f7ab44cfdc0d5d4a053a1e8ed3023381d86502da3e5ce934ec884c9c35d94b9fab34053ddd2451e6fa0835f8b47fae09b9cf9f2b5712bb7053b6332bdc0')

_9router_pkgroot() {
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
    printf 'Expected one extracted 9router package root, found %d:\n' "${#_candidates[@]}" >&2
    printf '  %s\n' "${_candidates[@]}" >&2
    return 1
  fi

  printf '%s\n' "${_candidates[0]}"
}

build() {
  local _pkgroot
  local _app_binary

  _pkgroot="$(_9router_pkgroot)"
  _app_binary="${_pkgroot}/app/node_modules/better-sqlite3/build/Release/better_sqlite3.node"

  cd "${_pkgroot}"

  export HOME="${srcdir}/npm-home"
  export npm_config_cache="${srcdir}/npm-cache"
  export npm_config_audit=false
  export npm_config_fund=false
  export npm_config_update_notifier=false

  mkdir -p "${HOME}" "${npm_config_cache}"

  npm install --omit=dev --ignore-scripts --no-audit --no-fund

  rm -rf "${_pkgroot}/node_modules/systray"

  rm -rf "${_pkgroot}/app/node_modules/better-sqlite3"
  npm install --prefix "${_pkgroot}/app" --omit=dev --no-audit --no-fund \
    better-sqlite3@"$(node -e 'console.log(require("'"${_pkgroot}"'/app/package.json").optionalDependencies["better-sqlite3"])')"

  [[ -f "${_app_binary}" ]] || {
    printf 'Missing better-sqlite3 binary at %s after reinstall\n' "${_app_binary}" >&2
    return 1
  }
}

package() {
  local _pkgroot
  _pkgroot="$(_9router_pkgroot)"

  install -dm755 "${pkgdir}/usr/lib/9router"
  cp -a "${_pkgroot}/." "${pkgdir}/usr/lib/9router/"

  find "${pkgdir}/usr/lib/9router" -type f ! -perm -u+r -exec chmod a+r {} +
  find "${pkgdir}/usr/lib/9router" -type d -exec chmod a+rx {} +

  install -Dm755 "${srcdir}/9router.sh" "${pkgdir}/usr/bin/9router"
  install -Dm644 "${srcdir}/9router.service" "${pkgdir}/usr/lib/systemd/user/9router.service"
  install -Dm644 "${srcdir}/.env.example" "${pkgdir}/usr/share/doc/${pkgname}/.env.example"
  install -Dm644 "${_pkgroot}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_pkgroot}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
