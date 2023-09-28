# Maintainer: Talha Altinel <talhaaltinel@hotmail.com>

pkgname=k3sup
pkgver=0.13.1
pkgrel=1
pkgdesc='A tool to bootstrap K3s over SSH in < 60s'
arch=('x86_64')
url='https://github.com/alexellis/k3sup'
license=('MIT')
depends=('glibc' 'openssh')
makedepends=('git' 'go>=1.20')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexellis/k3sup/archive/${pkgver}.tar.gz")
sha256sums=('288299b38868d07490ae02e8d7e92ae2b7a55dddb9896ce95a78819541550701')
_commit=('16f009cd86de432fa78d08fffa1c12faf9d4c896')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-s -w -X github.com/alexellis/k3sup/cmd.Version=$pkgver -X github.com/alexellis/k3sup/cmd.GitCommit=$_commit" \
    -o k3sup \
    .

  for shell in bash fish zsh; do
    ./k3sup completion "$shell" > "$shell-completion"
  done
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 -t "$pkgdir/usr/bin" k3sup

  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 bash-completion "$pkgdir/usr/share/bash-completion/completions/k3sup"
  install -Dm644 fish-completion "$pkgdir/usr/share/fish/vendor_completions.d/k3sup.fish"
  install -Dm644 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_k3sup"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
