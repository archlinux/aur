# Maintainer: Mikkel Oscar Lyderik Larsen <m@moscar.net>

pkgname=kubernetes-bin
pkgver=1.13.2
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
url="http://kubernetes.io/"
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
sha512sums=('7b6a81c9f1b852b1e889c1b62281569a4b8853c79e5675b0910d941dfa7863c97f244f6d607aae3faf60bccd596dedb9d136b7fffeae199876e780904fd9f31e'
            '51ab778583bd3d33a89d6fdfd17231ec8e1fe5983c043c21c03421d71403b8e76b52d86b05b05651ab8da1bdb5b47b8aa85f275badefe82344bac15b9d86cde6'
            '19d70634252932e7835bb5db4af75c530fe843386ca688267caca0fb3b4fb1ad7019025ea9d59926ceac8817580e9dfad9396c327f2da955146a302f22b2d5ce')
sha512sums_x86_64=('e2d2f02f76578c5a1c04a9a417e9f1dc16abcc28daab688c50554a1bf64bb75dfbf5aae6d6f3e5c4463b214034e0220884727e314fa563f6e2199b9a3e4147a9')
sha512sums_armv7l=('6f4a331fd78157866238dd9b8d986d33bfce6548ae503d0c9f4fb42854b0793df659298f95577103994047d01a6b613140b0eece3ae8c294bb0fe8ace84cdea1')
sha512sums_armv7h=("${sha512sums_armv7l}")
sha512sums_aarch64=('50fc95da2598775029b828f31978f6e2a98eceee890bd575122e7697dc7805f1fb9de060998999f3f9d8bc76f5d534b25f64f9b340c70a58503172ae2818d98a')

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

    # install manpages
    install -d $pkgdir/usr/share/man/man1/
    install -pm 644 docs/man/man1/* $pkgdir/usr/share/man/man1

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
