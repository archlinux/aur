# Maintainer: Talha Altinel <talhaaltinel@hotmail.com>

pkgname=k3sup
pkgver=0.13.0
pkgrel=1
pkgdesc='A tool to bootstrap K3s over SSH in < 60s'
arch=('x86_64')
url='https://github.com/alexellis/k3sup'
license=('MIT')
depends=('openssh')
makedepends=('git' 'go>=1.20')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexellis/k3sup/archive/${pkgver}.tar.gz")
sha256sums=('24939844ac6de581eb05ef6425c89c32b2d0e22800f1344c19b2164eec846c92')
_commit=('1d2e443ea56a355cc6bd0a14a8f8a2661a72f2e8')

build() {
  cd "$pkgname-$pkgver"

  CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build \
    -ldflags "-s -w -X github.com/alexellis/k3sup/cmd.Version=$pkgver -X github.com/alexellis/k3sup/cmd.GitCommit=$_commit" \
    -o k3sup \
    .

  for shell in bash fish zsh; do
    ./k3sup completion "$shell" > "$shell-completion"
  done
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" k3sup
  install -vDm644 -t "$pkgdir/usr/share/bash-completion/completions/k3sup" bash-completion
  install -vDm644 -t "$pkgdir/usr/share/fish/vendor_completions.d/k3sup.fish" fish-completion
  install -vDm644 -t "$pkgdir/usr/share/zsh/site-functions/_k3sup" zsh-completion
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
