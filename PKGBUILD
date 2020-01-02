# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: skydrome <skydrome@i2pmail.org>
# Contributor: Valere Monseur <valere_monseur@hotmail.com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: (asper, noob
# Contributor: ratamahata

pkgname=vuurmuur
pkgver=0.8
pkgrel=1
pkgdesc='powerful front-end for iptables aimed at system-administrators who need a decent firewall, but dont have netfilter specific knowledge'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.vuurmuur.org'
license=('GPL')
install='vuurmuur.install'
depends=(libnetfilter_log
         iptables 
         ncurses 
         libjpeg)
optdepends=('conntrack-tools: for connection tracking'
            'iproute2: for traffic shapping'
            'iptrafvol: for traffic volume logging')
conflicts=(vuurmuur-devel)
backup=('etc/vuurmuur/config.conf'
        'etc/vuurmuur/modules.conf'
        'etc/vuurmuur/vuurmuur_conf.conf'
        'etc/vuurmuur/plugins/textdir.conf'
)
source=(ftp://ftp.vuurmuur.org/releases/$pkgver/${pkgname}-$pkgver.tar.gz
        modules.conf
        vuurmuur.rc
        vuurmuur.service
        vuurmuur.script)
sha256sums=('ff44c6be378d629ec3c5637830f87f2a41cff8f679c1f58bad901eebc69f4f1e'
            'a18d4093075f8e0a24f902780b04d03116be8c057b139a7502d8517009bd65e0'
            'f1b49c9e1480f9d37ef2df779f725f926552f8713f7aacfc49e0b359e10f27a5'
            '1bf559e49ac64cdf6bff9b003adbe97af1b222d59ec49242545cf13daee07a24'
            'de4cee0e33d3431c985289d8de2844eeb1b1e614e69b7e3b1d6c99e8cda3aa4f')

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="$pkgdir" install

    # make directory structure
    install -dm700 "$pkgdir"/etc/$pkgname
    install -dm700 "$pkgdir"/etc/${pkgname}/plugins
    install -dm755 "$pkgdir"/usr/share/$pkgname/textdir/{interfaces,services,zones,rules}
    install -dm700 "$pkgdir"/var/log/$pkgname

    # install daemon and log
    install -Dm755 ../vuurmuur.rc "$pkgdir"/etc/rc.d/$pkgname

    # install systemd's files
    install -Dm755 ../vuurmuur.script "$pkgdir"/usr/lib/systemd/scripts/vuurmuur
    install -Dm644 ../vuurmuur.service "$pkgdir"/usr/lib/systemd/system/vuurmuur.service

    # install configuration
    install -Dm600 "$pkgdir"/usr/share/vuurmuur/config/config.conf.sample \
                    "$pkgdir"/etc/${pkgname}/config.conf
    install -Dm600 ../modules.conf "$pkgdir"/etc/${pkgname}/modules.conf
    install -Dm600 "$pkgdir"/usr/share/vuurmuur/config/vuurmuur_conf.conf.sample \
                    "$pkgdir"/etc/${pkgname}/${pkgname}_conf.conf

    sed -i "$pkgdir"/etc/${pkgname}/config.conf \
        -e 's|"/sbin/tc|"/usr/bin/tc|' \
        -e 's|"/sbin/ip6tables|"/usr/bin/ip6tables|' \
        -e 's|"/sbin/iptables|"/usr/bin/iptables|' \
        -e 's|"/sbin/ip6tables-restore|"/usr/bin/ip6tables-restore|' \
        -e 's|"/sbin/iptables-restore|"/usr/bin/iptables-restore|'


    echo "LOCATION=\"/etc/${pkgname}/textdir\"" > "$pkgdir"/etc/${pkgname}/plugins/textdir.conf

    # default firewall setup in /usr/share
    touch "$pkgdir"/usr/share/${pkgname}/textdir/rules/rules.conf
    touch "$pkgdir"/usr/share/${pkgname}/textdir/rules/blocklist.conf

#    cp -R zones/*   "$pkgdir"/usr/share/${pkgname}/textdir/zones/
    mv    "$pkgdir"/usr/share/${pkgname}/services/* "$pkgdir"/usr/share/${pkgname}/textdir/services/
}
