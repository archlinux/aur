# Maintainer: Reza Farrahi M <imriss@yahoo.com>

pkgname=kubernetes-built
pkgver=1.8.0
pkgrel=1
pkgdesc="Production-Grade Container Scheduling and Management - binary version of aur-kubernetes"
arch=('any')
url="http://kubernetes.io/"
license=("APACHE")
backup=('etc/kubernetes/apiserver'
        'etc/kubernetes/config'
        'etc/kubernetes/controller-manager'
        'etc/kubernetes/kubelet'
        'etc/kubernetes/proxy'
        'etc/kubernetes/scheduler')
provides=('kubernetes')
conflicts=('kubernetes' 'kubernetes-bin')
depends=('go' 'go-bindata' 'docker' 'ebtables' 'ethtool')
source=("https://versaweb.dl.sourceforge.net/project/aur-kubernetes-built/kubernetes-$pkgver-$pkgrel-x86_64.pkg.tar.xz"
		)
sha256sums=('5409e19ce8d461e4d27253320f1b00be361a80f50ddcb7e424f4f5eb3bb566a0')
md5sums=('8482913f2937d9925763c09f206ff1e3')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
}

package() {
    [ "$CARCH" = 'i686' ] && _kubearch=386
    [ "$CARCH" = 'x86_64' ] && _kubearch=amd64

    binaries=(apiextensions-apiserver cloud-controller-manager kube-proxy kube-apiserver kube-controller-manager kubelet kubeadm kubemark hyperkube kube-aggregator kube-scheduler kubectl kubefed kubemark gke-certificates-controller)
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

