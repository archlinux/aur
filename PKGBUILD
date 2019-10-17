# Maintainer: Lars Rustand

pkgname=kubernetes-bin
pkgver=1.16.2
_contribver=0.7.0
pkgrel=0
pkgdesc="Production-Grade Container Scheduling and Management - binary version."
optdepends=('etcd: etcd cluster required to run Kubernetes')
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
source=("v$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes.tar.gz"
    "https://github.com/kubernetes/contrib/archive/$_contribver.tar.gz"
    "kubernetes.install")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-server-linux-amd64.tar.gz")
source_armv7l=("$pkgname-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-server-linux-arm.tar.gz")
source_armv7h=("$pkgname-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-server-linux-arm.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-server-linux-arm64.tar.gz")
url="https://kubernetes.io/"
license=("APACHE")
backup=('etc/kubernetes/apiserver'
        'etc/kubernetes/config'
        'etc/kubernetes/controller-manager'
        'etc/kubernetes/kubelet'
        'etc/kubernetes/proxy'
        'etc/kubernetes/scheduler')
provides=('kubernetes'
          'kubelet'
	  'kubeadm'
	  'kubectl'
	  'kube-proxy'
	  'kube-apiserver'
	  'kube-controller-manager'
	  'hyperkube'
	  'kube-scheduler')
conflicts=('kubernetes' 'kubeadm-git' 'kubectl' 'kubectl-bin' 'kubeadm-bin' 'kubelet-bin' )
install=kubernetes.install
sha512sums=('9e21ab6317fe209dabac72444273b493f5f7639f73c489cc233da3a0205a93f8779964fe2cf2237bb6ca7535560c7c8ac48e25e75a1fbe97dc5b51f248ed7eeb'
            '51ab778583bd3d33a89d6fdfd17231ec8e1fe5983c043c21c03421d71403b8e76b52d86b05b05651ab8da1bdb5b47b8aa85f275badefe82344bac15b9d86cde6'
            '19d70634252932e7835bb5db4af75c530fe843386ca688267caca0fb3b4fb1ad7019025ea9d59926ceac8817580e9dfad9396c327f2da955146a302f22b2d5ce')
sha512sums_x86_64=('4aa3da6d146db878f4605ea6334925e925268808856f482ea7f9d131dce76ee30d4ba077a6b35de34a68d8d9ca005cccd2e7e4866b775c1f7eaba1320a1b8ec5')
sha512sums_armv7l=('0a9cea07a1172038d300277f1d305d99b147ae5949df3dd63856944cc0e4724105a0d79bf9ea39dface923d794b71e9f40d4104218167e56096a9e82a422864a')
sha512sums_armv7h=("${sha512sums_armv7l}")
sha512sums_aarch64=('b1aadb87ff310aec7292df5386613c4c0036c0e3c20e0a4ab7bd3d5eea8fff0116c8b8b47289e894950b249be4207daac58449ec9a587353873890b47217ecd8')

package() {
    cd $srcdir/kubernetes

    binaries=(
        kube-proxy
        kube-apiserver
        kube-controller-manager
        kubelet
        kubeadm
        hyperkube
        kube-scheduler
        kubectl
    )
    for bin in "${binaries[@]}"; do
        install -Dm755 $srcdir/kubernetes/server/bin/$bin $pkgdir/usr/bin/$bin
    done

    # install the place the kubelet defaults to put volumes
    install -d $pkgdir/var/lib/kubelet

    cd $srcdir/contrib-$_contribver

    # install config files
    install -dm 755 $pkgdir/etc/kubernetes/
    install -m 644 -t $pkgdir/etc/kubernetes/ init/systemd/environ/*

    # install service files
    install -dm 755 $pkgdir/usr/lib/systemd/system
    install -m 644 -t $pkgdir/usr/lib/systemd/system init/systemd/*.service

    install -dm 755 $pkgdir/usr/lib/tmpfiles.d
    install -m 644 -t $pkgdir/usr/lib/tmpfiles.d init/systemd/tmpfiles.d/*.conf
}
