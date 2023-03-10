# Maintainer: Nigel Kukard <nkukard@lbsd.net>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Maik Broemme <mbroemme@libmpq.org>
# Contributor: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

pkgname=asterisk
pkgver=20.2.0
pkgrel=1
pkgdesc='A complete PBX solution'
arch=(x86_64 i686 aarch64 armv7h)
url=https://www.asterisk.org
license=(GPL)
depends=(alsa-lib
         curl
         jansson
         libedit
         libvorbis
         libxml2
         libxslt
         opus
         popt
         speex)
makedepends=(gsm
             sqlite3)
optdepends=(dahdi
            gsm
            libpri
            libsrtp
            libss7
            lua51
            openr2
            postgresql
            unixodbc)
_confs=(acl.conf
        adsi.conf
        aeap.conf
        agents.conf
        alarmreceiver.conf
        alsa.conf
        amd.conf
        app_skel.conf
        ari.conf
        ast_debug_tools.conf
        asterisk.adsi
        asterisk.conf
        calendar.conf
        ccss.conf
        cdr.conf
        cdr_adaptive_odbc.conf
        cdr_beanstalkd.conf
        cdr_custom.conf
        cdr_manager.conf
        cdr_odbc.conf
        cdr_pgsql.conf
        cdr_sqlite3_custom.conf
        cdr_tds.conf
        cel.conf
        cel_beanstalkd.conf
        cel_custom.conf
        cel_odbc.conf
        cel_pgsql.conf
        cel_sqlite3_custom.conf
        cel_tds.conf
        chan_dahdi.conf
        chan_mobile.conf
        cli.conf
        cli_aliases.conf
        cli_permissions.conf
        codecs.conf
        confbridge.conf
        config_test.conf
        console.conf
        dbsep.conf
        dnsmgr.conf
        dsp.conf
        dundi.conf
        enum.conf
        extconfig.conf
        extensions.ael
        extensions.conf
        extensions.lua
        extensions_minivm.conf
        features.conf
        festival.conf
        followme.conf
        func_odbc.conf
        geolocation.conf
        hep.conf
        http.conf
        iax.conf
        iaxprov.conf
        indications.conf
        logger.conf
        manager.conf
        meetme.conf
        mgcp.conf
        minivm.conf
        modules.conf
        motif.conf
        musiconhold.conf
        ooh323.conf
        osp.conf
        phoneprov.conf
        pjproject.conf
        pjsip.conf
        pjsip_notify.conf
        pjsip_wizard.conf
        prometheus.conf
        queuerules.conf
        queues.conf
        res_config_mysql.conf
        res_config_sqlite3.conf
        res_corosync.conf
        res_curl.conf
        res_fax.conf
        res_ldap.conf
        res_odbc.conf
        res_parking.conf
        res_pgsql.conf
        res_pktccops.conf
        res_snmp.conf
        res_stun_monitor.conf
        resolver_unbound.conf
        rtp.conf
        say.conf
        sip.conf
        sip_notify.conf
        skinny.conf
        sla.conf
        smdi.conf
        sorcery.conf
        ss7.timers
        stasis.conf
        statsd.conf
        stir_shaken.conf
        telcordia-1.adsi
        test_sorcery.conf
        udptl.conf
        unistim.conf
        users.conf
        voicemail.conf
        xmpp.conf)
backup=("${_confs[@]/#/etc/$pkgname/}")
_archive="$pkgname-$pkgver"
source=("https://downloads.asterisk.org/pub/telephony/$pkgname/releases/$_archive.tar.gz"
        "$pkgname.sysusers"
        "$pkgname.logrotated"
        "$pkgname.tmpfiles")
sha256sums=('eca0f7ee7e49a72bdb0c26512db45c9683ca40c8fdf63466a04705ffaba04b85'
            '38a53911647fb2308482179cba605ebf12345df37eed23eb4ea67bf0bf041486'
            'b97dc10a262621c95e4b75e024834712efd58561267b59b9171c959ecd9f7164'
            '1b6b489d4f71015bfc56ce739d92df7e9abdb349aed6f5a47dd9c18d84546c1b')

build() {
	cd "$_archive"

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin

	make MENUSELECT_CFLAGS= OPTIMIZE= DEBUG= ASTVARRUNDIR="/run/$pkgname" NOISY_BUILD=1
}

package(){
	cd "$_archive"

	make DESTDIR="$pkgdir" install
	make DESTDIR="$pkgdir" install-headers
	make DESTDIR="$pkgdir" samples

	# Backup file list changes frequently and is hard to keep up to date. Check
	# that our current meta data matches whatever just got packaged, else flunk
	# with a helpful output of where the lists differ. We have to compare twice
	# because cmp has a useful exit code, comm has a useful output, neither both
	local _backs=($(cd "$pkgdir/etc/$pkgname" && echo *))
	cmp -s \
		<(IFS=$'\n'; echo "${_confs[*]}" | sort) \
		<(IFS=$'\n'; echo "${_backs[*]}" | sort) ||
		(comm -3 --nocheck-order \
			<(IFS=$'\n'; echo "${_confs[*]}" | sort) \
			<(IFS=$'\n'; echo "${_backs[*]}" | sort) &&
		exit 1)

	sed -i -e 's,/var/run,/run,' "$pkgdir/etc/$pkgname/asterisk.conf"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/examples" "$pkgdir/etc/$pkgname/"*

	mv "$pkgdir/var/run" "$pkgdir"

	pushd contrib/systemd
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$pkname"*.{service,socket}

	pushd "$srcdir"
	install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$pkgname.logrotated" "$pkgdir/etc/logrotate.d/$pkgname"
	install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	chmod 0750 "$pkgdir"/{etc,run,var/{lib,log,spool}}/"$pkgname"
}
