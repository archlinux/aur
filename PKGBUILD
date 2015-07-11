pkgname=('kea')
srcname='kea'
pkgver='0.9.2'
pkgrel='1'
pkgdesc='DHCPv4/DHCPv6 server'
arch=('i686' 'x86_64')
url='http://kea.isc.org'
license=('ISC')

depends=(
    'openssl'
    'log4cplus'
    'libmariadbclient'
    'postgresql-libs'
)
optdepends=(
    'mariadb: Lease information database'
    'postgresql: Lease information database'
)
makedepends=(
    'git'
    'boost'
    'openssl'
    'log4cplus'
    'gcc'
    'make'
    'automake'
    'libtool'
    'autoconf'
    'libmariadbclient'
    'postgresql-libs'
    'postgresql'
    'python'
    'perl'
    'gawk'
    'libxslt'
    'docbook-xsl'
    'elinks'
)
provides=('kea')
conflicts=('kea')

source=("${srcname}::git+git://git.kea.isc.org/kea.git#branch=kea-${pkgver}-beta")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/${srcname}"

    # /var/kea -> /var/lib/kea
    find . -type f -exec sed --in-place  \
        --expression='s|/var/kea|/var/lib/kea|g' \
        --expression='s|@localstatedir@/@PACKAGE@|@localstatedir@/lib/@PACKAGE@|g' \
        --expression='s|@@LOCALSTATEDIR@@/@PACKAGE@|@@LOCALSTATEDIR@@/lib/@PACKAGE@|g' \
        --expression='s|\$(localstatedir)/\$(PACKAGE)|\$(localstatedir)/lib/\$(PACKAGE)|g' \
        '{}' '+'

    # /var/run/kea -> /var/cache/kea
    find . -type f -exec sed --in-place \
        --expression='s|/var/run/kea|/var/cache/kea|g' \
        --expression='s|\${localstatedir}/run|\${localstatedir}/cache|g' \
        '{}' '+'

    autoreconf --install

    ./configure \
        --prefix='/usr' \
        --sbindir='${exec_prefix}/bin' \
        --sysconfdir='/etc' \
        --localstatedir='/var' \
        --with-openssl \
        --with-dhcp-mysql \
        --with-dhcp-pgsql \
        --enable-generate-docs
}

build() {
    cd "${srcdir}/${srcname}"

    make
}

package() {
    cd "${srcdir}/${srcname}"

    make DESTDIR="${pkgdir}" install
}
