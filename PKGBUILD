# Maintainer: GeorgeRaven <GeorgeRavenCommunity at pm dot me>
# Contributor: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=cni-plugins-bin
pkgdesc="Container Networking Interface (CNI) Plugins"
pkgver=1.7.0 # renovate: datasource=github-tags depName=containernetworking/plugins
pkgrel=2
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url="https://www.cni.dev/"
license=('Apache')
conflicts=('cni-plugins')
provides=("cni-plugins=${pkgver}")
source=()
b2sums=('b2ba076a9f7bcf3ccde695e4d99f36c0c5868cef0736df7dbd559e0ffb24f58ad0c1dc8d20503d9e5eacb80d8f509b2aa82da0b5ed6f03bdfdf8c89a7d189313')

# if CARCH is not set default to x86_64
# https://stackoverflow.com/a/11362364/11164973
: "${CARCH:=x86_64}"

case "$CARCH" in
  arm*) _pkgarch="arm"
    ;;
  aarch64) _pkgarch="arm64"
    ;;
  x86_64) _pkgarch="amd64"
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
