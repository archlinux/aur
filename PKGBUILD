# Maintainer: Fancy Zhang <springzfx@gmail.com>
pkgbase=ap
pkgname=ap-git
pkgver=v1.0.r1.gbd42539
pkgrel=1
pkgdesc="simple wireless ap support both ipv4 and ipv6 with nat"
arch=('x86_64')
url="https://github.com/springzfx/ap"
license=('GPL')
depends=('hostapd'  'dnsmasq')
optdepends=('systemd: for service')

source=('ap-git::git+https://github.com/springzfx/ap#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s" "$(git rev-list --count HEAD)"
  )
}

backup=('etc/ap/ap.conf')

package_ap-git(){
    cd "$pkgname"
    install -d ${pkgdir}/usr/lib/systemd/system/ ${pkgdir}/etc/ap/ ${pkgdir}/usr/share/ap/ ${pkgdir}/usr/bin/
    install -m 544 ap.service ${pkgdir}/usr/lib/systemd/system/
    install -m 544 ap.sh ${pkgdir}/usr/bin/ap
    install -m 644 ap.conf ${pkgdir}/etc/ap/
    install -m 544 iptables-add.sh iptables-del.sh dnsmasq-template.sh hostapd-template.sh ${pkgdir}/usr/share/ap/
}
