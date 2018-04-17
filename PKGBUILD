# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mailfromd'
pkgver='8.5'
pkgrel='1'
pkgdesc='General-Purpose Mail Filter'
arch=('x86_64')
url="http://puszcza.gnu.org.ua/software/${pkgname}"
depends=('smtp-server' 'gdbm' 'mailutils' 'geoip' 'adns')
makedepends=('mailutils')
license=('GPL')
source=("${pkgname}.service"
	"ftp://download.gnu.org.ua/pub/release/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('26a380c1bfe964c1aaaf351f85504c72ca7be5dca199e7cd79252c83382a9ce0'
            '7796223635ce8a912a649de566f9595432590c6b6d38db7c56d61ab6b86fbbc3')
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/tests"
  ./testsuite -e --color=always
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -dm770 -o 8 -g 12 "${pkgdir}/var/lib/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
