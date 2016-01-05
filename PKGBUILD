# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Former maintainer: Andrew Lewis <nerf@judo.za.org>
pkgname=rspamd
pkgver=1.0.11
pkgrel=1
epoch=
pkgdesc="Fast, free and open-source spam filtering system."
arch=('x86_64' 'i686' 'mips64el')
url="http://rspamd.com"
license=('BSD')
depends=('libevent' 'glib2' 'gmime' 'lua' 'sqlite')
makedepends=('cmake' 'pkgconfig')

backup=('etc/rspamd/2tld.inc'
		'etc/rspamd/common.conf'
		'etc/rspamd/composites.conf'
		'etc/rspamd/dmarc_whitelist.inc'
		'etc/rspamd/logging.inc'
		'etc/rspamd/metrics.conf'
		'etc/rspamd/modules.conf'
		'etc/rspamd/options.inc'
		'etc/rspamd/rspamd.conf'
		'etc/rspamd/rspamd.systemd.conf'
		'etc/rspamd/rspamd.sysvinit.conf'
		'etc/rspamd/spf_dkim_whitelist.inc'
		'etc/rspamd/statistic.conf'
		'etc/rspamd/surbl-whitelist.inc'
		'etc/rspamd/worker-controller.inc'
		'etc/rspamd/worker-normal.inc'
		'etc/rspamd/modules.d/chartable.conf'
		'etc/rspamd/modules.d/dkim.conf'
		'etc/rspamd/modules.d/dmarc.conf'
		'etc/rspamd/modules.d/emails.conf'
		'etc/rspamd/modules.d/forged_recipients.conf'
		'etc/rspamd/modules.d/fuzzy_check.conf'
		'etc/rspamd/modules.d/hfilter.conf'
		'etc/rspamd/modules.d/ip_score.conf'
		'etc/rspamd/modules.d/maillist.conf'
		'etc/rspamd/modules.d/multimap.conf'
		'etc/rspamd/modules.d/once_received.conf'
		'etc/rspamd/modules.d/phishing.conf'
		'etc/rspamd/modules.d/ratelimit.conf'
		'etc/rspamd/modules.d/regexp.conf'
		'etc/rspamd/modules.d/spf.conf'
		'etc/rspamd/modules.d/surbl.conf'
		'etc/rspamd/modules.d/whitelist.conf')

install=rspamd.install

source=("https://www.rspamd.com/downloads/${pkgname}-${pkgver}.tar.xz"
        "rspamd.service")

sha256sums=('b914c77c30dcab863f6c685b4a83a1662ee1b4503654fbf3ee3ae2fbca1ed928'
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
    -DENABLE_LUAJIT=ON \
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

