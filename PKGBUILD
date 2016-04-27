# Maintainer: Florian Klink <flokli@flokli.de>

pkgbase=bird-babel-git
pkgname=('bird-babel-git' 'bird6-babel-git')
pkgver=1.5.0
pkgrel=2
arch=('i686' 'x86_64')
url='http://bird.network.cz/'
license=('GPL2')
depends=('readline' 'ncurses')
conflicts=('bird' 'bird6')
source=("git+https://gitlab.labs.nic.cz/labs/bird.git"
        'bird.service'
        'bird6.service'
        '0001-Teach-bvsnprintf-to-print-64-bit-router-IDs.patch'
        '0002-Add-the-Babel-routing-protocol-RFC6126.patch')
md5sums=('SKIP'
         '69221e063a3f07dcad519d5eeacaae75' 
         '5b172bd052b523efd95ee018e891e181'
         '4e8d8c8afa581ffe15044772c3ade0ab'
         '6cae1325e149d490456515c7e32f20b8')
_gitname=bird

build() {
  cd $_gitname
  autoconf

  patch -p1 < $srcdir/0001-Teach-bvsnprintf-to-print-64-bit-router-IDs.patch
  patch -p1 < $srcdir/0002-Add-the-Babel-protocol.patch

  [[ -e _build4 ]] && rm -rf _build4
  [[ -e _build6 ]] && rm -rf _build6
  mkdir _build4 _build6

  # build ipv4 bird
  cd _build4
  ../configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --docdir=/usr/share/doc/$pkgname
  make

  # build ipv6 bird
  cd ../_build6
  ../configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --docdir=/usr/share/doc/$pkgname \
    --enable-ipv6 \
    --with-protocols="babel bfd bgp ospf pipe radv rip static"
  make
}

package_bird-babel-git () {
  pkgdesc='RIP, OSPFv2 and BGP daemon (ipv4 version)'
  backup=('etc/bird.conf')

  cd $_gitname/_build4
  make \
    prefix="$pkgdir/usr" \
    sysconfdir="$pkgdir/etc" \
    sbindir="$pkgdir/usr/bin" \
    localstatedir="$pkgdir/var" \
    docdir="$pkgdir/usr/share/doc/$pkgname" \
    install
  #make docdir="$pkgdir/usr/share/doc/$pkgname" install-docs

  # no /var inside pkg
  rm -r "$pkgdir/var"

  # systemd
  install -D -m 644 "$srcdir/bird.service" "$pkgdir/usr/lib/systemd/system/bird.service"
}

package_bird6-babel-git () {
  pkgdesc='RIP, OSPFv3, RADV and BGP daemon (ipv6 version)'
  backup=('etc/bird6.conf')

  cd $_gitname/_build6
  make \
    prefix="$pkgdir/usr" \
    sysconfdir="$pkgdir/etc" \
    sbindir="$pkgdir/usr/bin" \
    localstatedir="$pkgdir/var" \
    docdir="$pkgdir/usr/share/doc/$pkgname" \
    install
  #make docdir="$pkgdir/usr/share/doc/$pkgname" install-docs

  # no /var inside pkg
  rm -r "$pkgdir/var"

  # systemd
  install -D -m 644 "$srcdir/bird6.service" "$pkgdir/usr/lib/systemd/system/bird6.service"
}

# vim:set ts=2 sw=2 et:
