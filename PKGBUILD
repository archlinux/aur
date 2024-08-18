# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.31.0 # renovate: datasource=github-tags depName=kubernetes/kubernetes
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubelet' 'kubernetes' 'kubernetes-bin')
provides=('kubelet')
source=(
  "kubelet.service"
)
b2sums=('edaa6c5354476c2047d75c0984321aa2fa92dae715c15555b6923fe08a88bfdebc94a7e72bc87c3f187ae98fd9ce1c257b9a7a9e1b6ef36a5faccba1946d4835'
        'ca2cfda0c412f04341be6f22944b4a74f4398fc36f4f6f18485684dd15b26c23fad3851914196f1cc7ab21eca29c011adec973ccc9a6fba1fecc61e042218204')

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

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}
