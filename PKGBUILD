# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='flow-tools'
pkgver='0.68.5.2'
pkgrel='1'
pkgdesc="Netflow collector, analyser and report generator"
arch=('i686' 'x86_64')
url="https://github.com/markzz/${pkgname}"
license=('BSD 3')
makedepends=('make' 'zlib' 'libmariadbclient' 'postgresql-libs' 'bison' 'doxygen')
depends=('libwrap')
source=("${url}/archive/v${pkgver}.tar.gz"
	"flow-capture.service"
	"flow-capture.conf"
	"flow-werror-fix.patch"
	"sysusers.conf")
sha256sums=('51f1273283b7b337a790f9c307bf5d32cc75f2990fe57832bc41b7c61c90d362'
            '9567fe9c69f2c0a75f55673318be784d13bd8e8f0b6fa8444c2de5efe97b4ccd'
            '842e0c6d1734494c13c5a99fb643b44d8d3bfd49d8d069c5c397a4c799628e64'
            '3bb79f03e1e83e74ea1abd0d39dc6d3c72943a7b281275e33f69e5d9640b4ac3'
            'd961522f40350107a2869c68fa8315498b57a26a13d9519b2cd5905b9e306124')
backup=("etc/${pkgname}/flow-capture.conf")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i "../flow-werror-fix.patch"

  autoreconf -vfi
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/${pkgname} \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --datarootdir=/usr/share \
    --datadir=/usr/share \
    --infodir=/usr/share/info \
    --with-mysql \
    --with-postgresql
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  pushd "${srcdir}"
  install -dm0775 -o 174 -g 174 "${pkgdir}/var/lib/${pkgname}"
  install -Dm0644 "flow-capture.service" "${pkgdir}/usr/lib/systemd/system/flow-capture.service"
  install -Dm0644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm0644 "flow-capture.conf" "${pkgdir}/etc/${pkgname}/flow-capture.conf"
  pushd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  popd
}
