# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='libstoragemgmt'
pkgver='1.9.7'
pkgrel='1'
pkgdesc='A library for storage management'
arch=('x86_64' 'aarch64')
url="https://github.com/libstorage/${pkgname}"
license=('LGPL')
depends=('libxml2' 'icu' 'sqlite' 'openssl' 'libconfig' 'systemd')
makedepends=('check' 'chrpath' 'valgrind' 'python-pywbem' 'procps-ng')
optdepends=('arcconf: support for Microsemi (Adaptec) controllers'
	    'storcli: support for Broadcom (LSI) controllers')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.sysusers")
sha256sums=('4d14c322f661bb5467454bc97fa921cd6d0004b3831d3e923cdf99b19e26cc8e'
            'ab2ed19a10fd743b815811f0826eebdb53e3a8697eb2225b4af26a8066bac30f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

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
    --with-python3
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
  pushd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  popd
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
