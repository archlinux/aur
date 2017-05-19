# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('kea')
_srcname='kea'
pkgver='1.2.0'
_commit='8db8de0e102a46bc194d0da73dc1d8083de57bff'
pkgrel='1'
pkgdesc='DHCPv4/DHCPv6 server'
arch=('i686' 'x86_64')
url='http://kea.isc.org'
license=('MPL2.0')

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
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+https://github.com/isc-projects/kea.git#commit=${_commit}")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/${_srcname}"

    # /var/kea -> /var/lib/kea
    # shellcheck disable=SC2016
    find . -path './.git' -prune -or -type f -exec sed --in-place  \
        --expression='s|/var/kea/kea-|/var/kea/|g' \
        --expression='s|/var/kea|/var/lib/kea|g' \
        --expression='s|@localstatedir@/@PACKAGE@|@localstatedir@/lib/@PACKAGE@|g' \
        --expression='s|\$(localstatedir)/\$(PACKAGE)|\$(localstatedir)/lib/\$(PACKAGE)|g' \
        '{}' '+'

    # /var/log -> /var/log/kea
    # shellcheck disable=SC2016
    find . -path './.git' -prune -or -type f -exec sed --in-place  \
        --expression='s|/var/log/kea-|/var/log/|g' \
        --expression='s|/var/log|/var/log/kea|g' \
        --expression='s|\${localstatedir}/log/|\${localstatedir}/log/\${PACKAGE_NAME}|g' \
        --expression='s|@localstatedir@/log/kea-|@localstatedir@/log/|g' \
        --expression='s|@localstatedir@/log|@localstatedir@/log/@PACKAGE@|g' \
        '{}' '+'
}

build() {
    cd "${srcdir}/${_srcname}"

    autoreconf --install --force --warnings='all'
    # shellcheck disable=SC2016
    ./configure \
        --prefix='/usr' \
        --sbindir='${exec_prefix}/bin' \
        --sysconfdir='/etc' \
        --localstatedir='/var' \
        --with-openssl \
        --with-dhcp-mysql \
        --with-dhcp-pgsql \
        --enable-generate-docs

    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make DESTDIR="${pkgdir}" install

    rmdir "${pkgdir}/var/run"{/kea,}
}
