# Maintainer: Pedro H Lara Campos <root@pedrohlc.com>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Ben Morgan <neembi@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
_pkgname=repoctl
pkgname="${_pkgname}-devel-git"
pkgver=0.19
pkgrel=0
pkgdesc="A supplement to repo-add and repo-remove which simplifies managing local repositories (devel branch from git)"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go' 'git')
options=('!strip')
source=("${_pkgname}::git+https://github.com/cassava/repoctl.git#branch=devel")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/^v//; s/-/.r/; s/-/./g'
}

prepare() {
  dest="$srcdir/src/github.com/cassava"
  mkdir -p "$dest"
  mv "$srcdir/$pkgname" "$dest/repoctl"
  cd "$srcdir"
  ln -s "$dest/repoctl" "${_pkgname}"
}

build() {
  src="$srcdir/src/github.com/cassava/repoctl"
  cd "$src/cmd/repoctl"
  GOPATH="$srcdir" go build
}

package() {
  cd "${srcdir}/${_pkgname}"

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

# vim: set ts=2 sw=2: