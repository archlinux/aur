# Maintainer: Patrick Drechsler <socialcoding at pdrechsler dot de>

pkgname=mobsh
pkgver=1.2.0
pkgrel=1
pkgdesc="Smooth git handover during remote mob programming"
arch=('x86_64')
url="https://github.com/remotemobprogramming/mob"
license=('MIT')
depends=("git")
optdepends=('espeak-ng-espeak: Multi-lingual software speech synthesizer'
            'mbrola-voices-us1: An American English female voice for the MBROLA synthesizer')
makedepends=('go')
provides=('mobsh')
conflicts=('mobsh' 'mob')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('bfbcb6a865a26b4eb94ebaec4a0a9adeceefe42e2210cf3d8fe6d4267ee46c79')

prepare(){
  cd "mob-$pkgver"
  mkdir -p build/
}

build() {
  cd "mob-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build mob.go
}

check() {
  cd "mob-$pkgver"
  ./create-testbed
  go test
}

package() {
  cd "mob-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 build/mob "$pkgdir"/usr/bin/mob
}
