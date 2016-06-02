#Maintainer fanningert <thomas at fanninger dot at>

pkgname=glide
pkgver=0.10.2
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

source=("${pkgname}::https://github.com/Masterminds/glide/archive/${pkgver}.tar.gz")
sha512sums=(5e8ecf20de7ce53236d16e52e98acf46f4611d84b742665009d4aea44efe9ba09344f9fe5a6d3f6d6b67ba168ac0f825f620ea419a24ddd826a3ecd83aeea320)

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
#    mkdir -p $srcdir/src/github.com/Masterminds/
#    ln -s $srcdir/$pkgname $srcdir/src/github.com/Masterminds/glide
#    cd $srcdir/src/github.com/Masterminds/glide
#    make DESTDIR="$pkgdir/" install

    install -Dm0755 "$srcdir/build/src/${_gourl}/$pkgname/$pkgname" "$pkgdir/usr/share/$pkgname/$pkgname"    
    install -Dm0644 "$srcdir/build/src/${_gourl}/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}