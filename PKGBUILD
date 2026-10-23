# Maintainer: Tyrolyean <tyrolyean@semi-professional.net>

pkgname=zas
pkgver=0.0.10
pkgrel=1
pkgdesc='Most simple static site generator ever.'
arch=('any')
url='https://github.com/darccio/zas'
license=('AGPL-3.0-only')
depends=(
  'glibc'
  'gcc-libs'
)
makedepends=(
  'git'
  'go'
  'npm'
  'nodejs'
)
options=('!lto')

source=(
  "https://github.com/darccio/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)

b2sums=('584dc052a6471f42bd2c7336c8c04b99ae1c4176dd31f5d2f051ed3483b201cfae956489a0596eca174b10ce8ce30c74d08393172f4924d901d7c96af12f5ec6')
sha512sum=('08c175a09d1c5ab34d1e7c1cd6542c50292a406a647bdb81094b7ec193016a8e88f790f31b42058a588e554fd88c2cae7af850ff6edb4e965df08c8df6b595ea')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir -p build

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags '${LDFLAGS}'" \
    -o build \
    ./cmd/zas
}

package() {
	install -vDm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/build/$pkgname"
}
