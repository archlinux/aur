# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=spice-vdagent
pkgver=0.14.0
pkgrel=2
pkgdesc="Spice agent xorg client that enables copy and paste between client and X-session and more"
arch=('i686' 'x86_64')
url="http://www.spice-space.org/"
license=('GPL')
depends=('libpciaccess' 'libxinerama' 'libxrandr' 'libxfixes' 'spice-protocol')
optdepends=('dex: start spice-vdagent automatically on login')
source=("http://www.spice-space.org/download/releases/$pkgname-$pkgver.tar.bz2"
        'spice-vdagentd.conf.d')
sha256sums=('bbaf007615002e4636c5faa6fe6912527f2cfb518aecc9e1f903bc8b0f00767c'
            '03e0cc9e0f0e2afb3fc99846b8eb1fcb0698955833c67a40a6692c7df4df2d12')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --sbindir=/usr/bin --with-session-info=none --with-init-script=systemd \
    --enable-static-uinput
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  sed -i 's/\/etc\/sysconfig\/spice-vdagentd/\/etc\/conf.d\/spice-vdagentd.conf/' $pkgdir/usr/lib/systemd/system/spice-vdagentd.service
  sed -i 's/\/usr\/sbin/\/usr\/bin/' $pkgdir/usr/lib/systemd/system/spice-vdagentd.service

  install  -Dm0755 "${srcdir}/spice-vdagentd.conf.d" "${pkgdir}/etc/conf.d/spice-vdagentd.conf"
}

# vim:set ts=2 sw=2 et:
