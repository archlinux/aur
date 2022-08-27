# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=gitmux
pkgver=0.7.9
pkgrel=2
pkgdesc="Git in your tmux status bar"
arch=('x86_64' 'i686')
url="https://github.com/arl/gitmux"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('tmux')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=("$pkgname-$pkgver.tar.gz::https://github.com/arl/gitmux/archive/v${pkgver}.tar.gz")
sha256sums=('ca59fad183fd3b9e99818201074b58c92d060b58765b1dd73a00ffa9fab914ef')
_goname="github.com/arl/gitmux"


build() {
  rm -rf gopath
  mkdir -p gopath/src/${_goname}
  mv "$srcdir/$pkgname-$pkgver/"* "gopath/src/${_goname}"
  cd "gopath/src/${_goname}"

  # Set proper version
  sed -e "s:^\(var version = \).*:\1\"${pkgver}\":" \
      -i "gitmux.go"

  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -v
}

package() {
  install -Dm755 "$srcdir/gopath/src/${_goname}/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
