# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=firewalld-git
pkgver=0.3.14.2.r50.d762bf8
pkgrel=1
pkgdesc='A firewall daemon with D-BUS interface providing a dynamic firewall'
arch=('any')
url='http://fedorahosted.org/firewalld'
license=('GPL2')
depends=('ebtables' 'gtk3' 'iptables' 'libnotify' 'networkmanager' 'python-slip')
makedepends=('docbook-xsl' 'git' 'intltool')
backup=('etc/conf.d/firewalld'
        'etc/firewalld/firewalld.conf')
provides=('firewalld')
conflicts=('firewalld')
install='firewalld.install'
source=('git+https://github.com/t-woerner/firewalld.git'
        'firewalld-arch.patch')
sha256sums=('SKIP'
            '91dbd5c580d3603e77c905880ca99ebddf398cf72f86ad37d0134ff7aa119ced')

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
    --disable-schemas-compile
  make
}

package() {
  cd firewalld

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
