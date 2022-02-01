# Maintainer: GeorgeRaven <GeorgeRavenCommunity at pm dot me>
# Contributor: ProFfeSsoRr <evvsoft at gmail dot com>
pkgname=cni-plugins-bin
pkgdesc="Container Networking Interface (CNI) Plugins"
pkgver=1.0.1
pkgrel=2
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url="https://www.cni.dev/"
license=('Apache')
conflicts=('cni-plugins')
provides=("cni-plugins=${pkgver}")
source=()
sha256sums=()

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('d35e3e9fd71687fc7e165f7dc7b1e35654b8012995bbfd937946b0681926d62d')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('2d4528c45bdd0a8875f849a75082bc4eafe95cb61f9bcc10a6db38a031f67226')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('5238fbb2767cbf6aae736ad97a7aa29167525dcd405196dfbc064672a730d3cf')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-${_pkgarch}-v${pkgver}.tgz")

package() {
  cd "${srcdir}"
  # get rid of unwanted link
  unlink "${pkgname}-${pkgver}"
  # install to default location
  mkdir -p "${pkgdir}/opt/cni/bin" "${pkgdir}/usr/lib/cni"
  install -Dm755 "${srcdir}/"* "${pkgdir}/opt/cni/bin/."
  # also deposit bins in alternate possible location
  install -Dm755 "${srcdir}/"* "${pkgdir}/usr/lib/cni"
  # please ensure kubelet args point to one of these two directories preferably the first
  # I.E the file `/etc/kubernetes/kubelet.env` should contain something like: KUBELET_ARGS=--cni-bin-dir=/opt/cni/bin
}
