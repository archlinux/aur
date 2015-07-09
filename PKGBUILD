#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=kubernetes
pkgver=0.21.1
pkgrel=1
pkgdesc="Container Cluster Manager for Docker"
depends=('glibc')
makedepends=('go' 'rsync')
arch=('x86_64' 'i686')
source=("https://github.com/GoogleCloudPlatform/kubernetes/archive/v$pkgver.tar.gz"
        "kubernetes.install")
url="http://kubernetes.io/"
license="APACHE"
install=kubernetes.install
sha256sums=('546342c84b7a6e75b2d9dc8b1876b6438a7f60fe94125a4cb3a737f940bb26d6'
            'f40b4b14a71f8138de69021e967d993e8b14db2cebe66eee20c7e66839ad1fde')

build() {
    cd $srcdir/kubernetes-$pkgver
    
    ./hack/build-go.sh
}

package() {
    cd $srcdir/kubernetes-$pkgver

    binaries=(kube-apiserver kube-controller-manager kube-scheduler kube-proxy kubelet kubectl kubernetes hyperkube)
    for bin in "${binaries[@]}"; do
        install -Dm755 _output/local/bin/linux/amd64/$bin $pkgdir/usr/bin/$bin
    done
    
    # install the bash completion
    install -dm 0755 $pkgdir/usr/share/bash-completion/completions/
    install -t $pkgdir/usr/share/bash-completion/completions/ contrib/completions/bash/kubectl
    
    # install config files
    install -dm 755 $pkgdir/etc/kubernetes/
    install -m 644 -t $pkgdir/etc/kubernetes/ contrib/init/systemd/environ/*
    
    # install service files
    install -dm 755 $pkgdir/usr/lib/systemd/system
    install -m 644 -t $pkgdir/usr/lib/systemd/system contrib/init/systemd/*.service

    install -dm 755 $pkgdir/usr/lib/tmpfiles.d
    install -m 644 -t $pkgdir/usr/lib/tmpfiles.d contrib/init/systemd/tmpfiles.d/*.conf
    
    # install manpages
    install -d $pkgdir/usr/share/man/man1/
    install -pm 644 docs/man/man1/* $pkgdir/usr/share/man/man1

    # install the place the kubelet defaults to put volumes
    install -d $pkgdir/var/lib/kubelet
}
