# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=systemd-named-netns-git
_name=systemd-named-netns
pkgver=r74.5aa14e3
pkgrel=1
pkgdesc="Use named netns with systemd services!"
license=('GPL3')
depends=('systemd' 'iproute2')
optdepends=('iptables: for default NAT config' 'dhclient: when using dynamically assigned IP')
makedepends=('git')
provides=('systemd-named-netns')
conflicts=('systemd-named-netns')
arch=('any')
backup=('etc/default/netns' 'etc/default/netns-nat')
url="https://github.com/Jamesits/systemd-named-netns"
source=("${_name}::git+https://github.com/Jamesits/systemd-named-netns.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_name}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
  cd "${_name}"
  install -d "${pkgdir}"/usr/lib/systemd/system "${pkgdir}"/etc/default "${pkgdir}"/usr/bin
  install -Dm644 services/netns@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-bridge@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-mvbr@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-nat@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-tunnel@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 configs/netns "${pkgdir}"/etc/default/
  install -Dm644 configs/netns-nat "${pkgdir}"/etc/default/
  install -Dm755 scripts/chnetns "${pkgdir}"/usr/bin/
  install -Dm755 scripts/netnsinit "${pkgdir}"/usr/bin/
}
