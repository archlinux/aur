# Maintainer: GeorgeRaven <GeorgeRavenCommunity at pm dot me>
# Contributor: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=cni-plugins-bin
pkgdesc="Container Networking Interface (CNI) Plugins"
pkgver=1.5.1 # renovate: datasource=github-tags depName=containernetworking/plugins
pkgrel=2
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url="https://www.cni.dev/"
license=('Apache')
conflicts=('cni-plugins')
provides=("cni-plugins=${pkgver}")
source=()
b2sums=('c16747af1eb916e63805afd3b22bb460abc567cb37d60e6a349750e4a49c7379725f9bb74fe7c62f76f255b958448d53812e58d7178618d719e6c9f7833b5944')

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
