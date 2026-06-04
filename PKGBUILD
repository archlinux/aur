# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="xbright"
pkgname="${_pkgname}-git"
pkgver=1.0_1.r72.20201130.8b7fe6f
pkgrel=1
pkgdesc="GUI to change monitor brightness on X11 (using XRandR). Supports presets."
arch=(
  "i686"
  "x86_64"
)
url="https://github.com/MicahParks/xbright"
license=('MIT')
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
)
provides=(
  "${_pkgname}=${pkgver}"
)
depends=(
  glibc
  libGL.so  # Provided by 'libglvnd'.
  libx11
  libxcursor
  libxi
  libxinerama
  libxrandr
  libxxf86vm
)
makedepends=(
  "git"       # To download the source.
  "go"        # To build.
  "zopfli"    # To size-optimise PNG files.
  "parallel"  # To size-optimise PNG files.
  "libglvnd"  # Dependency 'libGL.so' and corresponding header files.
)
optdepends=()
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}.desktop"
)
sha256sums=(
  'SKIP'  # main upstream source (git)
  '9eb64415e492060435d1ed7d8e0340c624cf5a46114f4bcc512f8a0e941060fa'  # .desktop-file
)
#options+=('!lto' 'debug' '!strip')

prepare() {
  cd ${_pkgname}

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  if [ -e "${srcdir}/build" ]; then
    rm -R "${srcdir}/build"
  fi
  mkdir -p "${srcdir}/build"

  printf '%s\n' " --> Downloading go dependencies ..."
  # go mod download -x -modcacherw github.com/MicahParks/fbc
  go get -x -modcacherw . # fyne.io/fyne # github.com/MicahParks/fbc

  printf '%s\n' " --> Generating git log ..."
  git log > git.log

  printf '%s\n' " --> Size-optimising PNG files ..."
  printf '%s\n' icon.png pics/settings.png pics/sliders.png | parallel -j "`nproc`" zopflipng -m -y {} {}
}

pkgver() {
  cd "${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  _ver="$(grep -E '^Version:' deb.sh | awk -F: '{print $2}' | sed 's|#.*$||' | tr '-' '_' | tr -d '[[:space:]]')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  go build -x \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o "${srcdir}/build" \
    .
}

package() {
  cd "${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  install -Dvm0775 "${srcdir}/build/fbc" "${pkgdir}/usr/bin/xbright"
  install -Dvm0644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cd "${srcdir}/${_pkgname}"

  install -Dvm0644 icon.svg "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
  install -Dvm0644 icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md
  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}/pics" pics/*
  install -Dvm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
