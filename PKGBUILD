# Maintainer: Reza Farrahi M <imriss@yahoo.com>

pkgname=kubernetes-built
pkgnameorg=kubernetes
pkgver=1.8.2
pkgrel=1
pkgrelorg=1
_contribver=0.7.0
_contribdate="2017-10-01"
pkgdesc="Production-Grade Container Scheduling and Management - binary version of aur-kubernetes"
arch=('x86_64')
url="http://kubernetes.io/"
license=("APACHE")
backup=('etc/kubernetes/apiserver'
        'etc/kubernetes/config'
        'etc/kubernetes/controller-manager'
        'etc/kubernetes/kubelet'
        'etc/kubernetes/proxy'
        'etc/kubernetes/scheduler')
provides=('kubernetes')
conflicts=('kubernetes' 'kubernetes-bin' 'minikube-bin' 'minikube' 'kubernetes-kubectl' 'kubernetes-cni-bin' 'kubelet-bin' 'kubectl-bin' 'kubeadm-git' 'kubeadm-bin')
depends=('glibc' 'bash' 'go' 'go-bindata' 'rsync' 'docker' 'ebtables' 'ethtool')
source=("https://versaweb.dl.sourceforge.net/project/aur-kubernetes-built/kubernetes-$pkgver-$pkgrelorg-x86_64.pkg.tar.xz"
#	"https://github.com/kubernetes/contrib/archive/$_contribver.tar.gz"
		)
# noextract=("kubernetes-built-$pkgver-$pkgrel-x86_64.pkg.tar.xz")
sha256sums=('426a8e429b7784c8485ebb7b9c3d7dae96b81719a536930b9b32ea74abfb72a7'
#	'f04c0a90c20af6c7f4e448f2405938ea5c821b33d0f977d58598adc1e189bcda'
)
md5sums=('eac42ed80b7c547af13b295cb23976ea'
#	'bcbca37b78cf18848976593b97580037'
)

prepare() {
    cd $srcdir
    git clone https://github.com/kubernetes/contrib contrib-$_contribdate
    cd $srcdir/contrib-$_contribdate
    git reset --hard $(git rev-list -1 $(git rev-parse --until=$_contribdate) master)
}

package() {
    [ "$CARCH" = 'x86_64' ] && _kubearch=amd64

    binaries=(apiextensions-apiserver cloud-controller-manager kube-proxy kube-apiserver kube-controller-manager kubelet kubeadm kubemark hyperkube kube-aggregator kube-scheduler kubectl kubefed kubemark gke-certificates-controller)
    for bin in "${binaries[@]}"; do
        install -Dm755 $srcdir/usr/bin/$bin $pkgdir/usr/bin/$bin
    done

    # install manpages
    install -d $pkgdir/usr/share/man/man1/
    install -pm 644 $srcdir/usr/share/man/man1/* $pkgdir/usr/share/man/man1

    # install the place the kubelet defaults to put volumes
    install -d $pkgdir/var/lib/kubelet

    cd $srcdir/contrib-$_contribdate
 
    # install config files
    install -dm 755 $pkgdir/etc/kubernetes/
    install -m 644 -t $pkgdir/etc/kubernetes/ init/systemd/environ/*

    # install service files
    install -dm 755 $pkgdir/usr/lib/systemd/system
    install -m 644 -t $pkgdir/usr/lib/systemd/system init/systemd/*.service

    install -dm 755 $pkgdir/usr/lib/tmpfiles.d
    install -m 644 -t $pkgdir/usr/lib/tmpfiles.d init/systemd/tmpfiles.d/*.conf
}

