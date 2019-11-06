# Maintainer: Steven Cook <visage@deadhexagon.com>
# Contributor: Adam Eberlin <ae@adameberlin.com>
pkgname=anope
pkgver=2.0.7
pkgrel=1
pkgdesc="A set of IRC Services designed for flexibility and ease of use"
arch=('i686' 'x86_64')
url="http://www.anope.org/"
license=('GPL')
makedepends=('cmake')
optdepends=(
    'mariadb: MySQL database backend support'
    'sqlite: SQLite database backend support'
)
install="anope.install"
source=(
    "https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-source.tar.gz"
    "anope.install"
    "anope.service"
    "anope.tmpfiles"
)
sha256sums=(
    '4507d6c127b3bc5a95414217049e01e2b605b1f817d5519b8e5d03acebc5dbab'
    '310487f9962d9c6f5b968453b7954be40b1c4bf8f591d8ac550e36e6eb80d846'
    '93d656d74d1ab405e1484eb625c7e45843cc2915c492d0c76da890ff55c06ce0'
    'c0e4605b6e92b93f40d3f33a9fe39777c5bc8a0863a3b07c282f7331f5bacc53'
)

prepare() {
    echo "If you want to enable any extra modules before building Anope,"
    echo "please run the ./extras script in the Anope source directory."
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-source"

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
    cd "${srcdir}/${pkgname}-${pkgver}-source/build"

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
