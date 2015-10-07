# Contributor: Ben Morgan <neembi@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=repoctl-git
pkgver=v0.13.29.g1a16732
pkgrel=1
pkgdesc="A supplement to repo-add and repo-remove which simplifies managing local repositories"
arch=('i686' 'x86_64')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('gcc-go')
source=("git+https://github.com/cassava/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags|sed 's/-/./g'
}

build() {
  export PATH=/usr/bin/go:$PATH
  cd ${pkgname%-git}  
  GOPATH=${srcdir} go get github.com/cassava/${pkgname%-git}/...
}

package() {
  cd ${pkgname%-git}

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
