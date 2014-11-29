# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Arto Puranen <purcher@gmail.com>

pkgname=arno-iptables-firewall
pkgver=2.0.1e
pkgrel=1
pkgdesc="A secure stateful firewall for both single and multi-homed machine"
arch=('any')
url=(http://rocky.eld.leidenuniv.nl/joomla/)
license=('GPL')
depends=('iptables' 'iproute2')
makedepends=('patch')
backup=(etc/${pkgname}/firewall.conf
        etc/${pkgname}/custom-rules
        etc/${pkgname}/plugins/dmz-dnat.conf
        etc/${pkgname}/plugins/dsl-ppp-modem.conf
        etc/${pkgname}/plugins/dyndns-host-open.conf
        etc/${pkgname}/plugins/ids-protection.conf
        etc/${pkgname}/plugins/ipsec-vpn.conf
        etc/${pkgname}/plugins/ipv6-over-ipv4.conf
        etc/${pkgname}/plugins/linux-upnp-igd.conf
        etc/${pkgname}/plugins/mac-address-filter.conf
        etc/${pkgname}/plugins/multiroute.conf
        etc/${pkgname}/plugins/sip-voip.conf
        etc/${pkgname}/plugins/ssh-brute-force-protection.conf
        etc/${pkgname}/plugins/traffic-accounting.conf
        etc/${pkgname}/plugins/traffic-shaper.conf
        etc/${pkgname}/plugins/transparent-dnat.conf
        etc/${pkgname}/plugins/transparent-proxy.conf)
source=(http://rocky.eld.leidenuniv.nl/${pkgname}/${pkgname}_${pkgver}.tar.gz
        ${pkgname}.patch ${pkgname}.service)
sha256sums=('fa7b865e5d9b8e077cba73b2f28695a2fd691092a0a7f9e1c16ee369fc27fe43'
            'f1c09af1470354aa8b1a506cd97d1a5c2f95599db896e6dbde7dd506d4c85d1d'
            '8c35a221ae7bb4b8abda923590b8bfab856dcc4d3f85991eebb37314efd1931c')

package() {
  cd "${srcdir}"/${pkgname}_${pkgver}

# patch
  patch -Np0 -i "${srcdir}"/${pkgname}.patch

# conf files
  install -d -m 0755 etc/${pkgname}/plugins/ "${pkgdir}"/etc/${pkgname}/plugins/
  for i in `find etc/${pkgname} -type f`; do install -T -m 0600 $i "${pkgdir}"/$i ;done
  install -D -m 0644 share/${pkgname}/environment "${pkgdir}"/usr/share/${pkgname}/environment

# plugins
  install -d -m 0755 share/${pkgname}/plugins/ "${pkgdir}"/usr/share/${pkgname}/plugins/
  for i in share/${pkgname}/plugins/*plugin; do install -T -m 0644 $i "${pkgdir}"/usr/$i ;done
  install -D -m 0744 share/${pkgname}/plugins/dyndns-host-open-helper \
    "${pkgdir}"/usr/share/${pkgname}/plugins/dyndns-host-open-helper
  install -D -m 0744 share/${pkgname}/plugins/traffic-accounting-helper \
    "${pkgdir}"/usr/share/${pkgname}/plugins/traffic-accounting-helper
  install -D -m 0744 share/${pkgname}/plugins/traffic-accounting-log-rotate \
    "${pkgdir}"/usr/share/${pkgname}/plugins/traffic-accounting-log-rotate
  install -D -m 0744 share/${pkgname}/plugins/traffic-accounting-show \
    "${pkgdir}"/usr/share/${pkgname}/plugins/traffic-accounting-show

# binary
  install -D -m 0744 bin/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -D -m 0744 bin/arno-fwfilter "${pkgdir}"/usr/bin/arno-fwfilter
  install -D -m 0744 contrib/adsl-failover "${pkgdir}"/usr/bin/adsl-failover

# man files
  install -D -m 0644 share/man/man1/arno-fwfilter.1 "${pkgdir}"/usr/share/man/man1/arno-fwfilter.1 
  install -D -m 0644 share/man/man8/${pkgname}.8 "${pkgdir}"/usr/share/man/man8/${pkgname}.8

# systemd script
  install -D -m 0644 "${srcdir}"/${pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
}
