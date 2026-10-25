pkgname=pastebox-cli
pkgver=26.10.25
pkgrel=1
pkgdesc="Lightweight command-line client for self-hosted Pastebox servers"
arch=('x86_64' 'aarch64')
url="https://github.com/kmw0410/pastebox-cli"
license=('MIT')
makedepends=('go>=1.26.10')
_tag=v26.10.25
_commit=d866efe
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('2a20f91069a6058227f4c6048941d0a90a350b2462574fba4a5804d4ef9ff9c8')

build() {
  cd "${pkgname}-${_tag#v}"

  CGO_ENABLED=0 go build \
    -buildvcs=false \
    -trimpath \
    -ldflags "-s -w -X main.version=${_tag} -X main.commit=${_commit}" \
    -o pb .

  # Generate from the archived release binary so older tags remain rebuildable.
  ./pb completion bash > pb.bash
  ./pb completion zsh > _pb
  ./pb completion fish > pb.fish
}

check() {
  cd "${pkgname}-${_tag#v}"

  CGO_ENABLED=0 go test -buildvcs=false ./...
}

package() {
  cd "${pkgname}-${_tag#v}"

  install -Dm755 pb "${pkgdir}/usr/bin/pb"
  install -Dm644 pb.bash "${pkgdir}/usr/share/bash-completion/completions/pb"
  install -Dm644 _pb "${pkgdir}/usr/share/zsh/site-functions/_pb"
  install -Dm644 pb.fish "${pkgdir}/usr/share/fish/vendor_completions.d/pb.fish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 package.md "${pkgdir}/usr/share/doc/${pkgname}/package.md"
  install -Dm644 package_ko.md "${pkgdir}/usr/share/doc/${pkgname}/package_ko.md"
}
