# Maintainer: Tyrolyean <tyrolyean@semi-professional.net>

pkgname=zas
pkgver=0.0.8
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

b2sums=('5d7a8e553212d351205d5911476f0c195b3e3c5ed403006770f30011ed414b48eaea0892b4e936844a5509bd6b57edb8e807759709c97867be9709a696f88bf4')
sha512sum=('d4f0bde50005e2809831b78e33d778131abcd15d935c4c015d236c8ba84f40f9b3c73c24330712187f87be120c06b38472931a49bb8263ce0dfa598def93dd9b')

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
