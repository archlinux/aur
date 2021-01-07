# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=github-release
_name=github-release
_author=github-release
pkgver=0.10.0
pkgrel=1
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts)"
arch=('i686' 'x86_64')
url="https://github.com/github-release/${pkgname}"
makedepends=('go' 'golang-github-dustin-go-humanize' 'golang-github-voxelbrain-goptions')
depends=('glibc' 'git')
conflicts=("${pkgname}-bin")
license=('MIT')
source=("$_name-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ddd5dbbb9726e80ce821b53e12efe5013688c2f649e369c97f6b3a6ff2dd58cddddbc810e13604aeea7548793660208fcc112ef6622e73dc2368644b4de4c0cd')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/build:/usr/share/gocode"
  mkdir -p "$srcdir/build/src/github.com/$_author"
  cp -a $srcdir/$_name-$pkgver "$srcdir/build/src/github.com/$_author/$_name"
}

build() {
  cd "$srcdir/build/src/github.com/$_author/$_name"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $srcdir/build/
}

package() {
  install -Dm755 $srcdir/build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 $srcdir/$pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
