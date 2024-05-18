# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.30.1 # renovate: datasource=github-tags depName=kubernetes/kubernetes
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin' 'conntrack-tools' 'iptables' 'iproute2' 'util-linux' 'crictl')
conflicts=('kubeadm')
provides=('kubeadm')
source=(
  "10-kubeadm.conf"
)
b2sums=('074744d327227c32661befcff7651209438090fbd75890ad3b5a32ada1fbdf8901dbd132c7093ed353901f1ea7505c97089a5a89a104f57cb7f53a342eecc7e8'
        'aaddb5eb9395f6c977fd99ef1aed9a477535d7e55c5fe6b037f88784ee9a8a108fd9a41c4b511bb3c34860c355f88d2651575db27f210dfedbf0fb9cc9dfcfd0')

# if CARCH is not set default to x86_64
# https://stackoverflow.com/a/11362364/11164973
: "${CARCH:=x86_64}"

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    ;;
  arm*) _pkgarch="arm"
    ;;
  aarch64) _pkgarch="arm64"
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}
