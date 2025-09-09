# Maintainer: Prasanth Baskar <bupdprasanth@gmail.com>, Lakshmanan <lakshmanoni1234@gmail.com>

pkgname=git-donkey
pkgver=v1.0.2
pkgrel=1
pkgdesc="A CLI tool to help you manage your local git branches/repositories."
arch=('x86_64')
url="https://github.com/bupd/git-donkey"
license=('MIT')
depends=('git')
makedepends=('go')
source=("$pkgname::git+https://github.com/bupd/git-donkey.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  # Set Go and CGO build flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Run the Go build with the provided flags
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o "$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname" # Install the binary

  # Move license & Readme
  install -Dm 644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

