# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=gobeansproxy
pkgver=1.0.2
pkgrel=1
pkgdesc='A proxy for GoBeansDB'
url='https://github.com/douban/gobeansproxy'
makedepends=('go>=1.11')
options=('!strip' '!emptydirs')
arch=('x86_64')
license=('BSD-3-Clause')
source=("https://github.com/douban/gobeansproxy/archive/v${pkgver}.tar.gz")
sha256sums=('e8ecec548450e8d138d3b4fb7c8599be5b927f5af668ed7452bba80d465b541d')

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
  install -d -m755 "${pkgdir}"/usr/share/"${pkgname}"/{bin,conf,templates,tests}
  install -d -m755 "${pkgdir}"/usr/share/"${pkgname}"/templates/{css,js}

  export GOPATH="${srcdir}/goext"
  cd "${GOPATH}"

  # binary file
  install -D -m755 bin/gobeansproxy "${pkgdir}/usr/share/${pkgname}/bin/gobeansproxy"
  ln -s "/usr/share/${pkgname}/bin/gobeansproxy" "${pkgdir}/usr/bin/gobeansproxy"

  cd "${srcdir}/${pkgname}-${pkgver}"

  # conf, templates and tests files
  install -D -m644 conf/* "${pkgdir}/usr/share/${pkgname}/conf/"
  install -D -m644 templates/*.html "${pkgdir}/usr/share/${pkgname}/templates/"
  install -D -m644 templates/css/* "${pkgdir}/usr/share/${pkgname}/templates/css/"
  install -D -m644 templates/js/* "${pkgdir}/usr/share/${pkgname}/templates/js/"
  install -D -m644 tests/* "${pkgdir}/usr/share/${pkgname}/tests/"

  # document
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
