# Maintainer : Matthias Fulz <mfulz [at] olznet [dot] de>
shortname=gvm-libs
pkgname=gvm-libs-20
pkgver=21.4.1
pkgrel=1
pkgdesc='greenbone-vulnerability-manager libraries'
arch=('x86_64')
url="https://github.com/greenbone/gvm-libs"
license=('GPL')
provides=('gvm-libs')
conflicts=('gvm-libs')
depends=('gnutls' 'libpcap' 'gpgme' 'libssh' 'glib2' 'libldap' 'hiredis' 'sudo' 'libnet')
makedepends=('cmake' 'doxygen' 'graphviz')
groups=('greenbone-vulnerability-manager')
source=("${shortname}-${pkgver}.tar.gz::https://github.com/greenbone/gvm-libs/archive/v${pkgver}.tar.gz"
        "gvm.sudoers"
        "gvm-libs.install"
        'gvm.tmpfiles')
sha512sums=('b05df1616a1bad6b9af84fd03092f528bf85fe1e890c15b4a2b2491d74b4d8b7bc4491d85f281ec1adc56b8aaea3c4beae9eea165b77864dd155019196cb5219'
            'ff3f4122f5fc08c1edc2813aebd55b26e11c220852d011a84e62a27ac44a64ca4770a68488f408e62d82aa194b6d4706738745ea15bfbb2e61f3f264436d92a7'
            '09fea7030d23686cea88e1ae6b1f88e94050b293371c06708a34f9c92e96e1f522f5350c8bbc5e5ddf675bd8fb58205b3b86b88d46a0ab84f5a664e374a68155'
            '8cae5b14e5cb1e8ea9ed33d7cd95b9800d46809f72f01498ab46aedae7bdef78da23725d36dd6ae58137b08884dd4a9aa663041196111e91803e34674316a775')
replaces=('openvas-libraries')

build() {
  cd "${shortname}-${pkgver}"
  LDFLAGS+=" -Wl,--no-as-needed"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBDIR=/usr/lib -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var \
    -DGVM_PID_DIR=/run/gvm .
  make
}

package() {
  install=gvm-libs.install
  cd "${shortname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  install -m 750 -d $pkgdir/run/gvm
  install -m 750 -d $pkgdir/var/lib/gvm
  install -m 750 -d $pkgdir/var/lib/openvas
  install -d $pkgdir/var/lib/gvm/gvmd
  install -m 750 -d $pkgdir/var/log/gvm
  install -m 750 -d $pkgdir/etc/sudoers.d
  install -m 600 ${srcdir}/gvm.sudoers $pkgdir/etc/sudoers.d/gvm
  install -m 755 -d $pkgdir/usr/lib/tmpfiles.d
  install -m 644 ${srcdir}/gvm.tmpfiles $pkgdir/usr/lib/tmpfiles.d/gvm.conf
}
