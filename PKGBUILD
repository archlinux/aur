# Maintainer: Maksim Novikov <mnovikov.work@gmail.com>
# Contributor: David Roizenman <david@hmnd.io>
# Contributor: Thor K. Høgås <thor at roht no>
# Contributor: Austin Keller

_reponame=todoist
_pkgname=$_reponame-cli
pkgname=${_reponame}-git
pkgver=r326.45738fb
pkgrel=1
pkgdesc="Todoist CLI Client, written in Golang."
arch=('x86_64' 'i686')
url="https://github.com/sachaos/todoist"
license=('MIT')
makedepends=('go' 'git')
optdepends=('peco: for zsh functions script')
options=('!strip' '!emptydirs')
source=('git+https://github.com/sachaos/todoist.git'
        'rename_todoist_to_todoist_cli.patch' )
sha256sums=('SKIP'
            '2d0f8626b98c6b178d6be15ad03be20a49c18add0cb3ec2a1f06e8e727785564')
provides=('todoist' 'todoist-cli')
conflicts=('todoist' 'todoist-cli')

pkgver() {
  cd "$_reponame"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
 mkdir -p "$srcdir/go/src/github.com/sachaos"
 ln -sf "$srcdir/$_reponame" "$srcdir/go/src/github.com/sachaos/$_reponame"
 patch --directory="$_reponame" --forward --strip=1 --input="${srcdir}/rename_todoist_to_todoist_cli.patch"
}

build() {
 export GOPATH="$srcdir/go"
 export PATH="$PATH:$srcdir/go/bin/"
 export GO111MODULE="on"
 cd "$srcdir/go/src/github.com/sachaos/todoist"
 make install
 chmod u+w -R "$GOPATH"
}

package() {
  install -Dm755 "$srcdir/go/bin/$_reponame" "$pkgdir/usr/bin/$_pkgname"
  cd "$srcdir/go/src/github.com/sachaos/$_reponame"
  install -Dm644 todoist_functions.sh "${pkgdir}/usr/share/$_pkgname/todoist_functions.sh"
  install -Dm644 todoist_functions_fzf.sh "${pkgdir}/usr/share/$_pkgname/todoist_functions_fzf.sh"
  install -Dm644 todoist_functions_fzf_bash.sh "${pkgdir}/usr/share/$_pkgname/todoist_functions_fzf_bash.sh"
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
  install -m 0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/"
}
