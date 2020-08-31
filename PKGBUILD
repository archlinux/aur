# Maintainer: Pedro H Lara Campos <root@pedrohlc.com>
# Contributor: bartus <szczepaniak.bartek+github@gmail.com>
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

pkgver=0.21.r0.g92ed55f
pkgrel=1
pkgver() {
  git -C "$srcdir/${_pkgname}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir"
  go build
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install repoctl program
  install -d "$pkgdir/usr/bin"
  install -m755 repoctl "$pkgdir/usr/bin/"

  # Install other documentation
  install -d "$pkgdir/usr/share/doc/repoctl"
  install -m644 README.md NEWS.md "$pkgdir/usr/share/doc/repoctl/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/repoctl/LICENSE"

  # Generate completion files (spf13/cobra)
  install -d "$pkgdir"/usr/share/{{bash-completion,fish}/completions,zsh/site-functions}
  ./repoctl completion bash > "$pkgdir/usr/share/bash-completion/completions/repoctl"
  ./repoctl completion zsh > "$pkgdir/usr/share/zsh/site-functions/_repoctl"
  ./repoctl completion fish > "$pkgdir/usr/share/fish/completions/repoctl.fish"
}

# vim: set ts=2 sw=2:
