# Maintainer: Mikkel Oscar Lyderik Larsen <m@moscar.net>

pkgname=kubernetes-bin
pkgver=1.14.0
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
sha512sums=('0ad264a46f185a9ff4db0393508a9598dab146f438b2cfdc7527592eb422870b8f26ade7ed089359c06741d998fcd730f897eae261f922c1a26d9fdc034d270d'
            '51ab778583bd3d33a89d6fdfd17231ec8e1fe5983c043c21c03421d71403b8e76b52d86b05b05651ab8da1bdb5b47b8aa85f275badefe82344bac15b9d86cde6'
            '19d70634252932e7835bb5db4af75c530fe843386ca688267caca0fb3b4fb1ad7019025ea9d59926ceac8817580e9dfad9396c327f2da955146a302f22b2d5ce')
sha512sums_x86_64=('25739802a641517a8bbb933b69000a943e8dd38e616b8778149dd0138737abacf377683da2ff35fdd0bbb305b88bc8fc711df20a2585720a43bb674ef36b034f')
sha512sums_armv7l=('c1dbba77a4ff5661eb36c55182a753b88ccc9b89ca31e162b06672126743cfea115b2f8ea8658b12344c36df17958e310c1b8efbdd7800f44f013e1e6f10477d')
sha512sums_armv7h=("${sha512sums_armv7l}")
sha512sums_aarch64=('ad346bbe2a053c1106b51e5125698737dc7b76fa3bf439e14d4b4ba1c262678fede9c507c1098aac6e14d2c742c526c8d257fefa95dd3bbb1dff959e1dc7b9aa')

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
