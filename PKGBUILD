# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=gobeansdb
_gitcommit=7127da29f8e9a4312ee600271e98b29ab6771753

pkgname=gobeansdb-git
pkgver=0.0.0+2+7127da2
pkgrel=1
pkgdesc="High performance distributed object storage server from Douban Inc."
url="https://github.com/douban/gobeansdb"
makedepends=('git' 'go' 'vgo-git')
options=('!strip' '!emptydirs')
arch=('x86_64')
license=('BSD-3-Clause')
source=("git+${url}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}"

  rm -rf "${srcdir}/goext"
}

build() {
  cd "${srcdir}"

  export GOPATH="${srcdir}/goext"

  install -d -m755 "${GOPATH}/src/github.com/douban"
  ln -s "${srcdir}/${_pkgname}" "${GOPATH}/src/github.com/douban/gobeansdb"

  cd "${GOPATH}/src/github.com/douban/gobeansdb"
  vgo install github.com/douban/gobeansdb
}

package() {
  install -d -m755 "${pkgdir}"/usr/bin
  install -d -m755 "${pkgdir}"/usr/share/"${_pkgname}"/{bin,conf,tests}

  # binary file
  export GOPATH="${srcdir}/goext"
  cd "${GOPATH}"
  install -D -m755 bin/gobeansdb "${pkgdir}/usr/share/${_pkgname}/bin/gobeansdb"
  ln -s "/usr/share/${_pkgname}/bin/gobeansdb" "${pkgdir}/usr/bin/gobeansdb"

  # conf and tests files
  cd "${srcdir}/${_pkgname}"
  install -D -m644 conf/* "${pkgdir}/usr/share/${_pkgname}/conf/"
  install -D -m644 tests/* "${pkgdir}/usr/share/${_pkgname}/tests/"

  # document
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  # license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
