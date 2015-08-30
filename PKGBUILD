# Contributor: Ben Morgan <neembi@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=repoctl-git
pkgver=v0.13.24.g29d0ea6
pkgrel=2
pkgdesc="A supplement to repo-add and repo-remove which simplifies managing local repositories"
arch=('i686' 'x86_64')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go')
replaces=('repo-keep')
source=("git+https://github.com/cassava/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags|sed 's/-/./g'
}

build() {
  # Get and build the builder.
  gopath=${srcdir}/go
  if [[ -d ${gopath} ]]; then
    rm -rf ${gopath}
  fi
  mkdir ${gopath}
  GOPATH=${gopath} go get github.com/constabulary/gb/...

  cd ${srcdir}/${pkgname%-git}
  ${gopath}/bin/gb build
}

package() {
  cd ${srcdir}/${pkgname%-git}

  # Install repoctl program
  install -d ${pkgdir}/usr/bin
  install -m755 bin/repoctl ${pkgdir}/usr/bin/

  # Install other documentation
  install -d ${pkgdir}/usr/share/doc/repoctl
  install -m644 README.md NEWS.md ${pkgdir}/usr/share/doc/repoctl/

  # Install completion files
  install -d ${pkgdir}/usr/share/zsh/site-functions/
  install -m644 contrib/zsh_completion ${pkgdir}/usr/share/zsh/site-functions/_repoctl
  
  # install LICENSE
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/repoctl-git/LICENSE
}
