# Maintainer: Pedro H Lara Campos <root@pedrohlc.com>
# Contributor: Mark Wagie <mark.wagie@tutanota.com>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Ben Morgan <neembi@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
_pkgname=repoctl
pkgname="${_pkgname}-devel-git"
pkgdesc="A supplement to repo-add and repo-remove which simplifies managing local repositories (devel branch from git)"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go-pie' 'git')
options=()
source=("${_pkgname}::git+https://github.com/cassava/repoctl.git#branch=devel")
md5sums=('SKIP')
provides=('repoctl')
conflicts=('repoctl' 'repoctl-git')

pkgver=0.18.r16.g717a4e1
pkgrel=1
pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/^v//; s/-/.r/; s/-/./g'
}

prepare() {
  dest="$srcdir/src/github.com/cassava"
  mkdir -p "$dest"
	ln -rTsf "$srcdir/${_pkgname}" "$dest/repoctl"
}

build() {
  src="$srcdir/src/github.com/cassava/repoctl"
  cd "$src/cmd/repoctl"
  GOPATH="$srcdir" go build -trimpath -ldflags "-extldflags ${LDFLAGS}" .
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
