# Maintainer: mutantmonkey <mutantmonkey@mutantmonkey.in>
pkgname=spice-vdagent
pkgver=0.12.1
pkgrel=2
pkgdesc="Spice agent xorg client that enables copy and paste between client and X-session and more"
arch=('i686' 'x86_64')
url="http://www.spice-space.org/"
license=('GPL')
depends=('libpciaccess' 'libxinerama' 'libxrandr' 'libxfixes' 'spice-protocol')
optdepends=('dex: start spice-vdagent automatically on login')
source=("http://www.spice-space.org/download/releases/$pkgname-$pkgver.tar.bz2"
        'spice-vdagentd.rc.d'
        'spice-vdagentd.conf.d')
sha256sums=('f3288cfcd8ea18cfb1ba665dee20e49a08dd15fb19bd7147a42cf7f8ca1dd5d7'
            'c9f4fc9ebd5dcd4e31d0e54d9794c8ecb3b65355f728ea2c3f04d32135483a06'
            '03e0cc9e0f0e2afb3fc99846b8eb1fcb0698955833c67a40a6692c7df4df2d12')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --with-session-info=none --with-init-script=systemd --enable-static-uinput
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir/etc/rc.d"
  install  -Dm0755 "${srcdir}/spice-vdagentd.rc.d" "${pkgdir}/etc/rc.d/spice-vdagentd"
  install  -Dm0755 "${srcdir}/spice-vdagentd.conf.d" "${pkgdir}/etc/conf.d/spice-vdagentd.conf"
}

# vim:set ts=2 sw=2 et:
