# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('kea')
_srcname='kea'
pkgver='1.1.0'
_commit='de41bf1dd503a644496ff208b7a0d5503e12d235'
pkgrel='2'
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

source=(
    "${_srcname}::git+https://github.com/isc-projects/kea.git#commit=${_commit}"
    'openssl1_1.patch'
)
sha512sums=(
    'SKIP'
    'a556f44db589f533725de5ea4ed21ff13802ec080f6a24f2d11851a75fcca97f0f4319b6e3cacf94d268bf3d8d2f7160688d842f5b1371fc630d8c337f2e77a9'
)

prepare() {
    cd "${srcdir}/${_srcname}"

    git apply "${srcdir}/openssl1_1.patch"

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
