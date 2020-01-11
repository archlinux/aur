#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgbase=kubernetes
pkgname=(kubelet kubeadm)
pkgver=1.17.0
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io/"
pkgdesc="Production-Grade Container Scheduling and Management"
makedepends=('go-pie' 'rsync')
source=("kubernetes-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-src.tar.gz"
	"kubelet.default")
license=("Apache")
sha512sums=('5424576d7f7936df15243fee0036e7936d2d6224e98ac805ce96cdf7b83a7c5b66dfffc8823d7bc0c17c700fa3c01841208e8cf89be91d237d12e18f3d2f307c'
            'bd8bfcb4de9866e1e61beb37d8caae5f553fb406744c62bee226033dde746c11b47a536b1557664fe7cacb0c702234e08561e7460426e25667fe7e1e9b913adc')

build() {
    make WHAT="cmd/kubelet cmd/kubeadm"
}

package_kubelet() {
    pkgdesc='Kubernetes Node Agent'
    depends=(conntrack-tools ebtables ethtool iptables socat cni-plugins)
    optdepends=('docker: container runtime'
		'containerd: container runtime'
		'cri-o: container runtime')
    backup=('etc/default/kubelet')

    install -Dm755 _output/bin/kubelet -t "$pkgdir/usr/bin"

    install -Dm644 build/debs/kubelet.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 kubelet.default "$pkgdir/etc/default/kubelet"
}

package_kubeadm() {
    pkgdesc='Kubernetes Cluster Bootstrapping Tool'
    depends=(kubelet kubectl crictl)

    install -Dm755 _output/bin/kubeadm -t "$pkgdir/usr/bin"

    install -Dm644 build/debs/kubeadm.conf -t "$pkgdir/usr/lib/modules-load.d"
    install -Dm644 build/debs/10-kubeadm.conf -t "$pkgdir/etc/systemd/system/kubelet.service.d"
    install -Dm644 build/debs/50-kubeadm.conf -t "$pkgdir/etc/sysctl.d"

    "$pkgdir/usr/bin/kubeadm" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kubeadm"
    "$pkgdir/usr/bin/kubeadm" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kubeadm"
}
