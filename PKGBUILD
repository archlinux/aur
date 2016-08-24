pkgname=('kea-git')
_srcname='kea'
pkgver='r1'
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

source=("${_srcname}::git+https://github.com/isc-projects/kea.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

prepare() {
    cd "${srcdir}/${_srcname}"

    # /var/kea -> /var/lib/kea
    find . -path './.git' -prune -or -type f -exec sed --in-place  \
        --expression='s|/var/kea/kea-|/var/kea/|g' \
        --expression='s|/var/kea|/var/lib/kea|g' \
        --expression='s|@localstatedir@/@PACKAGE@|@localstatedir@/lib/@PACKAGE@|g' \
        --expression='s|\$(localstatedir)/\$(PACKAGE)|\$(localstatedir)/lib/\$(PACKAGE)|g' \
        '{}' '+'

    # /var/log -> /var/log/kea
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
