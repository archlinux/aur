# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: gun1x <gunix@gunix.cloud>

pkgname=kubectl
pkgdesc="Kubernetes.io client binary"
pkgver=1.12.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('Apache')
makedepends=('go')
conflicts=('kubernetes>=1.4.6')
#source=("git+https://github.com/kubernetes/kubernetes#tag=v${pkgver}")
source=("kubernetes-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-src.tar.gz")
sha256sums=('35fc8ba46c75f7f41560bb4b9f969ceecadfaa34924e2ff5808bee3bc497546b')

build() {
  make WHAT=cmd/kubectl 
  hack/generate-docs.sh
}

package() {
  install -Dm755 _output/bin/kubectl -t "$pkgdir/usr/bin"
  install -Dm644 docs/man/man1/* -t "$pkgdir/usr/share/man/man1"

  "$pkgdir/usr/bin/kubectl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kubectl"
  "$pkgdir/usr/bin/kubectl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kubectl"
}
