# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="transito"
pkgname="${_pkgname}-git"
pkgver=0.10.0.r570.20250628.6aee3c3
pkgrel=1
pkgdesc='A data-provider-agnostic public transportation app that lets you route between locations using openly available public GTFS feeds.'
arch=(
  "aarch64"
  "armv7h"
  "armv8h"
  "loong64"
  "i686"
  "x86_64"
)
url="http://mr.lrdu.org/transito"
_url_gitrepo="https://git.sr.ht/~mil/transito"
license=(
  'GPL-3.0-or-later'  # Main software
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
)
replaces=()
replaces=()
makedepends=(
  "git"
  "go>=1.24.0"
  "sh"

  "libglvnd"
  "libxkbcommon"
  "libxkbcommon-x11"
  "mesa"
  "sqlite3"
  "vulkan-headers"
  "wayland"
)
depends=(
  'glibc'
  'libEGL.so'
  'libwayland-client.so'
  'libwayland-cursor.so'
  'libwayland-egl.so'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxfixes'
  'libxkbcommon.so'
  'libxkbcommon-x11.so'
)
optdepends=()
backup=()
source=(
  "${_pkgname}::git+${_url_gitrepo}"
)
sha256sums=(
  'SKIP'                                                              # Main upstream source.
)
#options+=('!lto' 'debug' '!strip')



prepare() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOCACHE="${GOPATH}/cache"
  export GOMODCACHE="${GOPATH}/cache-mod"
  export GOTMPDIR="${GOPATH}/tmp"  # This one is actually needed, otherwise build fails with 'go: creating work dir: stat /var/cache/makepkg/build/transito-git/src/.go/tmp: no such file or directory'.
  export GOBIN="${GOPATH}/bin"

  mkdir -p "${GOCACHE}"
  mkdir -p "${GOMODCACHE}"
  mkdir -p "${GOTMPDIR}"
  mkdir -p "${GOBIN}"

  printf '%s\n' " --> Downloading go dependencies ..."
  go mod download -x -modcacherw

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
  export GOCACHE="${GOPATH}/cache"
  export GOMODCACHE="${GOPATH}/cache-mod"
  export GOTMPDIR="${GOPATH}/tmp"
  export GOBIN="${GOPATH}/bin"

  local _CFLAGSADDITIONS='-Wno-discarded-qualifiers'
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  # Do not use build.sh, since it _maybe_ checks out some release version and not the latest git commit.
  #printf '%s\n' " --> Building application ('build.sh blinux') ..."
  #sh build.sh blinux

  printf '%s\n' " --> Building application ('go build') ..."
  go build -v -trimpath -tags=sqlite_math_functions,desktop,production
}



# # 'check()' disabled since there are no tests (as of 2026-06-07).
# check() {
#   cd "${srcdir}/${_pkgname}"
# 
#   export GOPATH="${srcdir}/.go"
#   export GOCACHE="${GOPATH}/cache"
#   export GOMODCACHE="${GOPATH}/cache-mod"
#   export GOTMPDIR="${GOPATH}/tmp"
#   export GOBIN="${GOPATH}/bin"
# 
#   printf '%s\n' " --> Checking ... (This may take some time without any output, since some compilation goes on.)"
#   go test -v
# }



package() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOCACHE="${GOPATH}/cache"
  export GOMODCACHE="${GOPATH}/cache-mod"
  export GOTMPDIR="${GOPATH}/tmp"
  export GOBIN="${GOPATH}/bin"

  printf '%s\n' " --> patching 'build.sh' to honour '\$pkgdir' ..."
  sed -E -e "s|([[:space:]])(/usr)|\1${pkgdir}\2|g" -i build.sh

  printf '%s\n' " --> Installing main application ..."
  sed -E -e "s|([[:space:]])(/usr)|\1${pkgdir}\2|g" -i build.sh
  sh build.sh install

  printf '%s\n' " --> Installing documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md
  cp -rv doc "${pkgdir}/usr/share/doc/${_pkgname}"/
  printf '%s\n' " --> Installing license ..."
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
