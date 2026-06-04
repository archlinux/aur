# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="gtfs-planner"
pkgname="${_pkgname}-git"
pkgver=r76.20260603.ed129a1
pkgrel=3
pkgdesc='"Bus Planning": A desktop application for visualizing and planning trips using GTFS (General Transit Feed Specification) public transit data. Built with Go, React, and MapLibre GL.'
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
  'MIT'          # Upstream.
  'GPL-3.0-only' # Wrapper scripts.
)
provides=(
  "${_pkgname}=${pkgver}"
  "bus-planning"
  "bus-planning-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
  "bus-planning"
  "bus-planning-bin"
)
replaces=()
makedepends=(
  "git"
  "go>=1.24.0"
  "wails"
  "nodejs>=18"
  "npm"

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
  'bash'
  'coreutils'
  'glibc'
  'gtfs-import'
  #'nodejs-gtfs'
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
  #"nodejs>=18"  # 'gtfs-manager import' needs this.
  #'npm'         # 'gtfs-manager import' runs 'npx gtfs-import'.
)
optdepends=()
backup=(
  'etc/gtfs-planner/gtfs-config.yaml'
  'etc/gtfs-planner/gtfs-config.json'
)
source=(
  "${_pkgname}::git+${_url_gitrepo}.git"
  "gtfs-planner.desktop"
  "gtfs-config.yaml"
  "gtfs-config.json"
  "gtfs-config.readme.txt"
  "gtfs-manager.sh" # Wrapper that runs with the global config file.
  "gtfs-planner.sh" # Wrapper that runs with the global config file.
  "licensing-info.txt"
)
sha256sums=(
  'SKIP'                                                              # Main upstream source.
  '2eb7f377f5d40dbf6c65b26c67fe7c9f4c56e3deab18f75847b27d392630edb8'  # gtfs-planner.desktop
  '06fb0a08fdf721e2f88683a98424b3c0c25d0ce2824561cfb1bf828b760eecef'  # gtfs-config.yaml
  'acaa91df5fe867fb44a73957619ad74a1f3fcee557f576de35fb839b960984c2'  # gtfs-config.json
  '99bc7f08687775af0127795213b79c7b08a84bf2fd4ad641fbf592d66e19542a'  # gtfs-config.readme.txt
  '063ad49b888b3a99aba0f7c914e59f721cd4919ef634be888ba835d45a0eaef7'  # gtfs-manager.sh
  'ca5a9c093919042d39ae57cd0dfaa82b9e53ac793ae73d7db813c25cca0e61c1'  # gtfs-planner.sh
  '3b365dca9ccd2d8408ee8cc4ddf1a48e561ad639e4a898c91961bbd73e113247'  # licensing-info.txt
)
#options+=('!lto' 'debug' '!strip')



prepare() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  printf '%s\n' " --> Downloading go dependencies ..."
  go mod download -x -modcacherw

  printf '%s\n' " --> Generating git log ..."
  git log . > git.log
}



pkgver() {
  cd "${srcdir}/${_pkgname}"

  #_ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-([0-9]+)$|+\1|')"
  _rev="$(git rev-list --count HEAD .)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad" .)"
  _hash="$(git log -1 --format="%h" .)"

  #if [ -z "${_ver}" ]; then
  #  error "Version could not be determined."
  #  return 1
  #else
  #  printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  #fi
  printf '%s' "r${_rev}.${_date}.${_hash}"
}



build() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  printf '%s\n' " --> Building 'gtfs-manager' ('go build') ..."
  go build -v -o build/bin/gtfs-manager ./cmd/...
  printf '%s\n' " --> Building application ('wails build') ..."
  wails build -v 2 -trimpath -tags webkit2_41,desktop,production  # 'webkit2_41' needed to use webkit2gtk-4.1 instead of the unavailable and outdated webkit2gtk-4.0.
}



check() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  printf '%s\n' " --> Checking ..."
  go test -v
}



package() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"


  printf '%s\n' " --> Installing main application ..."
  install -Dvm755 -t "${pkgdir}/usr/lib/gtfs-planner/bin" build/bin/{bus-planning,gtfs-manager}

  printf '%s\n' " --> Installing nodejs gtfs dependency ..."

  printf '%s\n' " --> Installing launcher scripts ..."
  install -Dvm755 "${srcdir}/gtfs-manager.sh"       "${pkgdir}/usr/bin/gtfs-manager"
  install -Dvm755 "${srcdir}/gtfs-planner.sh"       "${pkgdir}/usr/bin/gtfs-planner"
  ln -svr         "${pkgdir}/usr/bin/gtfs-planner"  "${pkgdir}/usr/bin/bus-planning"

  printf '%s\n' " --> Installing system wide configuration file ..."
  install -Dvm644 "${srcdir}/gtfs-config.yaml"        "${pkgdir}/etc/gtfs-planner/gtfs-config.yaml"
  install -Dvm644 "${srcdir}/gtfs-config.json"        "${pkgdir}/etc/gtfs-planner/gtfs-config.json"

  printf '%s\n' " --> Installing application icon and .desktop file ..."
  install -Dvm644 build/appicon.png                                "${pkgdir}/usr/share/pixmaps"/bus-planning.png
  #ln -svr "${pkgdir}/usr/share/pixmaps"/bus-planning.png           "${pkgdir}/usr/share/pixmaps"/gtfs-planner.png
  install -Dvm644 "${srcdir}/gtfs-planner.desktop"                 "${pkgdir}/usr/share/applications"/bus-planning.desktop
  #ln -svr "${pkgdir}/usr/share/applications"/bus-planning.desktop  "${pkgdir}/usr/share/applications"/gtfs-planner.desktop

  printf '%s\n' " --> Installing basic documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md DEVELOPMENT.md CLAUDE.md "${srcdir}/gtfs-config.readme.txt"
  ln -sv "/usr/share/doc/${_pkgname}/gtfs-config.readme.txt" "${pkgdir}/etc/gtfs-planner/gtfs-config.readme.txt"
  printf '%s\n' " --> Installing license ..."
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE" "${srcdir}/licensing-info.txt"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv ../spdx/GPL-3.0-only.txt .
}
