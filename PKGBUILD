# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=axiom
pkgver=0.19.1
pkgrel=2
pkgdesc="Powerful log analytics from the comfort of your command-line"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/axiomhq/cli"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.27.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/axiomhq/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef1fe48083fad4e84f7501f7c908ddf4746b9365484b714604b91a673eead49b')

prepare() {
  cd "cli-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "cli-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  local _build_date
  _build_date=$(date -u -d "@${SOURCE_DATE_EPOCH}" '+%Y-%m-%dT%H:%M:%SZ')
  export GOFLAGS="-buildvcs=false -buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags="-linkmode=external -X github.com/axiomhq/pkg/version.release=${pkgver} -X github.com/axiomhq/pkg/version.revision=v${pkgver} -X github.com/axiomhq/pkg/version.buildDate=${_build_date} -X github.com/axiomhq/pkg/version.buildUser=archlinux" \
    -o build/axiom ./cmd/axiom

  # 쉘 자동완성 스크립트 생성
  ./build/axiom completion bash > build/bash-completion
  ./build/axiom completion zsh > build/zsh-completion
  ./build/axiom completion fish > build/fish-completion
}

check() {
  cd "cli-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  
  go test ./...
}

package() {
  cd "cli-$pkgver"
  
  # 바이너리 및 라이선스 설치
  install -Dm755 build/axiom "$pkgdir/usr/bin/axiom"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # 자동완성 파일 설치
  install -Dm644 build/bash-completion "$pkgdir/usr/share/bash-completion/completions/axiom"
  install -Dm644 build/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_axiom"
  install -Dm644 build/fish-completion "$pkgdir/usr/share/fish/vendor_completions.d/axiom.fish"
}
