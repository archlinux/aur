# Maintainer: Tyrolyean <tyrolyean@semi-professional.net>

pkgname=zas
pkgver=0.0.5
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

sha512sums=('7ba96a4ecba23052430fe8f96fd7245ba7dd23a055cf7eb777388a32d6624dd0846105b8db91e625575329173316ffa355825437d707e0fd207235f6d97e3943')

sha256sums=('f46710b3922be0398a0a59bce1f6114dfe64105ec5c6280d83a9bd7827a5f487')

md5sums=('2eec7409c08f5baa59b95f4550cad742')

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
