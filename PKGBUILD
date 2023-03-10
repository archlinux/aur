# Maintainer:  Trey Blancher <trey at blancher dot net>
# Contributor: Nigel Kukard <nkukard@lbsd.net>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Maik Broemme <mbroemme@libmpq.org>
# Contributor: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

_pkg=asterisk
pkgname=${_pkg}-lts-18
pkgver=18.17.0
pkgrel=1
pkgdesc='A complete open source PBX toolkit - Long Term Support release 18'
arch=(x86_64 i686 aarch64 armv7h)
url=https://www.asterisk.org
license=(GPL)
provides=("${_pkg}=${pkgver}")
conflicts=(${_pkg})
depends=(alsa-lib
         curl
         gsm
         imap
         jansson
         libedit
         libsrtp
         libvorbis
         libxml2
         libvpx
         libx11
         libxslt
         lua53
         opus
         popt
         postgresql-libs
         python
         speex)
makedepends=(gsm
             sqlite3)
optdepends=(dahdi
            libpri
            libss7
            openr2
            postgresql
            sqlite3
            unixodbc)
_confs=(acl.conf
        adsi.conf
        aeap.conf
        agents.conf
        alarmreceiver.conf
        alsa.conf
        amd.conf
        app_mysql.conf
        app_skel.conf
        ari.conf
        ast_debug_tools.conf
        asterisk.adsi
        asterisk.conf
        calendar.conf
        ccss.conf
        cdr_adaptive_odbc.conf
        cdr_beanstalkd.conf
        cdr.conf
        cdr_custom.conf
        cdr_manager.conf
        cdr_mysql.conf
        cdr_odbc.conf
        cdr_pgsql.conf
        cdr_sqlite3_custom.conf
        cdr_syslog.conf
        cdr_tds.conf
        cel_beanstalkd.conf
        cel.conf
        cel_custom.conf
        cel_odbc.conf
        cel_pgsql.conf
        cel_sqlite3_custom.conf
        cel_tds.conf
        chan_dahdi.conf
        chan_mobile.conf
        cli_aliases.conf
        cli.conf
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
        misdn.conf
        modules.conf
        motif.conf
        musiconhold.conf
        muted.conf
        ooh323.conf
        osp.conf
        oss.conf
        phone.conf
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
        res_config_sqlite.conf
        res_corosync.conf
        res_curl.conf
        res_fax.conf
        res_ldap.conf
        res_odbc.conf
        resolver_unbound.conf
        res_parking.conf
        res_pgsql.conf
        res_pktccops.conf
        res_snmp.conf
        res_stun_monitor.conf
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
        vpb.conf
        xmpp.conf)
backup=("${_confs[@]/#/etc/$_pkg/}")
_archive="${_pkg}-$pkgver"
source=("https://downloads.asterisk.org/pub/telephony/${_pkg}/releases/$_archive.tar.gz"
        "${_pkg}.sysusers"
        "${_pkg}.logrotated"
        "${_pkg}.tmpfiles")
sha256sums=('e14158f32c304bb00ebcc4b8a83d9659aad2d5b1cdb2f2cf853d62d6ddc5fbc2'
            '38a53911647fb2308482179cba605ebf12345df37eed23eb4ea67bf0bf041486'
            'b97dc10a262621c95e4b75e024834712efd58561267b59b9171c959ecd9f7164'
            '1b6b489d4f71015bfc56ce739d92df7e9abdb349aed6f5a47dd9c18d84546c1b')

build() {
    cd "$_archive"

    # Work around Cyrus bug #2629
    # https://github.com/cyrusimap/cyrus-imapd/issues/2629
    export LDFLAGS="${LDFLAGS/,--as-needed}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --with-imap=system

	make MENUSELECT_CFLAGS= OPTIMIZE= DEBUG= ASTVARRUNDIR=/run/asterisk NOISY_BUILD=1
}

package(){
    cd "$_archive"
    make DESTDIR="$pkgdir" install
    make DESTDIR="$pkgdir" install-headers
    make DESTDIR="$pkgdir" samples

    # Not entirely convinced this part is necessary, LTS releases shouldn't be
    # adding features, so the _confs and backup arrays shouldn't change.
    # Keeping here for posterity, need to go through a few pkgver and pkgrel
    # bumps before we remove this.  2022-05-26 I was actually wrong about this,
    # Asterisk 18.12 introduced a new config file, aeap.conf.  New features could
    # be added to Asterisk 18 until 2024-10-20, when it goes into Security Fix Only.  
    # From 'asterisk' PKGBUILD:  Backup file list changes frequently and is hard
    # to keep up to date. Check that our current meta data matches whatever just
    # got packaged, else flunk with a helpful output of where the lists differ.
    # We have to compare twice because cmp has a useful exit code, comm has
    # useful output, neither both
    local _backs=($(cd "$pkgdir/etc/${_pkg}" && echo *))
    cmp -s \
        <(IFS=$'\n'; echo "${_confs[*]}" | sort) \
        <(IFS=$'\n'; echo "${_backs[*]}" | sort) ||
        (comm -3 --nocheck-order \
            <(IFS=$'\n'; echo "${_confs[*]}" | sort) \
            <(IFS=$'\n'; echo "${_backs[*]}" | sort) &&
        exit 1)

    sed -i -e 's,/var/run,/run,' "$pkgdir/etc/asterisk/asterisk.conf"
    install -Dm644 -t "$pkgdir/usr/share/doc/${_pkg}/examples" "$pkgdir/etc/asterisk/"*

    mv "$pkgdir/var/run" "$pkgdir"

	pushd contrib/systemd
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$pkname"*.{service,socket}

    pushd "$srcdir"
    install -Dm644 "${_pkg}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkg}.conf"
    install -Dm644 "${_pkg}.logrotated" "$pkgdir/etc/logrotate.d/${_pkg}"
    install -Dm644 "${_pkg}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_pkg}.conf"

    chmod 0750 "$pkgdir"/{etc,run,var/{lib,log,spool}}/"${_pkg}"
    chmod 1777 "$pkgdir"/tmp
}
