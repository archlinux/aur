# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Former maintainer: Andrew Lewis <nerf@judo.za.org>
pkgname=rspamd
pkgver=1.4.0
pkgrel=2
epoch=
pkgdesc="Fast, free and open-source spam filtering system."
arch=('x86_64' 'i686' 'mips64el')
url="http://rspamd.com"
license=('BSD')
depends=('libevent' 'glib2' 'gmime' 'lua' 'sqlite' 'lua-lpeg')
makedepends=('cmake' 'pkgconfig' 'ragel')

backup=('etc/rspamd/2tld.inc'
		'etc/rspamd/common.conf'
		'etc/rspamd/composites.conf'
		'etc/rspamd/dmarc_whitelist.inc'
		'etc/rspamd/logging.inc'
		'etc/rspamd/maillist.inc'
		'etc/rspamd/metrics.conf'
		'etc/rspamd/mid.inc'
		'etc/rspamd/mime_types.inc'
		'etc/rspamd/modules.conf'
		'etc/rspamd/modules.d/chartable.conf'
		'etc/rspamd/modules.d/dkim.conf'
		'etc/rspamd/modules.d/dmarc.conf'
		'etc/rspamd/modules.d/emails.conf'
		'etc/rspamd/modules.d/fann_redis.conf'
		'etc/rspamd/modules.d/forged_recipients.conf'
		'etc/rspamd/modules.d/fuzzy_check.conf'
		'etc/rspamd/modules.d/hfilter.conf'
		'etc/rspamd/modules.d/ip_score.conf'
		'etc/rspamd/modules.d/maillist.conf'
		'etc/rspamd/modules.d/mid.conf'
		'etc/rspamd/modules.d/mime_types.conf'
		'etc/rspamd/modules.d/multimap.conf'
		'etc/rspamd/modules.d/once_received.conf'
		'etc/rspamd/modules.d/phishing.conf'
		'etc/rspamd/modules.d/ratelimit.conf'
		'etc/rspamd/modules.d/rbl.conf'
		'etc/rspamd/modules.d/redis.conf'
		'etc/rspamd/modules.d/regexp.conf'
		'etc/rspamd/modules.d/rspamd_update.conf'
		'etc/rspamd/modules.d/spf.conf'
		'etc/rspamd/modules.d/surbl.conf'
		'etc/rspamd/modules.d/whitelist.conf'
		'etc/rspamd/options.inc'
		'etc/rspamd/redirectors.inc'
		'etc/rspamd/rspamd.conf'
		'etc/rspamd/rspamd.systemd.conf'
		'etc/rspamd/rspamd.sysvinit.conf'
		'etc/rspamd/spf_dkim_whitelist.inc'
		'etc/rspamd/statistic.conf'
		'etc/rspamd/surbl-whitelist.inc'
		'etc/rspamd/worker-controller.inc'
		'etc/rspamd/worker-fuzzy.inc'
		'etc/rspamd/worker-normal.inc')

install=rspamd.install

source=("https://www.rspamd.com/downloads/${pkgname}-${pkgver}.tar.xz")

sha256sums=('30c9acf93bdcc6c009524c8b2770931475929c6c9e948faa90d7412306055a1c')

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
		-DWANT_SYSTEMD_UNITS=ON \
		.

	make -j1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install

	install -Dm0644 'LICENSE' "${pkgdir}/usr/share/${pkgname}/LICENSE"
}

