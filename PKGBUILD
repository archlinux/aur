# Maintainer: Ben Morgan <neembi@gmail.com>
# vim: set ts=2 sw=2:
pkgname=repoctl
pkgver=0.13
pkgrel=1
pkgdesc="A supplement to repo-add and repo-remove which simplifies managing local repositories"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go')
options=('!strip')
source=(https://github.com/cassava/repoctl/releases/download/v0.13/repoctl-0.13.tar.gz)
md5sums=('4f218f588e21fc955801a82ed837e5c6')

build() {
  # Get and build the builder.
  gopath=${srcdir}/go
  if [[ -d ${gopath} ]]; then
    rm -rf ${gopath}
  fi
  mkdir ${gopath}
  GOPATH=${gopath} go get github.com/constabulary/gb/...

  cd ${srcdir}/${pkgname}-${pkgver}
  ${gopath}/bin/gb build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Install repoctl program
  mkdir -p ${pkgdir}/usr/bin
  install -m755 bin/repoctl ${pkgdir}/usr/bin/

  # Install other documentation
  mkdir -p ${pkgdir}/usr/share/doc/repoctl
  install -m644 TODO.md README.md NEWS.md ${pkgdir}/usr/share/doc/repoctl/

  # Install completion files
  mkdir -p ${pkgdir}/usr/share/zsh/site-functions/
  install -m644 contrib/zsh_completion ${pkgdir}/usr/share/zsh/site-functions/_repoctl
}
