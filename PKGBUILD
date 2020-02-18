# Maintainer: Adrian Goll <goll at riseup dot net>
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=kubernetes-helm3
pkgver=3.1.0
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/helm/helm"
makedepends=('git' 'glide' 'go')
depends=('socat')
optdepends=(
  'kubectl: check cluster status'
  'kubectl-bin: check cluster status - binary package'
)
conflicts=('kubernetes-helm-bin')
license=('Apache')
source=("git+https://github.com/helm/helm#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
  mkdir -p "$srcdir/src/helm.sh"
  mv -T "$srcdir/helm" "$srcdir/src/helm.sh/helm"
}

build() {
  export GOPATH="$srcdir"
  cd "$GOPATH/src/helm.sh/helm"
  make
}

package() {
  install -Dm755 "$srcdir/src/helm.sh/helm/bin/helm" "$pkgdir/usr/bin/helm3"

  "$pkgdir/usr/bin/helm3" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/helm3"
  "$pkgdir/usr/bin/helm3" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_helm3"
}
