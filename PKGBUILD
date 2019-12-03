# Maintainer: Karl Glatz <karl+arch@glatz.biz>

_pkgname=git-subtrac
_gopkgname=github.com/apenwarr/git-subtrac
pkgname=$_pkgname-git
pkgver=r31.81d0162
pkgrel=1
pkgdesc="Keep the content for your git submodules all in one place: the parent repo."
arch=('x86_64' 'i686')
url="https://github.com/apenwarr/git-subtrac"
license=('APACHE')
makedepends=('go' 'git')
depends=()
options=('!strip' '!emptydirs')
source=("$_pkgname::git+https://github.com/apenwarr/git-subtrac.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  _gopkgpath="$srcdir/gopath/src/github.com/apenwarr/git-subtrac" 
  if [[ ! -L "$_gopkgpath" ]]; then
    mkdir -p $(dirname $_gopkgpath)
    ln -s "$srcdir/git-subtrac" "$_gopkgpath"
  fi
}

build() {
  GOPATH="$(pwd)/gopath" go get -v -d "$_gopkgname"
  GOPATH="$(pwd)/gopath" go build -o "$srcdir/build/$_pkgname" "$_gopkgname"
}

package() {
  install -Dm755 "$srcdir/build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
