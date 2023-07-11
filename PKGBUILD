# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=actionlint
pkgver=1.6.25
pkgrel=2
pkgdesc="Static checker for GitHub Actions workflow files"
arch=('any')
url="https://github.com/rhysd/actionlint"
license=('MIT')
makedepends=('go' 'git')
optdepends=('python-pyflakes' 'shellcheck')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7592aaddc49146b15a9822e97d90d917a1bd8ca33a4fb71cd98ef8c8c06eb3cf')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-X github.com/rhysd/actionlint.version=$pkgver" -o build ./cmd/${pkgname}
}

check() {
  cd "$pkgname-$pkgver"
  # To run tests for actionlint, `.git` directory is needed.
  # actionlint finds a root of repository by checking the directory.
  mkdir -p .git
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
