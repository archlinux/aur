# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_nodename='gtfs'
_pkgname="nodejs-gtfs"
pkgname="${_pkgname}"
pkgver=4.18.7
pkgrel=1
pkgdesc='Loads transit data in GTFS format into a SQLite database and provides some methods to query for agencies, routes, stops, times, fares, calendars and other GTFS data.'
arch=(
  "x86_64"
)
# To see latest version, check https://registry.npmjs.org/gtfs.
url="https://github.com/BlinkTagInc/node-gtfs"
license=('MIT')
provides=(
  "node-gtfs=${pkgver}"
  "gtfs-import=${pkgver}"
  "gtfs-export=${pkgver}"
  "gtfsrealtime-update=${pkgver}"
)
conflicts=(
  "node-gtfs"
  "gtfs-import"
  "gtfs-export"
  "gtfsrealtime-update"
)
replaces=()
makedepends=(
  "npm"
  "git"
)
depends=(
  "nodejs"
  "glibc"
  "libstdc++.so"
  #'libsqlite3.so'
)
optdepends=()
backup=()
source=(
  "https://registry.npmjs.org/${_nodename}/-/${_nodename}-${pkgver}.tgz"
  "node-gtfs::git+https://github.com/BlinkTagInc/node-gtfs.git" # Extract example config from there.
)
sha256sums=(
  '4f8217bab5b505df6d3e7de516bdb37c892fb4948152bc0aa0cf75ecac236a60'  # Main upstream source.
  'SKIP'
)
noextract=("${_nodename}-${pkgver}.tgz")


prepare() {

  export NPM_DIR="${srcdir}/.npm"
  export PNPM_DIR="${srcdir}/.pnpm"

  # Downloads dependencies, so we do it here.
  npm install -g --cache "${srcdir}/.npm-cache" --prefix "${srcdir}/build" --verbose --production --omit=dev "${srcdir}/${_nodename}-${pkgver}.tgz"
}



package() {
  cd "${srcdir}"

  export NPM_DIR="${srcdir}/.npm"
  export PNPM_DIR="${srcdir}/.pnpm"

  install -dvm755 "${pkgdir}/usr"
  cp -v -dR --preserve=mode,timestamps,links build/{lib,bin} "${pkgdir}/usr/"

  install -dvm775 "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sv /usr/lib/node_modules/gtfs/{README.md,package.json}  "${pkgdir}/usr/share/doc/${_pkgname}"/
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" node-gtfs/{config-sample.json,config-sample-full.json,config-sample-rtupdates.json}

  install -dvm775 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv /usr/lib/node_modules/gtfs/LICENSE.md                "${pkgdir}/usr/share/licenses/${pkgname}"/
}
