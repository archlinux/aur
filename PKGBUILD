#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgbase=kubernetes
pkgname=(kubelet kubeadm)
pkgver=1.19.3
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io/"
pkgdesc="Production-Grade Container Scheduling and Management"
makedepends=('go-pie' 'rsync')
source=("kubernetes-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-src.tar.gz"
	"kubelet.default"
	"kubelet.service"
	"kubeadm.conf"
	"10-kubeadm.conf"
	"50-kubeadm.conf")
license=("Apache")
sha512sums=('ca92ec0c578ac80cfa58ef169403a08ea0daee14525c79776ba8e3ae349a1fc3d530286d30da7d7d7065916a3aa51f9e89366f2ba6941ca6da539f475120c4b8'
            'bd8bfcb4de9866e1e61beb37d8caae5f553fb406744c62bee226033dde746c11b47a536b1557664fe7cacb0c702234e08561e7460426e25667fe7e1e9b913adc'
            'b9ca0db34fea67dfd0654e65d3898a72997b1360c1e802cab5adc4288199c1a08423f90751757af4a7f1ff5932bfd81d3e215ce9b9d3f4efa1c04a202228adc8'
            'b97703490fb00caf3eb7f670632a897209da344ce3b869f262c855ffe2dae8c11c1b25d5642019d0733c6ac975f451794e49ce27fca3d02611bf1de5f5fa56d6'
            'db6ee01c114d8bfc68eabd27a91b50acd017b82f8d044b08b1fba672846bec6c8c20c775113b8a6d1b81b3bf8b61c2b344856b16f1115e9eea3947e21a6bc378'
            'ed5ba22b37eaa9f4950ff3b57d60dd7866fcd5b8bd5197eab3170470528e8d91379483d3eb724589e695184f9b0ed506ebaee73ecca0dc40afdb5f35e79d178a')

build() {
    make WHAT="cmd/kubelet cmd/kubeadm"

    hack/update-generated-docs.sh
}

package_kubelet() {
    pkgdesc='Kubernetes Node Agent'
    depends=(conntrack-tools ebtables ethtool iptables socat cni-plugins)
    optdepends=('docker: container runtime'
		'containerd: container runtime'
		'cri-o: container runtime')
    backup=('etc/default/kubelet')

    install -Dm755 _output/bin/kubelet -t "$pkgdir/usr/bin"

    install -Dm644 kubelet.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 kubelet.default "$pkgdir/etc/default/kubelet"

    install -Dm644 docs/man/man1/kubelet* -t "${pkgdir}/usr/share/man/man1/"
}

package_kubeadm() {
    pkgdesc='Kubernetes Cluster Bootstrapping Tool'
    depends=(kubelet kubectl crictl)

    install -Dm755 _output/bin/kubeadm -t "$pkgdir/usr/bin"

    install -Dm644 kubeadm.conf -t "$pkgdir/usr/lib/modules-load.d"
    install -Dm644 10-kubeadm.conf -t "$pkgdir/etc/systemd/system/kubelet.service.d"
    install -Dm644 50-kubeadm.conf -t "$pkgdir/etc/sysctl.d"

    "$pkgdir/usr/bin/kubeadm" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kubeadm"
    "$pkgdir/usr/bin/kubeadm" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kubeadm"

    install -Dm644 docs/man/man1/kubeadm* -t "$pkgdir/usr/share/man/man1/"
}
