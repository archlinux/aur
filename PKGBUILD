# Maintainer: Python Shell <pythonshell@yeah.net>

pkgname=cbmc
pkgver=5.8
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
# No longer need subversion
makedepends=('flex' 'bison' 'make' 'patch' 'perl-libwww')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-git' 'cbmc-bin')
source=("https://github.com/diffblue/cbmc/archive/cbmc-5.8.tar.gz")
sha256sums=('8d40a4c2f25315df769773eb01f939d94db1fdc1c39a7953d510289fec142fd6')

_pkg_src_root="${pkgname}-${pkgname}-${pkgver}"

build() {
    cd "${srcdir}/${_pkg_src_root}/src/"
    # Makefile typo fix
    # No longer typo in 5.8, 20171201
    #sed -i '/libzip_1.1.2.orig/a\\t\@mv libzip_1.1.2.orig.tar.gz libzip-1.1.2.tar.gz' Makefile
    # Remove -Werror in config.inc::CXXFLAGS
    sed -i '/  CXXFLAGS += -Wall -pedantic -Werror/c\  CXXFLAGS += -Wall -pedantic' config.inc
    make minisat2-download
    # No longer need these two
    #make libzip-download zlib-download
    #make libzip-build
    make
}

package() {
    install -D "${srcdir}/${_pkg_src_root}/src/cbmc/cbmc"\
        "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/${_pkg_src_root}/src/goto-cc/goto-cc"\
        "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/${_pkg_src_root}/src/goto-instrument/goto-instrument"\
        "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/${_pkg_src_root}/LICENSE"\
        "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
