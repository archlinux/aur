# Maintainer: Steven Cook <visage@deadhexagon.com>
pkgname=anope
pkgver=2.0.2
pkgrel=1
pkgdesc="A set of IRC Services designed for flexibility and ease of use"
arch=('i686' 'x86_64')
url="http://www.anope.org/"
license=('GPL')
makedepends=('cmake')
optdepends=(
    'mariadb: MySQL database support'
    'sqlite: SQLite database support'
    'cyrus-sasl: SASL authentication support'
)
install="anope.install"
source=(
    "http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-stable/Anope%20${pkgver}/${pkgname}-${pkgver}-source.tar.gz"
    "anope.install"
    "anope.service"
    "anope.tmpfiles"
)
sha1sums=('ae365d90edbc4cecbfa64cc79f39dca2db0e851c'
          '6cc27cc78fdbac84efbc7e40986fa9412d5f7e9f'
          '9ffa7e103e05cc7fee52e13794ecf7172f3e3f42'
          '7d38218fef729433ca32b81514264beea9981cf8')

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
    cd build
    make
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

