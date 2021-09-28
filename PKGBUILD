# Maintainer: dreieck

_pkgorigname=magnacarto
_pkgname="${_pkgorigname}"
pkgname="${_pkgname}-git"
pkgdesc="A CartoCSS map style processor that generates Mapnik XML and MapServer map files. Writte in go."
epoch=1
pkgver=0.0.0_dev+r580.20210517.28e903c
pkgrel=1
arch=('u686' 'x86_64')
license=('apache')
url="http://github.com/omniscale/magnacarto"
depends=(
)
makedepends=(
  'boost'
  'git'
  'go>=1.6'
  'mapnik>=2.2' # For building magnacarto-mapnik.
)
optdepends=(
  "mapnik>=2.2: For rendering with mapnik ('magnacarto-mapnik')."
  "mapserver: For rendering with mapserver ('magnaserv')"
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  # "${_pkgorigname}::git+git://github.com/omniscale/${_pkgorigname}.git" # fetched in prepare()!
)
sha256sums=(
  # 'SKIP'
)

prepare() {
  export GOPATH="${srcdir}/go"
  mkdir -p "${GOPATH}"
  msg2 "Fetching sources ..."
  GO111MODULE=off go get -v -d "github.com/omniscale/magnacarto"
}

pkgver() {
  export GOPATH="${srcdir}/go"
  cd "${GOPATH}/src/github.com/omniscale/magnacarto"

  _ver="$(sed 's|//.*$||g' version.go | grep -E -e '[[:space:]]*[Vv]ersion[[:space:]]*=' | sed 's|//.*$||' | awk -F '=' '{print $2}' | tr -d [[:space:]]\"\' | tr '-' '_')"
  _additionalver="$(grep -E '^[[:space:]]*BUILD_VERSION[[:space:]]*=' Makefile | awk -F '=' '{print $2}' | sed -E 's|-*\$.*$||g' | tr -d [[:space:]]\"\')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"

  if [ -n "${_ver}" ]; then
    printf '%s' "${_ver}${_additionalver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  export GOPATH="${srcdir}/go"
  cd "${GOPATH}/src/github.com/omniscale/magnacarto"

  make cmds
}

check() {
  export GOPATH="${srcdir}/go"
  cd "${GOPATH}/src/github.com/omniscale/magnacarto"

  make test
  # make test-full # needs 'mapserver' in the $PATH
}

package() {
  export GOPATH="${srcdir}/go"
  cd "${GOPATH}/src/github.com/omniscale/magnacarto"

  for _bin in magnacarto magnacarto-mapnik magnaserv; do
    install -D -v -m755 "${_bin}" "${pkgdir}/usr/bin/${_bin}"
  done

  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgname}/" && chown -R root:root "${pkgdir}/usr/share/doc/${_pkgname}/docs" && chmod a+X "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  rm -f "${pkgdir}/usr/share/doc/${_pkgname}/docs/.gitignore"

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
