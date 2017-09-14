#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=kubernetes
pkgver=1.7.6
_contribver=0.7.0
pkgrel=2
pkgdesc="Container Cluster Manager for Docker"
depends=('glibc' 'bash')
makedepends=('go' 'rsync' 'go-bindata')
optdepends=('etcd: etcd cluster required to run Kubernetes')
arch=('x86_64' 'i686')
source=("https://github.com/kubernetes/kubernetes/archive/v$pkgver.tar.gz"
        "https://github.com/kubernetes/contrib/archive/$_contribver.tar.gz"
        "kubernetes.install")
url="http://kubernetes.io/"
license=("APACHE")
backup=('etc/kubernetes/apiserver'
        'etc/kubernetes/config'
        'etc/kubernetes/controller-manager'
        'etc/kubernetes/kubelet'
        'etc/kubernetes/proxy'
        'etc/kubernetes/scheduler')
install=kubernetes.install
sha256sums=('434ef607ba5cb77046066e5ebe2859fb7a1a07657f2b56762f7f16501dc12359'
            '1d4e651ea59ea0d2b440e290fda5e166a21847891abca2907b8a1683c2252b8d'
            'fb6fce3ef4b793863286dafb5856ce28027427005d6c6fd44162844921ab714b')

build() {
    cd $srcdir/kubernetes-$pkgver
    
    make -j1
    hack/generate-docs.sh
}

package() {
    cd $srcdir/kubernetes-$pkgver

    [ "$CARCH" = 'i686' ] && _kubearch=386
    [ "$CARCH" = 'x86_64' ] && _kubearch=amd64

    binaries=(kube-proxy kube-apiserver kube-controller-manager kubelet kubeadm kubemark hyperkube kube-aggregator kube-scheduler kubectl kubefed kubemark gke-certificates-controller)
    for bin in "${binaries[@]}"; do
        install -Dm755 _output/local/bin/linux/$_kubearch/$bin $pkgdir/usr/bin/$bin
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
