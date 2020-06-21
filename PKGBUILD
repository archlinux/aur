# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname="vopono-git"
pkgver=r35.9f0c334
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
depends=('nftables' 'iptables' 'procps-ng' 'coreutils' 'findutils')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections')
source=("git+https://github.com/jamesmcm/${_pkgname}")
provides=('vopono')
conflicts=('vopono')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}/"
  cp -r configuration/* "${pkgdir}/usr/share/doc/${_pkgname}/"
  chmod -R 644 "${pkgdir}/usr/share/doc/${_pkgname}"
  find "${pkgdir}/usr/share/doc/${_pkgname}" -type d -print0 |xargs -0 chmod 755
}
