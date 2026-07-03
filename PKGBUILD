# Maintainer: derivativeoflog7 <derivativeoflog7+aur at outlook dot com>

pkgname=udpfsd-git
pkgver=r34.c738682
pkgrel=2
pkgdesc="A UDPFS server written in Go"
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'armv7' 'armv7h' 'mispeb' 'mipsel' 'riscv64')
url="https://github.com/pcm720/udpfsd"
license=('BSD-3-Clause')
depends=('glibc' 'libchdr')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname%-git}"

  # Extract command that generates version from Makefile
  export cmd=$(grep -m 1 VERSION Makefile | sed 's/^.*:= \$(shell \(.*\))/\1/g')
  # Run it to get version
  export VERSION=$(eval "$cmd")
  # Extract ldflags from Makefile
  export _LDFLAGS=$(grep -m 1 LDFLAGS Makefile | sed 's/^.*:= -ldflags "\(.*\)"/\1/g')
  # Replace version variable placeholder with version obtained above
  export _LDFLAGS="${_LDFLAGS//\$(VERSION)/$VERSION}"

  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_ENABLED=1

  go build -ldflags "${_LDFLAGS} -linkmode external -extldflags \"${LDFLAGS}\"" -o bin/udpfsd ./cmd/udpfsd
}

package() {
  cd "${pkgname%-git}"

  install -Dm755 bin/udpfsd -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
