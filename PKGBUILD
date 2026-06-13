pkgname=open-design
pkgver=0.10.1
pkgrel=7
_tag="open-design-v${pkgver}"
# Upstream CLI name is `od`; this package installs `open-design` because /usr/bin/od is coreutils (octal dump).
pkgdesc='Local-first design product: design skills and design systems with your code-agent CLI; daemon and static web UI (CLI: open-design).'
arch=('x86_64' 'aarch64')
url='https://github.com/nexu-io/open-design'
license=('Apache-2.0')
# Any provider of the nodejs package (mainline or e.g. nodejs-lts-jod); upstream prefers ~24.
depends=('nodejs')
makedepends=('python' 'make' 'gcc')
options=('!strip')
source=("${url}/archive/refs/tags/${_tag}.tar.gz" 'open-design')
sha256sums=('83cbe8ac1d2ea61d26d92563d5cac180d3045f2e8ccb61a4d247325d8f6e6734'
            'f8fde1bc96045529c0d45a2fd6bcd47fc4f63fe7c07624292113b9e8ff55717c')

_sourcedir="open-design-${_tag}"

build() {
  cd "${_sourcedir}"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  # Corepack is absent on some Node installs (e.g. nodejs-lts-jod); pin pnpm via npx instead.
  _pnpm() { npx --yes pnpm@10.33.2 "$@"; }
  _pnpm install --frozen-lockfile
  _pnpm --filter @open-design/contracts build
  _pnpm --filter @open-design/daemon build
  _pnpm --filter @open-design/web build
}

package() {
  cd "${_sourcedir}"
  local _dest="${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${_dest}"
  cp -a . "${_dest}/"
  rm -rf "${_dest}/.git" "${_dest}/e2e" "${_dest}/apps/web/.next"

  install -Dm755 "${srcdir}/open-design" "${pkgdir}/usr/bin/open-design"
  chmod 755 "${_dest}/apps/daemon/dist/cli.js"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
