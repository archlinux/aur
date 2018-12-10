# Maintainer: Mikkel Oscar Lyderik Larsen <m@moscar.net>

pkgname=kubernetes-bin
pkgver=1.12.3
_contribver=0.7.0
pkgrel=5
pkgdesc="Production-Grade Container Scheduling and Management - binary version."
optdepends=('etcd: etcd cluster required to run Kubernetes')
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
source=("https://github.com/kubernetes/kubernetes/archive/v$pkgver.tar.gz"
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
sha512sums=('6c4ef50240626f97246ed71229463e3649f42674d64bca3a8171728f67807cd0509da9156f53d0e7a8d4967e081cff0f03e0e1469ce5c81313eff67201d49b72'
            '51ab778583bd3d33a89d6fdfd17231ec8e1fe5983c043c21c03421d71403b8e76b52d86b05b05651ab8da1bdb5b47b8aa85f275badefe82344bac15b9d86cde6'
            '19d70634252932e7835bb5db4af75c530fe843386ca688267caca0fb3b4fb1ad7019025ea9d59926ceac8817580e9dfad9396c327f2da955146a302f22b2d5ce')
sha512sums_x86_64=('13363365457ff7527f92c4d371b6dedc6e77553f596e694bb8479511fded9ab8694ae4540752268f82acbc3485606bd07042e3677da45156c850cc9e75bbd2a1')
sha512sums_armv7l=('b73846110f47fb5bbb9861bc4bd9bfc12be1e1d2306426044e0b08e288d3f512ed1c4bec0e8e3d2d009cf92f94b5c0642d663d7d70055e47d2d1b1710674bbcf')
sha512sums_armv7h=('b73846110f47fb5bbb9861bc4bd9bfc12be1e1d2306426044e0b08e288d3f512ed1c4bec0e8e3d2d009cf92f94b5c0642d663d7d70055e47d2d1b1710674bbcf')
sha512sums_aarch64=('88ce03ba915a05f64ba56b5e1fc8feb02c1dc9b2c5244e794c7bde7d32ccf55933337298680c9d57c8f481910dc6e052fe340a241374a2989c1db8e503227210')

package() {
    cd $srcdir/kubernetes-$pkgver

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
