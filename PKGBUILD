# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='libstoragemgmt'
pkgver='1.10.2'
pkgrel='1'
pkgdesc='A library for storage management'
arch=('x86_64' 'aarch64')
url="https://github.com/libstorage/${pkgname}"
license=('LGPL')
depends=('libxml2' 'icu' 'sqlite' 'openssl' 'libconfig' 'ledmon' 'systemd')
makedepends=('check' 'chrpath' 'valgrind' 'python-pywbem' 'procps-ng')
optdepends=('arcconf: support for Microsemi (Adaptec) controllers'
	    'storcli: support for Broadcom (LSI) controllers')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.sysusers")
sha256sums=('5ca3b6e0996ef13ff0f6bb4af99d67004ffec3530723f57338caea48a23513cc'
            'ab2ed19a10fd743b815811f0826eebdb53e3a8697eb2225b4af26a8066bac30f')

prepare() {
  cd "${pkgname}-${pkgver}"

  autoreconf -fvi
  PYTHON="/usr/bin/python3" ./configure \
    --prefix="/usr" \
    --bindir="/usr/bin" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --localstatedir="/var" \
    --libdir="/usr/lib" \
    --datarootdir="/usr/share" \
    --datadir="/usr/share" \
    --with-python3
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

check() {
  cd "${pkgname}-${pkgver}/test"
  ./runtests.sh
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 "../${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
