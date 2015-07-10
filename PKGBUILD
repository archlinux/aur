# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=spice-vdagent
pkgver=0.16.0
pkgrel=1
pkgdesc="Spice agent xorg client that enables copy and paste between client and X-session and more"
arch=('i686' 'x86_64')
url="http://www.spice-space.org/"
license=('GPL')
depends=('libpciaccess' 'libxinerama' 'libxrandr' 'libxfixes'
         'spice-protocol>=0.12.8' 'libsystemd')
optdepends=('dex: start spice-vdagent automatically on login')
makedepends=('systemd')
source=("http://www.spice-space.org/download/releases/$pkgname-$pkgver.tar.bz2"
        'spice-vdagentd.conf.d')
sha256sums=('5b951646e0bd996afda2d063e706fa2aad2655af5bdd1b6525260ab50be30f7d'
            '03e0cc9e0f0e2afb3fc99846b8eb1fcb0698955833c67a40a6692c7df4df2d12')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # set udevrulesdir, since this is impossible with a flag
  sed -i 's/udevrulesdir = \/lib/udevrulesdir = \/usr\/lib/' Makefile.am

  # remove mkdir for /var/run/spice-vdagentd
  sed -i 's/$(mkdir_p) $(DESTDIR)$(localstatedir)\/run\/spice-vdagentd/true/' \
    Makefile.am

  sed -i 's/\/var\/run/\/run/' data/tmpfiles.d/spice-vdagentd.conf
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fi
  ./configure --prefix=/usr \
    --bindir=/usr/bin --sbindir=/usr/bin --sysconfdir=/etc \
    --localstatedir=/var --libdir=/usr/lib \
    --with-session-info=systemd --with-init-script=systemd \
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
