# Maintainer: Ben Morgan <neembi@gmail.com>
# vim: set ts=2 sw=2:
pkgname=repoctl
pkgver=0.14
pkgrel=2
pkgdesc="A supplement to repo-add and repo-remove which simplifies managing local repositories"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go')
options=('!strip')
source=(https://github.com/cassava/repoctl/releases/download/v${pkgver}/repoctl-${pkgver}.tar.gz)
md5sums=('a5a2b12e80728311cc40dc8e75e1956b')

prepare() {
  dest="$srcdir/src/github.com/cassava"
  mkdir -p "$dest"
  mv "$srcdir/$pkgname-$pkgver" "$dest/repoctl"
  cd "$srcdir"
  ln -s "$dest/repoctl" "$pkgname-$pkgver"

}

build() {
  src="$srcdir/src/github.com/cassava/repoctl"
  cd "$src/cmd/repoctl"
  GOPATH="$srcdir" go build
  cd "$src/cmd/repols"
  GOPATH="$srcdir" go build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install repoctl program
  install -d "$pkgdir/usr/bin"
  install -m755 cmd/repoctl/repoctl "$pkgdir/usr/bin/"
  install -m755 cmd/repols/repols "$pkgdir/usr/bin/"

  # Install other documentation
  install -d "$pkgdir/usr/share/doc/repoctl"
  install -m644 README.md NEWS.md "$pkgdir/usr/share/doc/repoctl/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/repoctl/LICENSE"

  # Install completion files
  install -Dm644 contrib/zsh_completion "$pkgdir/usr/share/zsh/site-functions/_repoctl"
}
