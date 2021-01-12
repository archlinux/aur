pkgname="fathom-git"
pkgrel=1
pkgver=v1.2.1.r55.g69baac5
pkgdesc="Fathom Lite. Simple, privacy-focused website analytics."
url="https://github.com/usefathom/fathom"
license=("MIT")
arch=("any")
provides=("fathom")
conflicts=("fathom")
makedepends=("go" "npm" "git")
source=("git+https://github.com/usefathom/fathom.git")
md5sums=("SKIP")
_gitname="fathom"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build(){
  cd "$srcdir"

  rm -rf gopath
  mkdir -p "gopath/src/github.com/usefathom"
  mv "$_gitname" "gopath/src/github.com/usefathom/"

  cd "gopath/src/github.com/usefathom/fathom"
  export GOPATH="$srcdir"/gopath/
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  pwd
  make GOFLAGS="-buildmode=pie" build
}

package(){
  cd "$srcdir"/gopath/src/github.com/usefathom/fathom
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/fathom/LICENSE 
  install -Dm755 fathom "$pkgdir"/usr/bin/fathom
}
