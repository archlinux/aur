# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Former maintainer: Andrew Lewis <nerf@judo.za.org>
pkgname=rspamd
pkgver=1.8.0
pkgrel=1
epoch=
pkgdesc="Fast, free and open-source spam filtering system."
arch=(x86_64 i686 armv7h)
url="https://rspamd.com"
license=(BSD)
depends=(file glib2 icu libevent luajit sqlite)
makedepends=(cmake ragel ninja)

backup=('etc/rspamd/2tld.inc'
		'etc/rspamd/actions.conf'
		'etc/rspamd/cgp.inc'
		'etc/rspamd/common.conf'
		'etc/rspamd/composites.conf'
		'etc/rspamd/dmarc_whitelist.inc'
		'etc/rspamd/groups.conf'
		'etc/rspamd/logging.inc'
		'etc/rspamd/maillist.inc'
		'etc/rspamd/metrics.conf'
		'etc/rspamd/mid.inc'
		'etc/rspamd/mime_types.inc'
		'etc/rspamd/modules.conf'
		'etc/rspamd/modules.d/antivirus.conf'
		'etc/rspamd/modules.d/arc.conf'
		'etc/rspamd/modules.d/asn.conf'
		'etc/rspamd/modules.d/chartable.conf'
		'etc/rspamd/modules.d/clickhouse.conf'
		'etc/rspamd/modules.d/dcc.conf'
		'etc/rspamd/modules.d/dkim.conf'
		'etc/rspamd/modules.d/dkim_signing.conf'
		'etc/rspamd/modules.d/dmarc.conf'
		'etc/rspamd/modules.d/elastic.conf'
		'etc/rspamd/modules.d/emails.conf'
		'etc/rspamd/modules.d/force_actions.conf'
		'etc/rspamd/modules.d/forged_recipients.conf'
		'etc/rspamd/modules.d/fuzzy_check.conf'
		'etc/rspamd/modules.d/greylist.conf'
		'etc/rspamd/modules.d/hfilter.conf'
		'etc/rspamd/modules.d/history_redis.conf'
		'etc/rspamd/modules.d/ip_score.conf'
		'etc/rspamd/modules.d/maillist.conf'
		'etc/rspamd/modules.d/metadata_exporter.conf'
		'etc/rspamd/modules.d/metric_exporter.conf'
		'etc/rspamd/modules.d/mid.conf'
		'etc/rspamd/modules.d/milter_headers.conf'
		'etc/rspamd/modules.d/mime_types.conf'
		'etc/rspamd/modules.d/multimap.conf'
		'etc/rspamd/modules.d/mx_check.conf'
		'etc/rspamd/modules.d/neural.conf'
		'etc/rspamd/modules.d/once_received.conf'
		'etc/rspamd/modules.d/phishing.conf'
		'etc/rspamd/modules.d/ratelimit.conf'
		'etc/rspamd/modules.d/rbl.conf'
		'etc/rspamd/modules.d/redis.conf'
		'etc/rspamd/modules.d/regexp.conf'
		'etc/rspamd/modules.d/replies.conf'
		'etc/rspamd/modules.d/reputation.conf'
		'etc/rspamd/modules.d/rspamd_update.conf'
		'etc/rspamd/modules.d/spamassassin.conf'
		'etc/rspamd/modules.d/spamtrap.conf'
		'etc/rspamd/modules.d/spf.conf'
		'etc/rspamd/modules.d/surbl.conf'
		'etc/rspamd/modules.d/trie.conf'
		'etc/rspamd/modules.d/url_redirector.conf'
		'etc/rspamd/modules.d/url_reputation.conf'
		'etc/rspamd/modules.d/url_tags.conf'
		'etc/rspamd/modules.d/whitelist.conf'
		'etc/rspamd/options.inc'
		'etc/rspamd/redirectors.inc'
		'etc/rspamd/rspamd.conf'
		'etc/rspamd/scores.d/fuzzy_group.conf'
		'etc/rspamd/scores.d/headers_group.conf'
		'etc/rspamd/scores.d/hfilter_group.conf'
		'etc/rspamd/scores.d/mime_types_group.conf'
		'etc/rspamd/scores.d/mua_group.conf'
		'etc/rspamd/scores.d/phishing_group.conf'
		'etc/rspamd/scores.d/policies_group.conf'
		'etc/rspamd/scores.d/rbl_group.conf'
		'etc/rspamd/scores.d/statistics_group.conf'
		'etc/rspamd/scores.d/subject_group.conf'
		'etc/rspamd/scores.d/surbl_group.conf'
		'etc/rspamd/settings.conf'
		'etc/rspamd/spf_dkim_whitelist.inc'
		'etc/rspamd/statistic.conf'
		'etc/rspamd/surbl-whitelist.inc'
		'etc/rspamd/worker-controller.inc'
		'etc/rspamd/worker-fuzzy.inc'
		'etc/rspamd/worker-normal.inc'
		'etc/rspamd/worker-proxy.inc')

install=rspamd.install

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vstakhov/${pkgname}/archive/${pkgver}.tar.gz"
		"${pkgname}.tmpfile"
		"${pkgname}.sysuser"
		"fixes-${pkgver}.diff"
		)

sha256sums=('3d83fbe240c61cf457bbbd74b9fee68c74ed5edd3480e6da358b0db7d4f732be'
            'f89edae5436a3c14e58210fb5c1d5bdd2f8a6f98c03dbc150ea9ff1a3fcfe441'
            '59646874a5036f3f26cac2898a2f60713fe6147b3c60ee964494f07b6acc313f'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	patch -Np1 <../fixes-${pkgver}.diff
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake \
		-G Ninja \
		-DNO_SHARED=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCONFDIR=/etc/rspamd \
		-DRUNDIR=/run/rspamd \
		-DLOGDIR=/var/log/rspamd \
		-DRSPAMD_USER='_rspamd' \
		-DDBDIR=/var/lib/rspamd \
		-DWANT_SYSTEMD_UNITS=ON \
		.

	cmake --build .
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="${pkgdir}/" cmake --build . --target install

	install -Dm0644 "LICENSE.md" -t "${pkgdir}/usr/share/${pkgname}"
	install -Dm0644 "../${pkgname}.tmpfile" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm0644 "../${pkgname}.sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
