# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Ben Morgan <neembi@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=repoctl-git
pkgver=0.16.r0.gc8fd238
pkgrel=1
pkgdesc="A supplement to repo-add and repo-remove which simplifies managing local repositories"
arch=('i686' 'x86_64')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go' 'git')
conflicts=('repoctl')
provides=('repoctl')
source=("$pkgname::git+https://github.com/cassava/repoctl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/^v//; s/-/.r/; s/-/./g'
}

prepare() {
  local dest="$srcdir/src/github.com/cassava"

  mkdir -p "$dest"
  mv "$srcdir/$pkgname" "$dest/repoctl"

  cd "$srcdir"
  ln -s "$dest/repoctl" "$pkgname"
}

build() {
  local src="$srcdir/src/github.com/cassava/repoctl"

  cd "$src/cmd/repoctl"
  GOPATH="$srcdir" go build

  cd "$src/cmd/repols"
  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname"

  # Install repoctl program
  install -Dm755 cmd/repoctl/repoctl -t "$pkgdir/usr/bin/"
  install -Dm755 cmd/repols/repols -t "$pkgdir/usr/bin/"

  # Install other documentation
  install -Dm644 README.md NEWS.md -t "$pkgdir/usr/share/doc/repoctl/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/repoctl/"

  # Install completion files
  install -Dm644 contrib/repoctl_completion.zsh "$pkgdir/usr/share/zsh/site-functions/_repoctl"
  install -Dm644 contrib/repoctl_completion.bash "$pkgdir/usr/share/bash-completion/completions/repoctl"
}
