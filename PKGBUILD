# Maintainer: Hao Long <aur@esd.cc>

pkgname=naabu-git
pkgver=1.1.0.r6.ga96663f
pkgrel=1
pkgdesc="A fast port scanner written in go with focus on reliability and simplicity"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/naabu"
license=("GPL3")
depends=("libpcap")
makedepends=("dep" "go" "git")
source=("${pkgname}::git+https://github.com/projectdiscovery/naabu.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir/gopath"
  mkdir -p $GOPATH/src/github.com/projectdiscovery/
  cp -r "${srcdir}/${pkgname}" "$GOPATH/src/github.com/projectdiscovery/naabu"
  cd "$GOPATH/src/github.com/projectdiscovery/naabu"
  dep ensure
  cd "$GOPATH/src/github.com/projectdiscovery/naabu/cmd/naabu"
  go build
}

package() {
  export GOPATH="$srcdir/gopath"
  cd "$GOPATH/src/github.com/projectdiscovery/naabu"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 cmd/naabu/naabu ${pkgdir}/usr/bin/naabu
}
