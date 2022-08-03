# Maintainer: dreieck

_pkgname='chkb'
pkgname="${_pkgname}-git"
epoch=0
pkgver=0.2.2+1.r143.20210301.6681d1d
pkgrel=1
pkgdesc="Turns a regular keyboard into a quasi fully programmable keyboard by hooking up into Linux' uinput. Similar to kmonad."
arch=(
  'i686'
  'x86_64'
)
license=('custom:MIT')
url='https://github.com/MetalBlueberry/chkb'
depends=(
  'glibc'
)
makedepends=(
  'git'
  'go'
)
optdepends=()
replaces=()
conflicts=(
  "${_pkgname}"
)
provides=(
  "${_pkgname}=${pkgver}"
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}/go"
  mkdir -p "${GOPATH}"

  go get
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}/go"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}/go"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -ldflags="-X 'github.com/MetalBlueberry/chkb/cmd.Version=${pkgver}'"
}

package() {
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}/go"

  # Install main files.
  install -D -v -m755 chkb "${pkgdir}/usr/bin/chkb"
  install -D -v -m644 chkb.yaml "${pkgdir}/usr/share/doc/${_pkgname}/examples/chkb.yaml"

  # Install license.
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.MIT.txt"

  # Install more documentation.
  for _docfile in README.md; do
      install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.MIT.txt" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.MIT.txt"

}
