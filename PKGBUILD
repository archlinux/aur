# Maintainer: Maksim Novikov <mnovikow.work@gmail.com>
# Contributor: David Roizenman <david@hmnd.io>
# Contributor: Austin Keller

pkgname=todoist
pkgver=0.15.0
pkgrel=2
pkgdesc="Todoist CLI Client, written in Golang."
arch=('x86_64' 'i686')
url="https://github.com/sachaos/todoist"
license=('MIT')
makedepends=('go' 'git')
optdepends=('peco: for zsh functions script')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sachaos/todoist/archive/v$pkgver.tar.gz")
sha256sums=('b7ffa14574bd241ab9e21a28f3d40c17b1a12250e89cfbc8ad708cfbfcdd84b3')

prepare() {
 mkdir -p "$srcdir/go/src/github.com/sachaos"
 ln -sf "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/github.com/sachaos/$pkgname"
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
  install -Dm755 "$srcdir/go/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  cd "$srcdir/go/src/github.com/sachaos/$pkgname"
  install -Dm644 todoist_functions.sh "${pkgdir}/usr/share/todoist/todoist_functions.sh"
  install -Dm644 todoist_functions_fzf.sh "${pkgdir}/usr/share/todoist/todoist_functions_fzf.sh"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
