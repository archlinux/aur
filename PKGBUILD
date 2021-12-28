# Maintainer: Josh VanderLinden <arch@cloudlery.com>
_gitname=vnstat-ui
pkgname=vnstatui
pkgver=0.8.2
pkgrel=3
pkgdesc="Basic web UI that displays traffic graphs from vnstat"
arch=('any')
url="http://bitbucket.org/instarch/vnstat-ui"
license=('BSD')
depends=('vnstat')
makedepends=('go' 'go-bindata' 'make' 'python-docutils')
backup=(
  'etc/default/vnstatui'
)
source=(
  "${_gitname}::git+http://bitbucket.org/instarch/vnstat-ui"
)
md5sums=('SKIP')

prepare() {
  export GOPATH="${srcdir}/go"

  mkdir -p "${GOPATH}/src/bitbucket.org/instarch"
  ln -Tsf "${srcdir}/${_gitname}" "${GOPATH}/src/bitbucket.org/instarch/vnstat-ui"

  cd "${GOPATH}/src/bitbucket.org/instarch/vnstat-ui/"
  make deps
}

build() {
  export GOPATH="${srcdir}/go"

  cd "${GOPATH}/src/bitbucket.org/instarch/vnstat-ui/"
  make build
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm755 vnstatui "${pkgdir}/usr/bin/vnstatui"
  install -Dm644 vnstatui.conf "${pkgdir}/etc/default/vnstatui"
  install -Dm644 vnstatui.service "${pkgdir}/usr/lib/systemd/system/vnstatui.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  msg "Creating manpage"
  rst2man README.rst | gzip > vnstatui.1.gz
  install -Dm644 vnstatui.1.gz "${pkgdir}/usr/share/man/man1/vnstatui.1.gz"
}

# vim:set ts=2 sw=2 et:
