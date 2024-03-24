# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgbasename="adbfs"
_pkgname="${_pkgbasename}-klippenstein"
pkgname="${_pkgname}-git"
pkgver=r103.20230624.31b5a2e
pkgrel=1
pkgdesc='fuse filesystem to mount android diveces via ADB. Software which allows to manually specify which android device to mount, and comes with automounter.'
arch=(
  "i686"
  "x86_64"
)
# url='https://github.com/zach-klippenstein/adbfs'
url='https://github.com/exidler/adbfs'
license=(Apache)
depends=(
  "gcc-libs"
  "fuse"
)
makedepends=(
  "git"
  "go"
)
optdepends=()
provides=(
  "${_pkgbasename}"
  "${_pkgname}"
  "${_pkgbasename}-automount"
  "${_pkgbasename}-automount-git=${pkgver}"
)
conflicts=(
  "${_pkgbasename}"
  "${_pkgbasename}-git"          # Only needed because the package `adbfs-git` missed to add `adbfs` to the `provides` array.
  "${_pkgbasename}-rootless-git" # Only needed because the package `adbfs-rootless-git` missed to add `adbfs` to the `provides` array.
  "${_pkgname}"
  "${_pkgbasename}-automount"
)
source=(
  "${_pkgname}::git+${url}.git"
  "goadb::git+https://github.com/exidler/goadb"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"
  #export GO15VENDOREXPERIMENT=1 # Taken from `./install.sh`
  mkdir -p "${GOPATH}"
  mkdir -p "${GOBIN}"

  go get

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"
  export GO15VENDOREXPERIMENT=1 # Taken from `./install.sh`

  go build -v ./cmd/...
}

package() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"
  export GO15VENDOREXPERIMENT=1 # Taken from `./install.sh`

  go install -v ./cmd/...
  install -Dvm755 -t "${pkgdir}/usr/bin"  "${GOBIN}"/*

  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  for _docfile in 'git.log' 'README.md'; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_docfile}"
  done
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}"/* "${pkgdir}/usr/share/doc/${_pkgname}"/
}
