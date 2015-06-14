# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: skydrome <skydrome@i2pmail.org>
# Contributor: Valere Monseur <valere_monseur@hotmail.com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: (asper, noob

pkgname=vuurmuur
_pkgname=Vuurmuur
pkgver=0.7
pkgrel=1
pkgdesc='powerful front-end for iptables aimed at system-administrators who need a decent firewall, but dont have netfilter specific knowledge'
arch=('i686' 'x86_64')
url='http://www.vuurmuur.org'
license=('GPL')
install='vuurmuur.install'
depends=('iptables' 'ncurses' 'libjpeg')
optdepends=('conntrack-tools: for connection tracking'
            'iproute2: for traffic shapping'
            'iptrafvol: for traffic volume logging')
conflicts=(vuurmuur-devel)
backup=('etc/vuurmuur/config.conf'
        'etc/vuurmuur/modules.conf'
        'etc/vuurmuur/vuurmuur_conf.conf'
        'etc/vuurmuur/plugins/textdir.conf'
        'etc/logrotate.d/vuurmuur')
source=(
ftp://ftp.vuurmuur.org/releases/$pkgver/${_pkgname}-$pkgver.tar.gz
modules.conf
vuurmuur.rc
vuurmuur.service
vuurmuur.script
)
build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    for archive in libvuurmuur vuurmuur vuurmuur_conf; do
        [[ ! -d "$archive" ]] &&
            tar xzf ${archive}-${pkgver}.tar.gz
    done

    msg "building vuurmuur libraries..."
    pushd libvuurmuur-${pkgver}
    ./configure --prefix=/usr --sysconfdir=/etc
    make
    popd

    msg "building vuurmuur..."
    pushd vuurmuur-${pkgver}
    sed -i 's|-rpath|-rpath-link|' configure
    LDFLAGS+="-L${srcdir}/${_pkgname}-${pkgver}/lib${pkgname}-${pkgver}/src \
              -L${srcdir}/${_pkgname}-${pkgver}/lib${pkgname}-${pkgver}/src/.libs \
              -Wl,-rpath=/usr/lib/${pkgname}/plugins" \
    ./configure --prefix=/usr --sysconfdir=/etc \
                --with-libvuurmuur-includes="${srcdir}/${_pkgname}-${pkgver}/lib${pkgname}-${pkgver}/src" \
                --with-libvuurmuur-libraries="${srcdir}/${_pkgname}-${pkgver}/lib${pkgname}-${pkgver}/src"
    make
    popd

    msg "building vuurmuur_conf..."
    pushd vuurmuur_conf-${pkgver}
    sed -i 's|-rpath|-rpath-link|' configure
    LDFLAGS+="-L${srcdir}/${_pkgname}-${pkgver}/lib${pkgname}-${pkgver}/src \
               -L${srcdir}/${_pkgname}-${pkgver}/lib${pkgname}-${pkgver}/src/.libs \
               -Wl,-rpath=/usr/lib/${pkgname}/plugins" \
    ./configure --prefix=/usr --sysconfdir=/etc \
                --with-libvuurmuur-includes="${srcdir}/${_pkgname}-${pkgver}/lib${pkgname}-${pkgver}/src" \
                --with-libvuurmuur-libraries="${srcdir}/${_pkgname}-${pkgver}/lib${pkgname}-${pkgver}/src"
    make
    popd
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    pushd libvuurmuur-${pkgver}
    make DESTDIR=${pkgdir} install
    popd

    pushd vuurmuur-${pkgver}
    make DESTDIR=${pkgdir} install
    popd

    pushd vuurmuur_conf-${pkgver}
    make DESTDIR=${pkgdir} install
    popd

    # make directory structure
    install -dm700 ${pkgdir}/etc/${pkgname}
    install -dm700 ${pkgdir}/etc/${pkgname}/plugins
    install -dm700 ${pkgdir}/etc/logrotate.d/
    install -dm755 ${pkgdir}/usr/share/${pkgname}/textdir/{interfaces,services,zones,rules}
    install -dm700 ${pkgdir}/var/log/${pkgname}

    # install daemon and log
    install -Dm755 ${srcdir}/vuurmuur.rc ${pkgdir}/etc/rc.d/${pkgname}
    install -Dm644 ${pkgdir}/usr/share/${pkgname}/scripts/vuurmuur-logrotate ${pkgdir}/etc/logrotate.d/${pkgname}

    # install systemd's files
    install -Dm755 $srcdir/vuurmuur.script $pkgdir/usr/lib/systemd/scripts/vuurmuur
    install -Dm644 $srcdir/vuurmuur.service $pkgdir/usr/lib/systemd/system/vuurmuur.service

    # install configuration
    install -Dm600 ${pkgdir}/usr/share/vuurmuur/config/config.conf.sample \
                    ${pkgdir}/etc/${pkgname}/config.conf
    install -Dm600 ${srcdir}/modules.conf ${pkgdir}/etc/${pkgname}/modules.conf
    install -Dm600 ${pkgdir}/usr/share/vuurmuur/config/vuurmuur_conf.conf.sample \
                    ${pkgdir}/etc/${pkgname}/${pkgname}_conf.conf

    sed -i ${pkgdir}/etc/${pkgname}/config.conf \
        -e 's|"/sbin/tc|"/usr/sbin/tc|' \
        -e 's|"/sbin/ip6tables|"/usr/sbin/ip6tables|' \
        -e 's|"/sbin/iptables|"/usr/sbin/iptables|' \
        -e 's|"/sbin/ip6tables-restore|"/usr/sbin/ip6tables-restore|' \
        -e 's|"/sbin/iptables-restore|"/usr/sbin/iptables-restore|' \
        -e 's|"/var/log/messages|"/var/log/iptables.log|'

    sed -i ${pkgdir}/etc/${pkgname}/${pkgname}_conf.conf \
        -e 's|"/usr/bin/iptrafvol.pl|"/usr/sbin/iptrafvol.pl|'


    echo "LOCATION=\"/etc/${pkgname}/textdir\"" > ${pkgdir}/etc/${pkgname}/plugins/textdir.conf

    # default firewall setup in /usr/share
    touch ${pkgdir}/usr/share/${pkgname}/textdir/rules/rules.conf
    touch ${pkgdir}/usr/share/${pkgname}/textdir/rules/blocklist.conf

    cp -R ${srcdir}/${_pkgname}-${pkgver}/zones/*   ${pkgdir}/usr/share/${pkgname}/textdir/zones/
    mv    ${pkgdir}/usr/share/${pkgname}/services/* ${pkgdir}/usr/share/${pkgname}/textdir/services/

    # install licenses
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/lib${pkgname}-${pkgver}/COPYING \
                    ${pkgdir}/usr/share/licenses/lib${pkgname}/COPYING
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/${pkgname}-${pkgver}/COPYING \
                    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/${pkgname}_conf-${pkgver}/COPYING \
                    ${pkgdir}/usr/share/licenses/${pkgname}_conf/COPYING
}
md5sums=('bad91aafcbea5e3a434440f88d722778'
         'e7e07db3cf65dbb7bebfd6ca3fde0e56'
         '214161fa924d6817ba6919862af37fbd'
         'ba3a1c90289a42c5c29bdf06e0045c5e'
         '718f0384b915db99b2d93ab9792cc92d')
