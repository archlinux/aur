# Maintainer: Edward Pacman <edward@edward-p.xyz>

pkgname=archwrt-ss.sh-git
pkgver=r29.0afbe0a
pkgrel=1
pkgdesc="A simple Shadowsocks transparent proxy setup script by archwrt."
arch=('x86_64')
url="https://github.com/archwrt/archwrt-ss.sh"
license=('GPL')
depends=(shadowsocks-libev dnsmasq ipset iptables)
backup=(opt/archwrt-ss/archwrt-ss.conf etc/archwrt-ss/archwrt-ss.conf)
optdepends=('simple-obfs: shadowsocks-libev plugin'
            'shadowsocks-v2ray-plugin: shadowsocks-libev plugin'
            'dnsproxy-adguard: a tiny dnsproxy with doh & dot support')
makedepends=(git)

source=("${pkgname}::git+https://github.com/archwrt/archwrt-ss.sh.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  # Install dkms.conf
  cd "${pkgname}"
  install -Dm755 archwrt-ss.sh "${pkgdir}/usr/bin/archwrt-ss.sh"
  install -Dm644 archwrt-ss.conf "${pkgdir}/etc/archwrt-ss/archwrt-ss.conf"
  install -Dm644 archwrt-ss.service "${pkgdir}/usr/lib/systemd/system/archwrt-ss.service"
}
