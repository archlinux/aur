# Maintainer: Mikkel Oscar Lyderik Larsen <m@moscar.net>

pkgname=kubernetes-bin
pkgver=1.7.4
_contribver=0.7.0
pkgrel=1
pkgdesc="Production-Grade Container Scheduling and Management - binary version."
optdepends=('etcd: etcd cluster required to run Kubernetes')
arch=('x86_64' 'i686')
source=("https://github.com/kubernetes/kubernetes/archive/v$pkgver.tar.gz"
        "https://github.com/kubernetes/contrib/archive/$_contribver.tar.gz"
        "https://dl.k8s.io/v$pkgver/kubernetes-server-linux-amd64.tar.gz"
        "kubernetes.install")
url="http://kubernetes.io/"
license=("APACHE")
backup=('etc/kubernetes/apiserver'
        'etc/kubernetes/config'
        'etc/kubernetes/controller-manager'
        'etc/kubernetes/kubelet'
        'etc/kubernetes/proxy'
        'etc/kubernetes/scheduler')
provides=('kubernetes')
conflicts=('kubernetes')
install=kubernetes.install
sha256sums=('a480c54f3108f9a7ff118d90a0a16be52ecd34dcdb786f6c5d287d5298da64f0'
            'ab36d4243baf8cd47aba94f22f4c41a2980cf2ffca51ccda28b1e7685f500282'
            '09c420fdb9b912c172b19638d67b27bc7994e2608185051f412804fa55790076'
            'f40b4b14a71f8138de69021e967d993e8b14db2cebe66eee20c7e66839ad1fde')

package() {
    cd $srcdir/kubernetes-$pkgver

    binaries=(
        kube-proxy
        kube-apiserver
        kube-controller-manager
        kubelet
        kubeadm
        hyperkube
        kube-aggregator
        kube-scheduler
        kubefed
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
