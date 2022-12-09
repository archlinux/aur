# Maintainer: Steven Cook <scook@deadhexagon.com>
# Contributor: Adam Eberlin <ae@adameberlin.com>
pkgname=anope
pkgver=2.0.12
pkgrel=1
pkgdesc="A set of IRC Services designed for flexibility and ease of use"
arch=('i686' 'x86_64')
url="https://www.anope.org/"
license=('GPL')
makedepends=('cmake')
optdepends=(
    'openldap: OpenLDAP backend support'
    'mariadb: MySQL database backend support'
    'sqlite: SQLite database backend support'
    'openssl: OpenSSL support'
    'gnutls: GnuTLS support'
    'pcre: Perl-compatible regular expression support'
)
install="anope.install"
source=(
    "https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
    "anope.install"
    "anope.service"
    "anope.tmpfiles"
)
sha256sums=(
    'eeba1331eaa02a0b05347209604e22df8052d9b10fd19a7633ad1e837f003ff0'
    '310487f9962d9c6f5b968453b7954be40b1c4bf8f591d8ac550e36e6eb80d846'
    '93d656d74d1ab405e1484eb625c7e45843cc2915c492d0c76da890ff55c06ce0'
    'c0e4605b6e92b93f40d3f33a9fe39777c5bc8a0863a3b07c282f7331f5bacc53'
)

prepare() {
    echo "If you want to enable any extra modules before building Anope,"
    echo "please run the 'extras' script in the ${srcdir} directory."
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Create a non-interactive config
    cat << EOF > config.cache
INSTDIR="${srcdir}/install"
RUNGROUP="anope"
UMASK=077
DEBUG="no"
USE_RUN_CC_PL="no"
USE_PCH="no"
EXTRA_INCLUDE_DIRS=""
EXTRA_LIB_DIRS=""
EXTRA_CONFIG_ARGS=""
EOF

    ./Config -nointro -quick
    cd build && make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    make install

    cd "${srcdir}/install"

    # Create directories
    install -Dd "${pkgdir}"{/var/log,/var/lib,/etc,/usr/lib}/${pkgname}
    install -Dd "${pkgdir}/var/lib/${pkgname}/runtime"
    install -Dd "${pkgdir}/usr/bin"
    install -Dd "${pkgdir}/usr/lib/${pkgname}"/{modules,locale}

    # Copy files

    # We don't need to copy anoperc or example.chk, since systemd
    # takes care of all of that now.

    # Executable files
    install -Dm755 bin/{anopesmtp,services} "${pkgdir}/usr/bin"

    # Configuration files
    install -Dm644 conf/*.conf "${pkgdir}/etc/${pkgname}"

    # Loadable modules
    install -Dm644 lib/modules/* "${pkgdir}/usr/lib/${pkgname}/modules"

    # Systemd service file
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # tmpfiles config
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/etc/tmpfiles.d/${pkgname}.conf"

    cp -r data/* "${pkgdir}/var/lib/${pkgname}"
    cp -r locale/* "${pkgdir}/usr/lib/${pkgname}/locale"
}
