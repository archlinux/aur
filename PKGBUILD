# Maintainer: jbpratt <jbpratt78 at gmail dot com>

_pkgname=microshift
pkgname=microshift-git
pkgver=4.7.0_0.microshift_2021_08_31_224727
pkgrel=1
pkgdesc="A small form factor OpenShift/Kubernetes optimized for edge computing"
url="https://github.com/redhat-et/microshift"
arch=("x86_64" "aarch64")
provides=("microshift")
conflicts=("microshift")
makedepends=("go" "gcc" "make")
depends=("cri-o" "crictl" "kubectl" "conntrack-tools")
license=("APACHE")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/redhat-et/microshift/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=("ac764e82a80e65a50e6067a3231371bdd5807761fe9bb048116cdc6e62780acd")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}"

  install -Dm755 "microshift" "${pkgdir}/usr/bin/microshift"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # TODO: uncomment on next release
  # install -Dm644 "packaging/systemd/microshift.service" "${pkgdir}/usr/lib/systemd/system/microshift.service"

  # update default cri-o config to match Microshift networking values
  # install -Dm644 "packaging/images/microshift-aio/crio-bridge.conf" "${pkgdir}/etc/cni/net.d/100-crio-bridge.conf"

  # TODO: how can we properly update this file if we don't own it? Remove the above install when you figure it out!
  # sed -i --follow-symlinks 's|10.85.0.0/16|10.42.0.0/24|' "${pkgdir}/etc/cni/net.d/100-crio-bridge.conf"
  # sed -i --follow-symlinks 's/0.3.1/0.4.0/' "${pkgdir}/etc/cni/net.d/100-crio-bridge.conf"
}