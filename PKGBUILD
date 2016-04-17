#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=kubernetes
pkgver=1.2.2
_contribver=0.6.0
pkgrel=1
pkgdesc="Container Cluster Manager for Docker"
depends=('glibc' 'bash')
makedepends=('go' 'rsync')
optdepends=('etcd: etcd cluster required to run Kubernetes')
arch=('x86_64' 'i686')
source=("https://github.com/GoogleCloudPlatform/kubernetes/archive/v$pkgver.tar.gz"
	"https://github.com/kubernetes/contrib/archive/$_contribver.tar.gz"
        "kubernetes.install")
url="http://kubernetes.io/"
license=("APACHE")
install=kubernetes.install
sha256sums=('28337012d145a540e840a1da0d0271ca53a6e279c790ccc409a1b82e2f675b54'
            'b73b3a8ea7836104d604d7b1c5ad99293717af8c63d4ff1f2c9debf1dced706c'
            'f40b4b14a71f8138de69021e967d993e8b14db2cebe66eee20c7e66839ad1fde')

build() {
    cd $srcdir/kubernetes-$pkgver
    
    ./hack/build-go.sh
}

package() {
    cd $srcdir/kubernetes-$pkgver

    binaries=(kube-apiserver kube-controller-manager kube-scheduler kube-proxy kubelet kubectl kubemark hyperkube)
    for bin in "${binaries[@]}"; do
        install -Dm755 _output/local/bin/linux/amd64/$bin $pkgdir/usr/bin/$bin
    done
    
    # install the bash completion
    install -dm 0755 $pkgdir/usr/share/bash-completion/completions/
    install -t $pkgdir/usr/share/bash-completion/completions/ contrib/completions/bash/kubectl

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
