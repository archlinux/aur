# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=git-duet
pkgver=0.3.0+
pkgrel=1
pkgdesc="Support for pairing with git"
arch=('i686' 'x86_64')
url="https://github.com/git-duet/git-duet"
license=('MIT')
depends=('git')
makedepends=('git' 'go')
provides=('git-duet')
source=('git+https://github.com/git-duet/git-duet.git')
md5sums=('SKIP')

build() {
  repodir="$srcdir"/src/github.com/git-duet
  mkdir -p "$repodir"
  mv "$srcdir"/$pkgname "$repodir"
  cd "$repodir"/$pkgname
  GOPATH="$srcdir" go get -v ./...
}

check() {
  GOPATH="$GOPATH${GOPATH+:}$srcdir" go test -v -x github.com/git-duet/git-duet/
}

package() {
  msg 'Installing binaries...'
  for _bin in `find "$srcdir/bin" -mindepth 1 -maxdepth 1 -type f -printf '%f\n'`; do
    install -Dm 755 "$srcdir/bin/$_bin" "$pkgdir/usr/bin/$_bin"
  done
}

