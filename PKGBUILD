# Maintainer: Steven Cook <scook@deadhexagon.com>
# Contributor: Adam Eberlin <ae@adameberlin.com>
pkgname=anope
pkgver=2.0.15
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
sha512sums=(
    'e3acf6a45f68aa00c75a8d7bb8479e823af9e0dba3ae6e4bf18fd0d51ea1ce6fb77301aee50692ef8111aab20a44017af48e4ae756348194071db1b32883851f'
    '81bc1bbb504fa021417312a72799b04682e54dd0dd1e070a035d62fa66ac7fa8ee3cb1c8ffe3746c4569e7716d591cfa14e9631571a74a4b8224fae18fd50bef'
    '6535e075c27a124e3aeb45f1496194a70130da88e2eae29a80ac3d33754ce4020b405438681690b3df032b386bccbb3f65983ad84f85fe76f3562e744ea55b52'
    '5c58a55c7e5974dec516f43eb960c9cdcadb68c92ceeaed7d96c82c180f8073d76d7491575331bca46f4714b19cdb188fe1bd056efb3391e3b3113c076407d21'
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
