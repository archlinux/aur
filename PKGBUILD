# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Eric Renfro <erenfro@gmail.com>

pkgname=ha-heartbeat
pkgver=3.0.6
pkgrel=1
pkgdesc="Daemon that provides cluster infrastructure services to its clients"
arch=('x86_64')
url="http://linux-ha.org/wiki/Heartbeat"
license=('GPL')
makedepends=('docbook-xsl')
depends=('ha-glue' 'gnutls' 'python2')
source=("heartbeat-${pkgver}::hg+http://hg.linux-ha.org/heartbeat-STABLE_3_0#tag=STABLE-3.0.6")
md5sums=('SKIP')
options=('!emptydirs')
build() {
  cd "${srcdir}/heartbeat-${pkgver}"

  ./bootstrap
  # PYTHON is an available env var, listed by ./configure --help
  # but it doesn't seem to change anything
  PYTHON=python2 ./configure \
    --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --without-initdir \
    --enable-valgrind \
    --enable-pretty \
    --enable-traditional-warnings \
    --enable-fatal-warnings
  make
}
package() {
  cd "${srcdir}/heartbeat-${pkgver}"
  # PYTHON env var is used py py-compile, but "make install" doesn't forward the var to it
  # so we can't modify it and have to patch it
  sed -i 's#$PYTHON#/usr/bin/python2#g' py-compile

  make DESTDIR="${pkgdir}" install

  grep -rZl '/usr/bin/python' "${pkgdir}" | xargs -0 -i sed -i 's:/usr/bin/python$:/usr/bin/python2:g' {}
  grep -rZl '/usr/bin/env python' "${pkgdir}" | xargs -0 -i sed -i 's:/usr/bin/env python$:/usr/bin/env python2:g' {}
  # this option isn't supported anymore in systemd
  sed -i '/SysVStartPriority=99/d' "${pkgdir}/usr/lib/systemd/system/heartbeat.service"
}
