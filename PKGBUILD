# Maintainer: Andrew Lewis <nerf@judo.za.org>
pkgname=rspamd
pkgver=0.9.9
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

source=("https://www.rspamd.com/downloads/${pkgname}-${pkgver}.tar.xz")

sha256sums=('bb4e6d7f69376f8d9fcd4b5a84cc9973a3551eb3e430e7c10b1bd9094db7c211')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
    -DWANT_SYSTEMD_UNITS=ON \
    -DNO_SHARED=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCONFDIR=/etc/rspamd \
    -DRSPAMD_USER='_rspamd' \
    -DRSPAMD_GROUP='_rspamd' \
    -DDBDIR=/var/lib/rspamd \
    -DENABLE_LUAJIT=OFF \
    -DENABLE_HIREDIS=OFF \
    .

  make
}

package() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  install -Dm0644 'LICENSE' "${pkgdir}/usr/share/${pkgname}/LICENSE"

}
