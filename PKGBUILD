# Maintainer: Maksim Novikov <mnovikow.work@gmail.com>
# Contributor: David Roizenman <david@hmnd.io>
# Contributor: Austin Keller

_pkgname=todoist-cli
pkgname=todoist
pkgver=0.19.0
pkgrel=1
pkgdesc="Todoist CLI Client, written in Golang."
arch=('x86_64' 'i686')
url="https://github.com/sachaos/todoist"
license=('MIT')
makedepends=('go' 'git')
optdepends=('peco: for zsh functions script')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sachaos/todoist/archive/v$pkgver.tar.gz"
        "rename_todoist_to_todoist_cli.patch")
sha256sums=('acf91e168abe7d251a68ae87b1943a1f83ef3b7fd89e4f56bd82cb3db51b6ade'
            '2d0f8626b98c6b178d6be15ad03be20a49c18add0cb3ec2a1f06e8e727785564')

prepare() {
 mkdir -p "$srcdir/go/src/github.com/sachaos"
 ln -sf "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/github.com/sachaos/$pkgname"
 patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/rename_todoist_to_todoist_cli.patch"
}

build() {
 export GOPATH="$srcdir/go"
 export PATH="$PATH:$srcdir/go/bin/"
 export GO111MODULE="on"
 cd "$srcdir/go/src/github.com/sachaos/$pkgname"
 make install
 chmod u+w -R "$GOPATH"
}

package() {
  install -Dm755 "$srcdir/go/bin/$pkgname" "$pkgdir/usr/bin/$_pkgname"
  cd "$srcdir/go/src/github.com/sachaos/$pkgname"
  install -Dm644 todoist_functions.sh "${pkgdir}/usr/share/$_pkgname/todoist_functions.sh"
  install -Dm644 todoist_functions_fzf.sh "${pkgdir}/usr/share/$_pkgname/todoist_functions_fzf.sh"
  install -Dm644 todoist_functions_fzf_bash.sh "${pkgdir}/usr/share/$_pkgname/todoist_functions_fzf_bash.sh"
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
  install -m 0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/"
}
