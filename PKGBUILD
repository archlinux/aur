# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=firewalld-git
pkgver=0.3.14.2.r190.d7d68f8
pkgrel=1
pkgdesc='A firewall daemon with D-BUS interface providing a dynamic firewall'
arch=('any')
url='http://fedorahosted.org/firewalld'
license=('GPL2')
depends=('dbus-glib' 'ebtables' 'ipset' 'iptables' 'python-slip')
makedepends=('docbook-xsl' 'git' 'intltool')
optdepends=('bash-completion: bash completion support'
            'gtk3: firewall-config'
            'libnotify: firewall-applet'
            'libnm-glib: firewall-config and firewall-applet'
            'python-pyqt4: firewall-applet')
backup=('etc/conf.d/firewalld'
        'etc/firewalld/firewalld.conf')
provides=('firewalld')
conflicts=('firewalld')
install='firewalld.install'
source=('git+https://github.com/t-woerner/firewalld.git'
        'firewalld-arch.patch')
sha256sums=('SKIP'
            '0e10b2dd4eb2b3ca436c9539c9cdd5e612c0f150f51f5c7d50743700437a2bee')

pkgver() {
  cd firewalld

  git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./;'
}

prepare() {
  cd firewalld

  patch -Np1 -i ../firewalld-arch.patch
  ./autogen.sh
}

build () {
  cd firewalld

  ./configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --sbindir='/usr/bin' \
    --sysconfdir='/etc' \
    --with-iptables='/usr/bin/iptables' \
    --with-iptables-restore='/usr/bin/iptables-restore' \
    --with-ip6tables='/usr/bin/ip6tables' \
    --with-ip6tables-restore='/usr/bin/ip6tables-restore' \
    --with-ebtables='/usr/bin/ebtables' \
    --with-ebtables-restore='/usr/bin/ebtables-restore' \
    --with-ipset='/usr/bin/ipset' \
    --disable-schemas-compile
  make
}

package() {
  cd firewalld

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
