# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=socanui
pkgver=0.1
pkgrel=1
pkgdesc="SocketCAN User Interface for the Terminal"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/miwagner/socanui"
license=('Apache-2.0')
makedepends=('go>=1.22')
provides=(socanui)
validpgpkeys=(5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23)
source=("git+https://github.com/miwagner/socanui.git#commit=3b772846b4e9b12a7e6b14e1bd73a561e1d205b1")
sha256sums=('41cbbd728f8810757a3aa55464f228845fb1e8f6c7d2ffaf2c02c507417c83f5')

build() {
  cd "socanui"
  local git_tag="$(git rev-parse --short=7 HEAD)"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o socanui \
    main.go
}

package() {
  local bin="$pkgdir/usr/bin/socanui"
  install -D -m755 "$srcdir/socanui/socanui" "$bin"
}

