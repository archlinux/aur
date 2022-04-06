# Maintainer: GeorgeRaven <GeorgeRavenCommunity at pm dot me>
# Contributor: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=cni-plugins-bin
pkgdesc="Container Networking Interface (CNI) Plugins"
pkgver=1.1.1
pkgrel=2
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url="https://www.cni.dev/"
license=('Apache')
conflicts=('cni-plugins')
provides=("cni-plugins=${pkgver}")
source=()
b2sums=()

case "$CARCH" in
  arm*) _pkgarch="arm"
    b2sums+=('dc72e98e4b527521228d012a60a0bada8fd4aa57fb8688b5d2c3d5e132b5c5b6d942ae88d397dcd36d52cedf1d18603d6865b133923da078dca0d4c3ae4a4114')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('bbe31627c82c1d5b2093c5cee23f3a28de8b6384d1952524c2565e3e1fc3bbe47df7bb10363c73ea11acf32ebfd75aa3a435c0c2ef5b731167c7f2e6c47ad4c2')
    ;;
  x86_64) _pkgarch="amd64"
    b2sums+=('e810719c7f6db63bf0e17ee27cd50b23e3bfcfedc4e889b0bcc5ef146f01a4ccda123a7c16e57d9af951970ecc9604def2968ad8136113e06459da968529b66f')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-${_pkgarch}-v${pkgver}.tgz")

package() {
  cd "${srcdir}"
  # get rid of unwanted link
  unlink "${pkgname}-${pkgver}-${_pkgarch}"
  # install to default location
  mkdir -p "${pkgdir}/opt/cni/bin" "${pkgdir}/usr/lib/cni"
  install -Dm755 "${srcdir}/"* "${pkgdir}/opt/cni/bin/."
  # also deposit bins in alternate possible location
  install -Dm755 "${srcdir}/"* "${pkgdir}/usr/lib/cni"
  # please ensure kubelet args point to one of these two directories preferably the first
  # I.E the file `/etc/kubernetes/kubelet.env` should contain something like: KUBELET_ARGS=--cni-bin-dir=/opt/cni/bin
}
