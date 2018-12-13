# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=minikube
pkgver=0.31.0
pkgrel=1
pkgdesc="Minikube is a tool that makes it easy to run Kubernetes locally"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
optdepends=(
  'kubectl: to manage the cluster'
  'crictl: to use --vm-driver=none'
  'virtualbox: to use --vm-driver=virtualbox'
  'docker-machine-kvm: to use --vm-driver=kvm'
  'docker-machine-driver-kvm2: to use --vm-driver=kvm'
)
makedepends=('git' 'go')
source=("git+https://github.com/kubernetes/minikube.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  rm -rf "$srcdir/src"
  mkdir -p "$srcdir/src/k8s.io"
  mv -T "$srcdir/minikube" "$srcdir/src/k8s.io/minikube"
}

build() {
  export GOPATH="$srcdir"
  cd "$GOPATH/src/k8s.io/minikube"
  make
}

package() {
  install -Dm755 "$srcdir/src/k8s.io/minikube/out/minikube" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/minikube" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/minikube"
  "$pkgdir/usr/bin/minikube" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_minikube"
}
