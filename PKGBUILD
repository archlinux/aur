# Maintainer: Tobias Martin <tm-x at gmx dot net>

_pkgname=kubeadm
pkgname=kubeadm-git
pkgver=r39510.124fb61
pkgrel=1
pkgdesc="Tool to create a secure Kubernetes cluster"
arch=('i686' 'x86_64')
url="http://kubernetes.io/docs/getting-started-guides/kubeadm/"
license=('Apache')
install=kubeadm.install
conflicts=('kubernetes')
depends=('glibc' 'bash' 'ebtables' 'ethtool' 'iptables' 'socat' 'docker' 'cni-git')
makedepends=('git' 'go' 'rsync' 'go-bindata-git')
source=("git+https://github.com/kubernetes/kubernetes.git#branch=master"
        "git+https://github.com/kubernetes/release.git#branch=master"
        "kubeadm.install")
sha256sums=('SKIP'
            'SKIP'
            '52fb94c650014b4ca1aed2e3b5c3695d4e98b3d15cbe2637b51e3c52259320fb')

pkgver() {
  cd "${srcdir}/kubernetes"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/kubernetes"
  make WHAT="cmd/kubelet cmd/kubectl cmd/kubeadm"
}

package() {
  cd "${srcdir}/kubernetes"
  mkdir -p "${pkgdir}"/usr/bin
  [[ $CARCH == 'i686' ]] && install -Dm755 _output/local/bin/linux/386/{kubelet,kubectl,kubeadm} ${pkgdir}/usr/bin/
  [[ $CARCH == 'x86_64' ]] && install -Dm755 _output/local/bin/linux/amd64/{kubelet,kubectl,kubeadm} ${pkgdir}/usr/bin/

  # install the place the kubelet defaults to put volumes
  install -d ${pkgdir}/var/lib/kubelet

  cd ${srcdir}/release

  # install config files
  install -dm 755 ${pkgdir}/etc/systemd/system/kubelet.service.d/
  install -m 644 -t ${pkgdir}/etc/systemd/system/kubelet.service.d/ rpm/10-kubeadm.conf

  # install service file
  install -dm 755 ${pkgdir}/usr/lib/systemd/system
  install -m 644 -t ${pkgdir}/usr/lib/systemd/system rpm/kubelet.service

}

# vim:set ts=2 sw=2 et:
