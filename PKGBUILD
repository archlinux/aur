# Maintainer: Ben Morgan <neembi@gmail.com>
# vim: set ts=2 sw=2:
pkgname=repoctl
pkgver=0.19
pkgrel=1
pkgdesc="A supplement to repo-add and repo-remove which simplifies managing local repositories"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go' 'xz')
options=('!strip')
source=(https://github.com/cassava/repoctl/releases/download/v${pkgver}/repoctl-${pkgver}.tar.gz)

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
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install repoctl program
  install -d "$pkgdir/usr/bin"
  install -m755 cmd/repoctl/repoctl "$pkgdir/usr/bin/"

  # Install other documentation
  install -d "$pkgdir/usr/share/doc/repoctl"
  install -m644 README.md NEWS.md "$pkgdir/usr/share/doc/repoctl/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/repoctl/LICENSE"

  # Install completion files
  install -Dm644 contrib/repoctl_completion.zsh "$pkgdir/usr/share/zsh/site-functions/_repoctl"
  install -Dm644 contrib/repoctl_completion.bash "$pkgdir/usr/share/bash-completion/completions/repoctl"
}
md5sums=('0e20d6ac89d99b8442a1487143a52c99')
