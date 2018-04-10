# Maintainer: JUXT <info@juxt.pro>
# Contributor: James Conroy-Finn <james@invetica.co.uk>
pkgname=systemd-cloud-watch
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="This utility reads from the systemd journal, and sends the data in batches to CloudWatch. "
arch=('i686' 'x86_64')
url="https://advantageous.github.io/systemd-cloud-watch/"
license=('APACHE')
groups=()
depends=('libsystemd')
makedepends=('go' 'git')
_gourl=github.com/advantageous
source=("https://github.com/advantageous/systemd-cloud-watch/archive/v${pkgver}.tar.gz"
        "systemd-cloud-watch.service")
md5sums=('53c7929af569434caada158896515baf'
         '2c610fe0e0677624ab3cd06ef14de22f')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${pkgname}"
  mv -f "${pkgname}-${pkgver}" "${srcdir}/src/${_gourl}/${pkgname}"

  cd "${srcdir}/src/${_gourl}/${pkgname}"
  GOPATH="${srcdir}" go get
}

build() {
  cd "${srcdir}/src/${_gourl}/${pkgname}"
  GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" go build
}

package() {
  install -Dm755 \
      "${srcdir}"/bin/systemd-cloud-watch \
      "${pkgdir}"/usr/bin/systemd-cloud-watch

  install -Dm744 \
      "${srcdir}"/systemd-cloud-watch.service \
      "${pkgdir}"/usr/lib/systemd/system/systemd-cloud-watch.service
}

# vim:set ts=2 sw=2 et:
