# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=gobeansproxy
pkgver=1.0.5
pkgrel=1
pkgdesc='A proxy for GoBeansDB'
url='https://github.com/douban/gobeansproxy'
makedepends=('go>=1.11.0')
options=('!strip' '!emptydirs')
arch=('x86_64')
license=('BSD-3-Clause')
source=("https://github.com/douban/gobeansproxy/archive/v${pkgver}.tar.gz")
sha256sums=('a52a8f6891620b20d1c8a57181993df2d132f8d2334a0fe82d3aeb03f3783710')

prepare() {
  cd "${srcdir}"

  if [[ -d "${srcdir}/goext" ]]; then
    # Why read-only? :/
    chmod -R u=rwX,go=rX "${srcdir}/goext"

    rm -rf "${srcdir}/goext"
  fi

  # Fix version
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s/Version\ =\ \"v1.0.2\"/Version\ =\ \"v${pkgver}\"/g" config/config.go
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export GOPATH="${srcdir}/goext"
  go mod vendor
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
