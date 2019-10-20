# Maintainer: Amish <contact at via dot aur>
# Contributor: M0Rf30
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=snort-nfqueue
_pkgname=snort
pkgver=2.9.15
pkgrel=1
pkgdesc='A lightweight network IDS / IPS with NFQUEUE and OpenAppID support.'
arch=('i686' 'x86_64')
url='https://www.snort.org'
license=('GPL')
provides=('snort')
conflicts=('snort')
depends=('dbus' 'libdaq-nfqueue' 'libdnet' 'libgcrypt' 'libgpg-error' 'libnetfilter_queue' 'libnghttp2' 'libnl' 'libnsl' 'libpcap' 'luajit' 'lz4' 'openssl' 'pcre' 'pulledpork' 'xz' 'zlib')
makedepends=('libtirpc')
backup=('etc/snort/snort.conf'
        'etc/snort/homenet.conf'
        'etc/snort/rules/local.rules'
        'etc/snort/rules/snort.rules'
        'etc/snort/threshold.conf'
        'etc/snort/reference.config'
        'etc/snort/classification.config'
        'etc/logrotate.d/snort')
options=('!makeflags' '!libtool')
install=snort.install
source=("https://www.snort.org/downloads/snort/${_pkgname}-${pkgver}.tar.gz"
        'snort-openappid.tar.gz::https://snort.org/downloads/openappid/11581'
        '001-gettid.patch'
        'snort.logrotate'
        'snort.sysusers'
        'snort.tmpfiles'
        'snort.service')
sha256sums=('bfb437746446ef72a03c501db13cd6da5edd2b41f55c80c437ba288be6da7dba'
            '7582fc56d1412881d21eafaa081cc93a586ca7f68e8e00e62c77da37de8c5424'
            'a1e451b8e580645a60314781c75ba57502e9a1539b28f29b10a46ddc411dceba'
            '7fe712141f651254b8e5aa0b3b7d73622d2d1d89bf53d7a522f8c1a067938421'
            'ae3245c5de527fb487c459f2f4a9c78803ae6341e9c81b9a404277679cdee051'
            'a92c591c409fc06661865988795093b0fb0447f614ac77951dbf9b1f6a8cf139'
            'b904ed172ea0c1a4eeaddb30745aadb8db21e333eb9faaf93400ce3db166f90d')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i ../001-gettid.patch
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=/usr --sysconfdir=/etc/snort --with-libpcap-includes=/usr/include/pcap \
        --with-daq-includes=/usr/include --with-daq-libraries=/usr/lib/daq/ \
        --enable-zlib --disable-static-daq \
        CPPFLAGS="$CPPFLAGS -I/usr/include/tirpc/"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install

    install -D -m644 -t "${pkgdir}"/etc/snort etc/{*.conf*,*.map}
    install -D -m644 "${srcdir}"/snort.logrotate "${pkgdir}"/etc/logrotate.d/snort
    install -D -m644 "${srcdir}"/snort.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/snort.conf
    install -D -m644 "${srcdir}"/snort.sysusers "${pkgdir}"/usr/lib/sysusers.d/snort.conf
    install -D -m644 "${srcdir}"/snort.service "${pkgdir}"/usr/lib/systemd/system/snort.service

    install -d -m755 "${pkgdir}"/etc/snort/{dynamic,}rules
    install -Dm644 /dev/null "${pkgdir}"/etc/snort/rules/snort.rules
    echo 'ipvar HOME_NET [10.0.0.0/8,172.16.0.0/12,192.168.0.0/16]' > "${pkgdir}"/etc/snort/homenet.conf
    echo '#alert tcp any any <> any 80 (msg: "Test web activity"; sid:1000001;)' > "${pkgdir}"/etc/snort/rules/local.rules
    chmod 0644 "${pkgdir}"/etc/snort/{homenet.conf,rules/{local,snort}.rules}

    # config for NFQUEUE support, rule files and output logging
    install -m644 "${pkgdir}"/etc/snort/snort.conf "${pkgdir}"/etc/snort/snort.conf.default
    sed -i -e '/ipvar\s\+HOME_NET\s/ a include homenet.conf' \
      -e 's/^\(ipvar\s\+HOME_NET\s\)/#\1/g' \
      -e 's/^\(var\s\+RULE_PATH\s\).*/\1rules/g' \
      -e 's/^\(include\s\+$RULE_PATH\/\)/#\1/g' \
      -e 's/^#\(include\s\+$RULE_PATH\/local.rules\)/\1/g' \
      -e 's#/usr/local/lib#/usr/lib#g' \
      -e 's#/usr/local/lib/snort_dynamicrules#/etc/snort/dynamicrules#g' \
      -e 's#/usr/lib/snort_dynamicrules#/etc/snort/dynamicrules#g' \
      -e '/^preprocessor\s\+reputation:\s/,/^\s\+blacklist\s/ s/^/#/g' \
      -e $'/^#\s\+Reputation\s\+preprocessor/ i\\\n# OpenAppID\\\npreprocessor appid: app_detector_dir /usr/lib/openappid, \\\\\\\n   app_stats_filename appstats-unified.log, \\\\\\\n   app_stats_period 60\\\n' \
      -e $'/^#\\s*config daq:/,/^\\s*$/ {/^\\s*$/i\\\nconfig daq: nfq\\\nconfig daq_mode: inline\\\nconfig daq_dir: /usr/lib/daq\\\n#config daq_var: queue=0\n}' \
      -e $'/^#\\s*output\\s\\+unified2:\\s/ a\\\noutput unified2: filename snort_unified.log, limit 128, appid_event_types\\\n\\\n# alert fast\\\noutput alert_fast: alert' \
      -e $'/include\\s\\+$RULE_PATH\\/local.rules/ i\\\n\\\n# fetched via pulledpork\\\ninclude $RULE_PATH/snort.rules\\\n\\\n# emergingthreats\\\n#include $RULE_PATH/emerging.conf\\\n' \
      "${pkgdir}"/etc/snort/snort.conf
    install -m644 "${pkgdir}"/etc/snort/snort.conf "${pkgdir}"/etc/snort/snort-nfqueue.conf.default

    # OpenAppID files
    install -d -m755 "${pkgdir}"/usr/lib/openappid/custom/{libs,lua,port}
    cp -a --no-preserve=ownership -t "${pkgdir}"/usr/lib/openappid/ "${srcdir}"/odp
}
