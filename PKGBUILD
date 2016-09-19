# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mailfromd'
pkgver='7.99.95'
pkgrel='1'
pkgdesc='General-Purpose Mail Filter'
arch=('any')
url="http://puszcza.gnu.org.ua/software/${pkgname}"
depends=('smtp-server' 'gdbm' 'mailutils' 'geoip')
license=('GPL')
source=("${pkgname}.service"
	"ftp://download.gnu.org.ua/pub/alpha/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('26a380c1bfe964c1aaaf351f85504c72ca7be5dca199e7cd79252c83382a9ce0'
            'e843448fd3670a0a3d1116a2f0d389ed717e0375152b61cada13c23059619697')
backup=('etc/mailfromd.mf')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --bindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var/lib \
    --with-gdbm \
    --with-geoip \
    --enable-ipv6 \
    --enable-syslog-async \
    DEFAULT_USER=mail \
    DEFAULT_SOCKET=inet:8890@localhost \
    DEFAULT_LOG_FACILITY=mail
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

check() {
  cd "${pkgname}-${pkgver}/tests"
  ./testsuite -e --color=always
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -dm770 -o 8 -g 12 "${pkgdir}/var/lib/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
