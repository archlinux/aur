# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="gtfs-planner"
pkgname="${_pkgname}-git"
pkgver=1.0.0+13.r148.20260605.95f1c45
pkgrel=2
pkgdesc='A desktop application for visualizing and planning trips using GTFS (General Transit Feed Specification) public transit data. Built with Go, React, and MapLibre GL.'
arch=(
  "aarch64"
  "armv7h"
  "armv8h"
  "loong64"
  "i686"
  "x86_64"
)
url="https://github.com/klaustopher/gtfs-planner"
_url_gitrepo="https://github.com/klaustopher/gtfs-planner"
license=(
  'MIT'  # gtfs-planner
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
  "bus-planning<1"
)
replaces=(
  "bus-planning<1"  # Official upstream name has changed from "Bus Planning" to "GTFS Planner".
)
replaces=()
makedepends=(
  "git"
  "go>=1.24.0"
  "wails"

  "at-spi2-core"
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'harfbuzz'
  'libsoup3'
  'pango'
  "webkit2gtk-4.1"
  'zlib'
)
depends=(
  'glibc'
  'libatk-1.0.so'        # at-spi2-core
  'libcairo.so'          # cairo
  'libcairo-gobject.so'  # cairo
  'libgdk_pixbuf-2.0.so' # gdk-pixbuf2
  'libgio-2.0.so'        # glib2
  'libglib-2.0.so'       # glib2
  'libgmodule-2.0.so'    # glib2
  'libgobject-2.0.so'    # glib2
  'libharfbuzz.so'       # harfbuzz
  'libpango-1.0.so'      # pango
  'libpangocairo-1.0.so' # pango
  'libsoup-3.0.so'       # libsoup3
  'libgtk-3.so'          # gtk3
  'libgdk-3.so'          # gtk3
  'libwebkit2gtk-4.1.so' # webkit2gtk-4.1
  'libz.so'              # zlib
)
optdepends=()
backup=()
source=(
  "${_pkgname}::git+${_url_gitrepo}.git"
  "gtfs-planner.desktop"
)
sha256sums=(
  'SKIP'                                                              # Main upstream source.
  '675735318d38495947e13448316708e7c8f1c5547ed4f1701f05ad28729c2a17'  # gtfs-planner.desktop
)
#options+=('!lto' 'debug' '!strip')



prepare() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"
  export NPM_DIR="${srcdir}/.npm"
  export npm_config_cache="${srcdir}/.npm-cache"

  printf '%s\n' " --> Downloading go dependencies ..."
  go mod download -x -modcacherw

  printf '%s\n' " --> Downloading node dependencies ..."
  pushd frontend > /dev/null
  npm install --cache "${srcdir}/.npm-cache" --verbose
  popd > /dev/null

  printf '%s\n' " --> Generating git log ..."
  git log . > git.log
}



pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-([0-9]+)$|+\1|')"
  _rev="$(git rev-list --count HEAD .)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad" .)"
  _hash="$(git log -1 --format="%h" .)"

  if [ -z "${_ver}" ]; then
   error "Version could not be determined."
   return 1
  else
   printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}



build() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"
  export NPM_DIR="${srcdir}/.npm"
  export npm_config_cache="${srcdir}/.npm-cache"
  export npm_config_offline=true

  printf '%s\n' " --> Building application ('wails build') ..."
  wails build -v 2 -trimpath -tags webkit2_41,desktop,production  # 'webkit2_41' needed to use webkit2gtk-4.1 instead of the unavailable and outdated webkit2gtk-4.0.
}



check() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"
  export NPM_DIR="${srcdir}/.npm"
  export npm_config_cache="${srcdir}/.npm-cache"
  export npm_config_offline=true

  printf '%s\n' " --> Checking ..."
  go test -v
}



package() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"
  export NPM_DIR="${srcdir}/.npm"
  export npm_config_cache="${srcdir}/.npm-cache"
  export npm_config_offline=true


  printf '%s\n' " --> Installing main application ..."
  install -Dvm755 -t "${pkgdir}/usr/bin" build/bin/gtfs-planner

  printf '%s\n' " --> Installing application icon and .desktop file ..."
  install -Dvm644 build/appicon.png                                "${pkgdir}/usr/share/pixmaps"/gtfs-planner.png
  install -Dvm644 "${srcdir}/gtfs-planner.desktop"                 "${pkgdir}/usr/share/applications"/gtfs-planner.desktop

  printf '%s\n' " --> Installing basic documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md DEVELOPMENT.md CLAUDE.md CHANGELOG.md
  printf '%s\n' " --> Installing license ..."
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
