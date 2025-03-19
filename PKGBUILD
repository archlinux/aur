# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='flow-tools'
pkgver='0.68.5.2'
pkgrel='1'
pkgdesc="Netflow collector, analyser and report generator"
arch=('x86_64' 'aarch64')
url="https://github.com/markzz/${pkgname}"
license=('BSD 3')
makedepends=('make' 'openssl' 'zlib' 'libmariadbclient' 'postgresql-libs'
             'docbook-utils' 'perl-sgmls' 'bison' 'doxygen')
depends=('libwrap')
source=("${url}/archive/v${pkgver}.tar.gz"
	"flow-capture.service"
	"flow-capture.conf"
	"flow-werror-fix.patch"
	"https://github.com/adsr/${pkgname}/pull/30.patch"
	"https://github.com/adsr/${pkgname}/pull/31.patch"
	"sysusers.conf")
sha256sums=('51f1273283b7b337a790f9c307bf5d32cc75f2990fe57832bc41b7c61c90d362'
            '9567fe9c69f2c0a75f55673318be784d13bd8e8f0b6fa8444c2de5efe97b4ccd'
            '842e0c6d1734494c13c5a99fb643b44d8d3bfd49d8d069c5c397a4c799628e64'
            '3bb79f03e1e83e74ea1abd0d39dc6d3c72943a7b281275e33f69e5d9640b4ac3'
            '8b1d47dd0356794c75750ea095f068f6490f148d5ad9d5d5bb11870f15eae4f8'
            '8403014f7ae1971556251336fcfbffdc74fb3256df9627192c7af5149e01ef21'
            'd961522f40350107a2869c68fa8315498b57a26a13d9519b2cd5905b9e306124')
backup=("etc/${pkgname}/flow-capture.conf")

prepare() {
  cd "${pkgname}-${pkgver}"

  # Docs provide many errors and eventually fail build
  sed -i -e 's|configs docs utils|configs utils|g' Makefile.am
  # Some patches from Github
  patch -p1 -i "../flow-werror-fix.patch"
  patch -p1 -i "../30.patch"
  patch -p1 -i "../31.patch"

  autoreconf -vfi
  ./configure \
    --prefix="/usr" \
    --bindir="/usr/bin" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc/${pkgname}" \
    --localstatedir="/var" \
    --libdir="/usr/lib" \
    --datarootdir="/usr/share" \
    --datadir="/usr/share" \
    --infodir="/usr/share/info" \
    --with-mysql \
    --with-postgresql
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  install -dm0775 -o 174 -g 174 "${pkgdir}/var/lib/${pkgname}"
  install -Dm0644 "flow-capture.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm0644 "flow-capture.conf" -t "${pkgdir}/etc/${pkgname}"

  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
