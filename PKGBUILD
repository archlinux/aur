# Maintainer: Steven Cook <scook@deadhexagon.com>
# Contributor: Adam Eberlin <ae@adameberlin.com>

pkgname=anope
pkgver=2.0.20
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
    'anope.install'
    'anope.service'
    'anope.conf'
    'anope.tmpfiles'
)
sha512sums=('f3f7e4b491f0b4999f82806722d2d803b5c383f6927eb3dc0425d8ab29adbc9c48d04c7e907dcf915abc57077c5f70f648822ba5996eaa10e06be93371d73cdd'
            '81bc1bbb504fa021417312a72799b04682e54dd0dd1e070a035d62fa66ac7fa8ee3cb1c8ffe3746c4569e7716d591cfa14e9631571a74a4b8224fae18fd50bef'
            '0e1465aec499276c26b23e5ca4cc3df1c3250547cfdb007e4ded931b57bda4a650e33904d862c49603d30d7f36dd3c5e8b72f01a6f63fb7684afea9ef3158f32'
            'a79678ca5a9de2484283d9c979eb0ebdf8d3312f802279fa68083bf3ed635ff5044eef73e6fbd6a769e28e87ec0306e5eeec49480d429d8cc2517996796fc739'
            '5c58a55c7e5974dec516f43eb960c9cdcadb68c92ceeaed7d96c82c180f8073d76d7491575331bca46f4714b19cdb188fe1bd056efb3391e3b3113c076407d21')

prepare() {
    echo -en "This package does not buid extra Anope modules by default.\n\n"
    echo -en "If you want to enable any extra modules before building Anope, please\n"
    echo -en "run the 'extras' script in the '${srcdir}/${pkgname}-${pkgver}'\n"
    echo -en "directory prior to running makepkg.\n"
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

    # conf.d entry
    install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/conf.d/${pkgname}"

    # tmpfiles config
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/etc/tmpfiles.d/${pkgname}.conf"

    cp -r data/* "${pkgdir}/var/lib/${pkgname}"
    cp -r locale/* "${pkgdir}/usr/lib/${pkgname}/locale"
}
