# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributors: henning mueller <henning@orgizm.net>

pkgname=imvirt-git
_pkgname=${pkgname/-git}
pkgver=0.9.6+28+g1d62521
pkgrel=1
epoch=1
pkgdesc='Detect the virtualization technology of a machine, it is run in'
url='http://micky.ibh.net/~liske/imvirt.html'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('perl' 'dmidecode' 'perl-module-find' 'perl-file-slurp' 'perl-data-dumper')
makedepends=('git')
provides=('imvirt')
conflicts=('imvirt')
options=('!emptydirs')
source=(${pkgname}::git+https://github.com/DE-IBH/imvirt)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed 's|-|+|g'|sed -r 's|v?(.+)|\1|'
}

prepare() {
  cd ${pkgname}
  sed 's|/usr/sbin|/usr/bin|g' -i perl/lib/ImVirt/Utils/dmidecode/pipe.pm
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/${_pkgname} \
    --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
