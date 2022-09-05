# Maintainer: Hao Long <imlonghao@archlinuxcn.org>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gitleaks
pkgver=8.12.0
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/zricethezav/gitleaks
arch=('x86_64' 'i686')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('fbb1f0d79a2a5bd54634ea79dfe441b4eb83dafc3bfdbf5375a6165e87da1eb5567435f677891abc1d7088e44790b5ecfd2533b0117c2d63403be503094394af')

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
