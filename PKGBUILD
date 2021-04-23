# Maintainer: dreieck

_pkgname=paperlike-go
pkgname="${_pkgname}-git"
pkgver=r11.20210421.ad107f1
pkgrel=1
pkgdesc="CLI tool to control a Dasung Paperlike HD* (2019) screen."
arch=(
  x86_64
  i686
)
url="https://github.com/leoluk/paperlike-go"
license=('APACHE')
depends=()
makedepends=(
  'git'
  'go'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "paperlike-cli=${pkgver}"
  "paperlike-cli-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "paperlike-cli"
  "paperlike-git"
)
source=(
  "${_pkgname}::git+git://github.com/leoluk/paperlike-go.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  GOPATH="${srcdir}/golang"
  export GOPATH
  cd "${srcdir}/${_pkgname}"
  _rev="$(git rev-list HEAD --count)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  printf '%s' "r${_rev}.${_date}.${_hash}"
}

prepare() {
  GOPATH="${srcdir}/golang"
  export GOPATH
  mkdir -p "${srcdir}/${_pkgname}/build"
  cd "${srcdir}/${_pkgname}/build"
  go get ../...
}

build() {
  GOPATH="${srcdir}/golang"
  export GOPATH
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' "${url}" > "upstream.url"
  go build -v -o build ./cmd/...
}

package() {
  GOPATH="${srcdir}/golang"
  export GOPATH

  cd "${srcdir}/${_pkgname}"

  install -D -v -m755 build/paperlike-cli "${pkgdir}/usr/bin/paperlike-cli"
  install -D -v -m755 build/fuzz "${pkgdir}/usr/bin/paperlike-fuzz"
  install -D -v -m755 build/sendraw "${pkgdir}/usr/bin/paperlike-sendraw"

  for _docfile in upstream.url README.md notes.txt; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
