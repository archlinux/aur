# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: SolarAquarion <solar@aquarion.arch>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: dorkfish <dork.fish.wat@gmail.com>
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

pkgname=bamf-ubuntu-bzr
pkgver=r655
pkgrel=1
pkgdesc='Application matching framework (development version with Canonical patches)'
arch=('i686' 'x86_64')
url='https://launchpad.net/bamf'
license=('GPL')
depends=('dbus-glib' 'libgtop' 'libwnck3' 'python2-lxml' 'libdbusmenu-gtk3')
makedepends=('bzr' 'gnome-common' 'gobject-introspection' 'gtk-doc' 'vala')
provides=(bamf{,-bzr})
conflicts=(bamf{,-bzr})
source=('bzr+lp:bamf'
        update-bamf-index.hook
        update-bamf-index.pl
        update-bamf-index.sh)
sha256sums=('SKIP'
            '657cfb55f4202f938b11dc55b7674fb2e1accd2a65e6fbab1bd5886c909dd629'
            '8988fead948f7584eaf18de9f73532bbc9804eba9332984a14ccca01466d9903'
            '0599249f3654bb8e458db9b85f7fd53d41450833bc18462b3ccf950575d33265')

pkgver() {
  cd bamf

  echo "r$(bzr revno)"
}

prepare() {
  cd bamf

  sed -i 's|^#!.*python$|#!/usr/bin/python2|' tests/gtester2xunit.py
}

build() {
  cd bamf

  export PYTHON=/usr/bin/python2

  ./autogen.sh \
    --prefix='/usr' \
    --localstatedir='/var' \
    --libexecdir='/usr/lib' \
    --sysconfdir='/etc' \
    --disable-static

  make
}

package() {
  cd bamf

  make DESTDIR="${pkgdir}" install

  install -m755 ../update-bamf-index.pl "${pkgdir}"/usr/lib/bamf/
  install -m755 ../update-bamf-index.sh "${pkgdir}"/usr/lib/bamf/
  install -dm755 "${pkgdir}"/usr/share/libalpm/hooks/
  install -m644 ../update-bamf-index.hook "${pkgdir}"/usr/share/libalpm/hooks/

  rm -rv "${pkgdir}"/usr/share/upstart/
}

# vim: ts=2 sw=2 et:
