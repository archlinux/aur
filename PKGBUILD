pkgname=('ulogd-git')
srcname='ulogd'
pkgbase='ulogd-git'
pkgdesc='Userspace logging daemon for netfilter/iptables related logging'
pkgver='r1'
pkgrel='1'
arch=('i686' 'x86_64')
url='http://www.netfilter.org/projects/ulogd/index.html'
license=('GPL2')

depends=(
    'libmnl'
    'libnetfilter_acct'
    'libnetfilter_conntrack'
    'libnetfilter_log'
    'libnfnetlink'
)
makedepends=(
    'libmariadbclient'
    'libpcap'
    'libdbi'
    'postgresql-libs'
    'sqlite'
    'jansson'
)
optdepends=(
    'libmariadbclient: MySQL databases support'
    'sqlite: SQLite3 databases support'
    'postgresql-libs: PostgreSQL databases support'
    'libdbi: DBI abstraction databases support'
    'libpcap: PCAP output support'
    'jansson: JSON output support'
)
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=(
    "${srcname}::git+git://git.netfilter.org/ulogd2"
    'ulogd.service'
    'ulogd.logrotate'
    'ulogd.conf'
)
sha512sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

build() {
    cd "${srcdir}/${srcname}"

    autoreconf --install --force --warnings='all'
    ./configure \
        --prefix='/usr' \
        --sbindir='/usr/bin' \
        --sysconfdir='/etc' \
        --with-mysql \
        --with-pgsql \
        --with-dbi

    make
}

package() {
    cd "${srcdir}/${srcname}"

    make DESTDIR="${pkgdir}" install

    install --directory "${pkgdir}/usr/share/doc/ulogd"
    install --mode='644' ulogd.conf doc/*.{table,sql} "${pkgdir}/usr/share/doc/ulogd/"

    cd "${srcdir}"
    install -D --mode='644' ulogd.service "${pkgdir}/usr/lib/systemd/system/ulogd.service"
    install -D --mode='644' ulogd.logrotate "${pkgdir}/etc/logrotate.d/ulogd"
    install -D --mode='644' ulogd.conf "${pkgdir}/etc/ulogd.conf"
}
