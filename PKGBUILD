# Maintainer: GeorgeRaven <GeorgeRavenCommunity at pm dot me>
# Contributor: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=cni-plugins-bin
pkgdesc="Container Networking Interface (CNI) Plugins"
pkgver=1.6.0 # renovate: datasource=github-tags depName=containernetworking/plugins
pkgrel=2
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url="https://www.cni.dev/"
license=('Apache')
conflicts=('cni-plugins')
provides=("cni-plugins=${pkgver}")
source=()
b2sums=('19c79b296b7acfc6c4d4fc1f3a855af70533d948b5006cec84ce5dd500047c29af0e9d1f2590c6be1cfabfb88efa68fe941f27131274a43b19e8a66660088515')

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
