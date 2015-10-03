# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Former maintainer: Andrew Lewis <nerf@judo.za.org>
pkgname=rspamd
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="Fast, free and open-source spam filtering system."
arch=('x86_64' 'i686' 'mips64el')
url="http://rspamd.com"
license=('BSD')
depends=('libevent' 'glib2' 'gmime' 'lua' 'sqlite')
makedepends=('cmake' 'pkgconfig')
backup=('etc/rspamd/logging.inc'
        'etc/rspamd/options.inc'
        'etc/rspamd/composites.conf'
        'etc/rspamd/surbl-whitelist.inc'
        'etc/rspamd/worker-normal.inc'
        'etc/rspamd/worker-controller.inc'
        'etc/rspamd/modules.conf'
        'etc/rspamd/rspamd.conf'
        'etc/rspamd/common.conf'
        'etc/rspamd/2tld.inc'
        'etc/rspamd/statistic.conf'
        'etc/rspamd/metrics.conf')
install=rspamd.install

source=("https://www.rspamd.com/downloads/${pkgname}-${pkgver}.tar.xz"
        "rspamd.service")

sha256sums=('781f882a2583752a9f86bbf78196f6f663285115113e50787d9865519e90e859'
            '3ccbc157c2e73367e7cbab2b19d0847ef58cecb47194c3bdc5f1b118405d3d26')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
    -DNO_SHARED=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCONFDIR=/etc/rspamd \
	-DRUNDIR=/run/rspamd \
	-DLOGDIR=/var/log/rspamd \
    -DRSPAMD_USER='_rspamd' \
    -DDBDIR=/var/lib/rspamd \
    -DENABLE_LUAJIT=OFF \
    -DENABLE_HIREDIS=OFF \
    .

  make -j$(nproc)
}

package() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  install -Dm0644 'LICENSE' "${pkgdir}/usr/share/${pkgname}/LICENSE"
  install -Dm0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

}
