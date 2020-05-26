# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=gobeansdb
pkgver=1.1.3
pkgrel=1
pkgdesc='Yet anonther distributed key-value storage system from Douban Inc.'
url='https://github.com/douban/gobeansdb'
makedepends=('go>=1.11')
options=('!strip' '!emptydirs')
arch=('x86_64')
license=('BSD-3-Clause')
conflicts=('gobeansdb-git')
source=(
  "https://github.com/douban/gobeansdb/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'a6529b3add5663de38dc1ad43a99092c13b28e831b01750e80c4e892cbbd4621'
)

prepare() {
  cd "${srcdir}"

  if [[ -d "${srcdir}/goext" ]]; then
    # Why read-only? :/
    chmod -R u=rwX,go=rX "${srcdir}/goext"

    rm -rf "${srcdir}/goext"
  fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export GOPATH="${srcdir}/goext"
  #export GO111MODULE=on

  go install ./
}

package() {
  install -d -m755 "${pkgdir}"/usr/bin
  install -d -m755 "${pkgdir}"/usr/share/"${pkgname}"/{bin,conf,tests}

  export GOPATH="${srcdir}/goext"
  cd "${GOPATH}"

  # binary file
  install -D -m755 bin/gobeansdb "${pkgdir}/usr/share/${pkgname}/bin/gobeansdb"
  ln -s "/usr/share/${pkgname}/bin/gobeansdb" "${pkgdir}/usr/bin/gobeansdb"

  cd "${srcdir}/${pkgname}-${pkgver}"

  # conf and tests files
  install -D -m644 conf/* "${pkgdir}/usr/share/${pkgname}/conf/"
  install -D -m644 tests/* "${pkgdir}/usr/share/${pkgname}/tests/"

  # document
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
