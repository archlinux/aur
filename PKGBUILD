# Maintainer: Mikkel Oscar Lyderik Larsen <m@moscar.net>

pkgname=kubernetes-bin
pkgver=1.11.1
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
sha256sums=('073b77321812f26df6513c0ad0aef3a8b0c17f6281a186d515f5855ae009ea17'
            'f04c0a90c20af6c7f4e448f2405938ea5c821b33d0f977d58598adc1e189bcda'
            'f120baa4b37323a8d7cd6e8027f7b19a544f528d2cae4028366ffbb28dc68d8a'
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
