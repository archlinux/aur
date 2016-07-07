#Maintainer fanningert <thomas at fanninger dot at>

pkgname=glide
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Simplified Go project management, dependency management, and vendoring."
arch=('any')
url="https://github.com/Masterminds/glide"
licence=('MIT')
makedepends=('git' 'go>=1.5')
provides=('glide')
conflicts=('glide-bin' 'glide-git')
options=('!strip' '!emptydirs')

source=("${pkgname}::https://github.com/Masterminds/glide/archive/v${pkgver}.tar.gz")
sha512sums=(6c2bbd7bcf14264c05092edcc7d4ac7bb159392bf29a4ca08bc77602315e88abd600628d8ebd3b824da10b4a6de65af2db685a3d2947caa3c0e8121ecf06b72d)

_gourl=github.com/Masterminds
_goroot="/usr/lib/go"

prepare() {
  export GOROOT=/usr/lib/go
  
  msg2 "Prepare GO build enviroment"
  rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  rm pkg
  mkdir pkg
  cd pkg

  for f in "$GOROOT/pkg/"*; do
    ln -s "$f"
  done

  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"
  
  mkdir -p "$GOPATH/src/$_gourl"

  mv "$srcdir/$pkgname-${pkgver}" $GOPATH/src/${_gourl}/${pkgname}
}

build() {
  cd $GOPATH/src/${_gourl}/${pkgname}

  msg2 "Build program"
  go fix
  go build -o glide -ldflags "-X main.version=${pkgver}" glide.go
}

package() {
    install -Dm0755 "$srcdir/build/src/${_gourl}/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"    
    install -Dm0644 "$srcdir/build/src/${_gourl}/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}