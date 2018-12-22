#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=kubernetes
pkgver=1.13.1
_contribver=f4ce29dd35b68f538a5845d7e294bbf056d5d215
pkgrel=1
pkgdesc="Production-Grade Container Scheduling and Management"
depends=('glibc' 'bash')
makedepends=('go' 'rsync' 'go-bindata')
optdepends=('etcd: etcd cluster required to run Kubernetes')
arch=('x86_64' 'i686')
source=("$pkgname-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-src.tar.gz"
        "https://github.com/kubernetes/contrib/archive/$_contribver.tar.gz"
        "kubernetes.install")
noextract=("$pkgname-$pkgver.tar.gz")
url="http://kubernetes.io/"
license=("APACHE")
backup=('etc/kubernetes/apiserver'
        'etc/kubernetes/config'
        'etc/kubernetes/controller-manager'
        'etc/kubernetes/kubelet'
        'etc/kubernetes/proxy'
        'etc/kubernetes/scheduler')
install=kubernetes.install
sha256sums=('70a088fcf60a46e2b470d3e7a673447f6cfc62b3d9fab4b1d0eb82ede8e5ed03'
            '4bd2a2f4fc2a17b78dd53a8f7312760b4028d600d14006a3cdf5768b28b44b27'
            'fb6fce3ef4b793863286dafb5856ce28027427005d6c6fd44162844921ab714b')

prepare() {
    mkdir -p $srcdir/$pkgname-$pkgver
    tar -xf $srcdir/$pkgname-$pkgver.tar.gz -C $srcdir/$pkgname-$pkgver
}

build() {
    cd $srcdir/$pkgname-$pkgver
    
    make -j1
    hack/generate-docs.sh
}

package() {
    cd $srcdir/$pkgname-$pkgver

    [ "$CARCH" = 'i686' ] && _kubearch=386
    [ "$CARCH" = 'x86_64' ] && _kubearch=amd64

    binaries=(apiextensions-apiserver cloud-controller-manager kube-proxy kube-apiserver kube-controller-manager kubelet kubeadm kubemark hyperkube kube-scheduler kubectl kubemark)
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
