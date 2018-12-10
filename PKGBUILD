# Maintainer: Mikkel Oscar Lyderik Larsen <m@moscar.net>

pkgname=kubernetes-bin
pkgver=1.13.0
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
sha512sums_x86_64=('a8e3d457e5bcc1c09eeb66111e8dd049d6ba048c3c0fa90a61814291afdcde93f1c6dbb07beef090d1d8a9958402ff843e9af23ae9f069c17c0a7c6ce4034686')
sha512sums_armv7l=('4e17494767000256775e4dd33c0a9b2d152bd4b5fba9f343b6dfeb5746ff34e400a8e0aaf2153476453225ef57e4bb1ae3635416ab18f9e4dabf4e5cc82f8aaa')
sha512sums_armv7h=("${sha512sums_armv7l}")
sha512sums_aarch64=('0ddd0cf0ff56cebfa89efb1972cc2bc6916e824c2af56cfd330ac5638c8918eaf3c60d05714b220dbf4f896160eded123beeba42f5be55fe434a43d04508d86a')

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
