pkgname=open-design
pkgver=0.24.0
pkgrel=9
_tag="open-design-v${pkgver}"
# Upstream CLI name is `od`; this package installs `open-design` because /usr/bin/od is coreutils (octal dump).
pkgdesc='Local-first design product: design skills and design systems with your code-agent CLI; daemon and static web UI (CLI: open-design).'
arch=('x86_64' 'aarch64')
url='https://github.com/nexu-io/open-design'
license=('Apache-2.0')
depends=('nodejs' 'node-gyp' 'python' 'make' 'gcc')
makedepends=('npm')
options=('!strip' '!debug')
source=("${url}/archive/refs/tags/${_tag}.tar.gz" 'open-design' 'open-design-rebuild-native' 'open-design-nodejs.hook')
sha256sums=('0e14e950116b9c6edd35e6c6217bb6847f8f521f3349ca98d306d09d1af9e3e7'
            '6d0dbacec1ef6e27725d04aee28221cb7ba4f1b39ed15c10efdf499540157bd5'
            'b5b254f77ed0f8a8b89909f561088298d34d7f4ee57c5dc18ef3901bb43c5ee7'
            'aba727989d9c776fea7c8ac3888d1129bab5b8d6d861dbefb31fb703e30cef04')

_sourcedir="open-design-${_tag}"

build() {
  cd "${_sourcedir}"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  # Corepack is not guaranteed to be installed; pin pnpm via npx.
  _pnpm() { npx --yes pnpm@10.33.2 "$@"; }
  _pnpm install --frozen-lockfile --ignore-scripts
  # Compile against the system Node used by the installed launcher.
  npm run build-release --prefix apps/daemon/node_modules/better-sqlite3 -- --nodedir=/usr
  /usr/bin/node -e "require('./apps/daemon/node_modules/better-sqlite3')(':memory:').close()"
  _pnpm bootstrap
  _pnpm --filter @open-design/web build
}

package() {
  cd "${_sourcedir}"
  local _dest="${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${_dest}"
  cp -a . "${_dest}/"
  rm -rf "${_dest}/.git" "${_dest}/e2e" "${_dest}/apps/web/.next"

  install -Dm755 "${srcdir}/open-design" "${pkgdir}/usr/bin/open-design"
  install -Dm755 "${srcdir}/open-design-rebuild-native" "${pkgdir}/usr/lib/${pkgname}/rebuild-native"
  install -Dm644 "${srcdir}/open-design-nodejs.hook" "${pkgdir}/usr/share/libalpm/hooks/open-design-nodejs.hook"
  chmod 755 "${_dest}/apps/daemon/dist/cli.js"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
