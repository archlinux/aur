# Maintainer : Matthias Fulz <mfulz [at] olznet [dot] de>
shortname=gvm-libs
pkgname=gvm-libs-20
pkgver=20.8.1
pkgrel=3
pkgdesc='greenbone-vulnerability-manager libraries'
arch=('x86_64')
url="https://github.com/greenbone/gvm-libs"
license=('GPL')
provides=('gvm-libs')
conflicts=('gvm-libs')
depends=('gnutls' 'libpcap' 'gpgme' 'libssh' 'glib2' 'libldap' 'hiredis' 'sudo')
makedepends=('cmake' 'doxygen')
groups=('greenbone-vulnerability-manager')
source=("${shortname}-${pkgver}.tar.gz::https://github.com/greenbone/gvm-libs/archive/v${pkgver}.tar.gz"
        "gvm.sudoers"
        "gvm-libs.install")
sha512sums=('846b062b849688019715cbff1d6c4f6a1b4dd8c58cfdef78ea08df3cd104810e9091385cca3c49618538a28c42c0fe78a38fb934fbde604aef86e84c4f2dda94'
            'ff3f4122f5fc08c1edc2813aebd55b26e11c220852d011a84e62a27ac44a64ca4770a68488f408e62d82aa194b6d4706738745ea15bfbb2e61f3f264436d92a7'
            '09fea7030d23686cea88e1ae6b1f88e94050b293371c06708a34f9c92e96e1f522f5350c8bbc5e5ddf675bd8fb58205b3b86b88d46a0ab84f5a664e374a68155')
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

  install -d $pkgdir/run/gvm
  install -m 750 -d $pkgdir/var/lib/gvm
  install -m 750 -d $pkgdir/var/lib/openvas
  install -d $pkgdir/var/lib/gvm/gvmd
  install -m 750 -d $pkgdir/var/log/gvm
  install -m 750 -d $pkgdir/etc/sudoers.d
  install -m 600 ${srcdir}/gvm.sudoers $pkgdir/etc/sudoers.d/gvm
}
