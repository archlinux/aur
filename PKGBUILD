# Maintainer: motherofmilk <iulian.dita@gmail.com>

pkgname=open-design-git
pkgver=0.4.0.r260.g74f1a18b
pkgrel=1
pkgdesc='Local-first design product: design skills and design systems with your code-agent CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/nexu-io/open-design'
license=('Apache-2.0')
depends=('nodejs')
makedepends=('git' 'npm' 'python' 'make' 'gcc')
provides=('open-design')
conflicts=('open-design' 'open-design-bin')
options=('!strip')
source=("${pkgname}::git+https://github.com/nexu-io/open-design.git#branch=main" 'open-design')
sha256sums=('SKIP'
            '3e7815eab88d3b359d0617cbf1777ae234988eb9e3365d35387f564af3042fde')

pkgver() {
  cd "${srcdir}/${pkgname}"
  local _version _rev _commit
  _version="$(sed -n 's/^  "version": "\([^"]*\)",$/\1/p' package.json | head -n1)"
  _rev="$(git rev-list --count HEAD)"
  _commit="$(git rev-parse --short HEAD)"
  printf '%s.r%s.g%s' "${_version}" "${_rev}" "${_commit}"
}

build() {
  cd "${srcdir}/${pkgname}"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  _pnpm() { npx --yes pnpm@10.33.2 "$@"; }

  _pnpm install --frozen-lockfile
  _pnpm --filter @open-design/sidecar-proto build
  _pnpm --filter @open-design/sidecar build
  _pnpm --filter @open-design/platform build
  _pnpm --filter @open-design/web build
  _pnpm --filter @open-design/daemon build
}

package() {
  cd "${srcdir}/${pkgname}"
  local _dest="${pkgdir}/usr/lib/open-design"

  install -dm755 "${_dest}"
  cp -a . "${_dest}/"
  rm -rf "${_dest}/.git" "${_dest}/e2e" "${_dest}/apps/web/.next"
  rm -f "${_dest}/node_modules/.pnpm-workspace-state-v1.json"
  find "${_dest}" -type d -name .bin -prune -exec rm -rf {} +

  install -Dm755 "${srcdir}/open-design" "${pkgdir}/usr/bin/open-design"
  chmod 755 "${_dest}/apps/daemon/dist/cli.js"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
