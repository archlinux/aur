#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=kubernetes
pkgver=1.5.3
_contribver=0.7.0
pkgrel=1
pkgdesc="Container Cluster Manager for Docker"
depends=('glibc' 'bash')
makedepends=('go' 'rsync' 'go-bindata-git')
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
sha256sums=('bd83212374091e41a24f3cbbd70a36ac7635becac76cfff590b4ded67cb537bc'
            '1d4e651ea59ea0d2b440e290fda5e166a21847891abca2907b8a1683c2252b8d'
            'f40b4b14a71f8138de69021e967d993e8b14db2cebe66eee20c7e66839ad1fde')

build() {
    cd $srcdir/kubernetes-$pkgver
    
    make
}

package() {
    cd $srcdir/kubernetes-$pkgver

    [ "$CARCH" = 'i686' ] && _kubearch=386
    [ "$CARCH" = 'x86_64' ] && _kubearch=amd64

    binaries=(kube-dns kube-proxy kube-apiserver kube-controller-manager kubelet kubeadm kubemark hyperkube kube-scheduler kubectl kube-discovery kubefed)
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
