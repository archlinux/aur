# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Sébastien Luttringer
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=bird2
_pkgname=bird
pkgver=2.17.3
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=('x86_64')
url='https://bird.network.cz/'
license=('GPL-2.0-or-later')
depends=('glibc' 'readline' 'ncurses' 'libssh')
makedepends=('linuxdoc-tools' 'texlive-basic' 'texlive-latex' 'texlive-latexrecommended' 'texlive-latexextra')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=('bird6')
backup=('etc/bird.conf')
options=(!emptydirs)
source=("https://gitlab.nic.cz/labs/bird/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz"
        'bird.service')
sha256sums=('b5f8d652a004f15eb951b586a45938101df88c458bec9c7d5fc7288ba48227bc'
            '4aa1e8d41229badd276aa3747f613e7df34761892add2258c63bdb5097dfeb2b')

prepare() {
  cd $_pkgname-v$pkgver
  sed -i 's|docdir=@prefix@/doc|docdir=@docdir@|g' Makefile.in
  autoreconf -vif
}

build() {
  cd $_pkgname-v$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run/$_pkgname \
    --docdir=/usr/share/doc/$_pkgname
  make
  make docs
}

check() {
  cd $_pkgname-v$pkgver
  make check
}

package() {
  cd $_pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-docs

  # systemd
  install -vD -m 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/bird.service"
}

# vim:set ts=2 sw=2 et:
