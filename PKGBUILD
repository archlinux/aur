# Maintainer: Peter Trotman <petertrotman+aur@gmail.com>
# URL: https://github.com/kubernetes/minikube
# Upstream: https://github.com/kubernetes/minikube

pkgname=('minikube-git')
pkgver=v0.25.0.r95.g6bf2661ca
pkgrel=1
pkgdesc='Minikube is a tool that makes it easy to run Kubernetes locally.'
arch=('x86_64')
url='https://github.com/kubernetes/minikube'
license=('apache')
depends=('glibc')
optdepends=(
    'kubectl-bin: to manage the cluster'
    'virtualbox'
    'docker-machine-driver-kvm2'
)
makedepends=('git' 'go' 'make')
provides=('minikube')
conflicts=('minikube')
source=("$pkgname::git+https://github.com/kubernetes/minikube.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export GOPATH="$srcdir"
    rm -rf "$srcdir/src"
    git clone "$srcdir/$pkgname" "$GOPATH/src/k8s.io/minikube"
}

package() {
    export GOPATH="$srcdir"
    cd "$GOPATH/src/k8s.io/minikube"
    make
    install -Dm755 "out/minikube" "$pkgdir/usr/bin/minikube"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
