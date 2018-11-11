# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=gobeansdb

pkgname="${_pkgname}-git"
pkgver=r623.d940fae
pkgrel=1
pkgdesc="High performance distributed object storage server from Douban Inc."
url="https://github.com/douban/gobeansdb"
makedepends=('go>=1.11')
options=('!strip' '!emptydirs')
arch=('x86_64')
license=('BSD-3-Clause')
conflicts=('gobeansdb')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"

  if [[ -d "${srcdir}/goext" ]]; then
    # Why read-only? :/
    chmod -R u=rwX,go=rX "${srcdir}/goext"

    rm -rf "${srcdir}/goext"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/goext"
  #export GO111MODULE=on

  go install ./
}

package() {
  install -d -m755 "${pkgdir}"/usr/bin
  install -d -m755 "${pkgdir}"/usr/share/"${_pkgname}"/{bin,conf,tests}

  export GOPATH="${srcdir}/goext"
  cd "${GOPATH}"

  # binary file
  install -D -m755 bin/gobeansdb "${pkgdir}/usr/share/${_pkgname}/bin/gobeansdb"
  ln -s "/usr/share/${_pkgname}/bin/gobeansdb" "${pkgdir}/usr/bin/gobeansdb"

  cd "${srcdir}/${_pkgname}"

  # conf and tests files
  install -D -m644 conf/* "${pkgdir}/usr/share/${_pkgname}/conf/"
  install -D -m644 tests/* "${pkgdir}/usr/share/${_pkgname}/tests/"

  # document
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  # license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
