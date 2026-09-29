# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=axiom
pkgver=0.20.0
pkgrel=2
_commit=459045027ded54fbb8ced82ce8a95b69b8f49265
pkgdesc="Powerful log analytics from the comfort of your command-line"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/axiomhq/cli"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.27.1')
source=("$pkgname-$pkgver-${_commit}.tar.gz::https://github.com/axiomhq/cli/archive/${_commit}.tar.gz")
sha256sums=('4284f926537d8dcc547dc44073f9155f8082b96cfe57eb2781ea375fa04fa44a')

prepare() {
  cd "cli-${_commit}"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "cli-${_commit}"
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
  cd "cli-${_commit}"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  
  go test ./...
}

package() {
  cd "cli-${_commit}"
  
  # 바이너리 및 라이선스 설치
  install -Dm755 build/axiom "$pkgdir/usr/bin/axiom"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # 자동완성 파일 설치
  install -Dm644 build/bash-completion "$pkgdir/usr/share/bash-completion/completions/axiom"
  install -Dm644 build/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_axiom"
  install -Dm644 build/fish-completion "$pkgdir/usr/share/fish/vendor_completions.d/axiom.fish"
}
