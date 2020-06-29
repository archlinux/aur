# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Ben Morgan <neembi@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=repoctl-git
pkgver=0.16.r39.g717a4e1
pkgrel=1
pkgdesc="A supplement to repo-add and repo-remove which simplifies managing local repositories"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go' 'git')
conflicts=('repoctl')
provides=('repoctl')
source=("$pkgname::git+https://github.com/cassava/repoctl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  dest="$srcdir/src/github.com/cassava"
  mkdir -p "$dest"
  mv "$srcdir/$pkgname" "$dest/repoctl"
  cd "$srcdir"
  ln -s "$dest/repoctl" "$pkgname"
}

build() {
  src="$srcdir/src/github.com/cassava/repoctl"
  cd "$src/cmd/repoctl"
  GOPATH="$srcdir" go build
}

package() {
  cd "$srcdir/$pkgname"

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
