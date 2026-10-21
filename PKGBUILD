# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Maintainer: Pau Espin Pedrol <pespin@espeweb.net>
# Contributor: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=titan-git
_pkgname=titan.core
pkgver=10.1.2.r15.ge86dfd732
pkgrel=2
pkgdesc="TTCN3 test automation platform"
arch=('i686' 'x86_64')
url="https://projects.eclipse.org/projects/tools.titan"
license=('EPL-2.0')
groups=('devel')
makedepends=(
    'bison'
    'flex'
    'java-environment'
    'git'
    'perl'
)
depends=(
    'expect'
    'libedit'
    'libxml2'
    'ncurses'
    'openssl'
)
source=(git+https://gitlab.eclipse.org/eclipse/titan/titan.core.git
        titan.profile)
sha256sums=('SKIP'
            '6ac15bc40cbfce771ca828d2402e82a43c72fbcb4f2afb8714340bfd4133e9ff')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# LTO breaks linking: create_legacy_logger is declared as a variable in
# LoggerPluginManager.cc, but defined as a function in LegacyLogger.cc.
# See https://gitlab.eclipse.org/eclipse/titan/titan.core/-/work_items/815.
options=(!lto)

prepare() {
    cd $srcdir/$_pkgname
    rm -f Makefile.personal
    echo "STRIP := :" >> Makefile.personal
    echo "TTCN3_DIR := /usr/ttcn3" >> Makefile.personal
    echo "JDKDIR := /usr/lib/jvm/default" >> Makefile.personal
    # TITAN uses CCFLAGS (not CFLAGS) for C sources
    echo 'CCFLAGS += $(ARCH_CFLAGS)' >> Makefile.personal
    echo 'CXXFLAGS += $(ARCH_CXXFLAGS)' >> Makefile.personal
    echo 'CPPFLAGS += $(ARCH_CPPFLAGS)' >> Makefile.personal
    echo 'LDFLAGS += $(ARCH_LDFLAGS)' >> Makefile.personal
}

build() {
    cd $srcdir/$_pkgname
    # TITAN's Makefiles append per-directory flags to CXXFLAGS & co. and then
    # spawn sub-makes in other directories; if these variables come from the
    # environment, make exports the modified values and they leak across
    # directories (e.g. -fno-exceptions, -DTITAN_RUNTIME_2).  Pass makepkg's
    # flags under different names instead.
    export ARCH_CFLAGS="$CFLAGS" ARCH_CXXFLAGS="$CXXFLAGS"
    export ARCH_CPPFLAGS="$CPPFLAGS" ARCH_LDFLAGS="$LDFLAGS"
    unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
    make dep
    make
}

package() {
    cd $srcdir/$_pkgname
    make \
        TTCN3_DIR=$pkgdir/usr/ttcn3 \
        ETCDIR=$pkgdir/usr/ttcn3/etc \
        MANDIR=$pkgdir/usr/share/man \
        DOCDIR=$pkgdir/usr/share/doc/titan \
        HELPDIR=$pkgdir/usr/share/doc/titan/html \
        DEMODIR=$pkgdir/usr/share/doc/titan/demo \
        install

    # Fix reference to $pkgdir in the demo Makefile
    sed -i "s#TTCN3_DIR = .*#TTCN3_DIR = /usr/ttcn3#" \
        "$pkgdir/usr/share/doc/titan/demo/Makefile"

    install -D $srcdir/titan.profile \
        $pkgdir/etc/profile.d/titan.sh
}
