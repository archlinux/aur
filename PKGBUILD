# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='libstoragemgmt'
pkgver='1.9.2'
pkgrel='1'
pkgdesc='A library for storage management'
arch=('any')
url="https://github.com/libstorage/${pkgname}"
license=('LGPL')
depends=('libxml2' 'icu' 'sqlite' 'openssl' 'libconfig' 'systemd')
makedepends=('check' 'chrpath' 'valgrind' 'python-pywbem' 'procps-ng')
optdepends=('arcconf: support for Microsemi (Adaptec) controllers')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0afd17fbce2776373b65c0f9bceec1496c5977210d6b2fc81c55ac18050dc128')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # mem leak test disabled
  # https://github.com/libstorage/libstoragemgmt/issues/467
  autoreconf -fvi
  PYTHON="/usr/bin/python" ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --datarootdir=/usr/share \
    --datadir=/usr/share \
    --with-python3 \
    --without-mem-leak-test
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/test"
  ./runtests.sh
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
