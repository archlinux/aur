# Maintainer: David Birks <david@birks.dev>

pkgname=vibecoder-git
pkgver=r1123.f0d2be6
pkgrel=1
pkgdesc='AI-orchestrated coding agent colony'
arch=('x86_64')
url='https://github.com/steveyegge/vc'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
conflicts=(
  'vc'
  'vercel'
)
options=('!debug')
source=("git+https://github.com/steveyegge/vc.git")
b2sums=('SKIP')

pkgver() {
  cd vc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd vc
  mkdir -p build/
}

build() {
  cd vc

  # Config from https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build -ldflags "-X main.Version=$pkgver" ./cmd/...
}

package() {
  cd vc

  # Install binary as 'vc'
  install -Dm755 build/vc "$pkgdir"/usr/bin/vc
}
