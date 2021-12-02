# Maintainer: Hao Long <imlonghao@archlinuxcn.org>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gitleaks
pkgver=8.0.7
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/zricethezav/gitleaks
arch=('x86_64' 'i686')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b74313fcdd37f98ba4555d1522447decc8092a4535e62ac5f751641d02155f9f0cf197923e5790a80096433b9a14aa9c75198c88e4e4ff8f6de45aa58f8ad7e9')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
  ./gitleaks completion bash --no-descriptions |
    install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
  ./gitleaks completion zsh --no-descriptions |
    install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"
  ./gitleaks completion fish --no-descriptions |
    install -Dm644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
}

# vim:set ts=2 sw=2 et:
