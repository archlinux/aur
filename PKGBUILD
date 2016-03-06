# Maintainer: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: David Roheim < david dot roheim at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=mock
pkgver=1.2.15
pkgrel=1
pkgdesc='A simple chroot build environment manager for building RPMs'
url='http://fedoraproject.org/wiki/Projects/Mock'
arch=('any')
license=('GPL2')
depends=('python')
optdepends=('createrepo_c: for mockchain command'
            'dnf-plugins-core: to create RPMs for Fedora 23 and above'
            'lvm2: for lvm_root plugin'
            'pigz: for parallel compression of chroot cache'
            'yum-utils: to create RPMs for Fedora 22 and below (including EL5, EL6 and EL7)')
install="${pkgname}.install"
options=('!strip' 'libtool' 'staticlibs')
backup=('etc/mock/site-defaults.cfg')

source=("https://git.fedorahosted.org/cgit/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6e338cb935a6d849c9c6e15e6ff356b453a857ee93b12847ab34462eabb578cd')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --sbindir=/usr/bin

  sed -i "s|@VERSION@|${pkgver}|" docs/${pkgname}{,chain}.1
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vi:set ts=2 sw=2 et:
