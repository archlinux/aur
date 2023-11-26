# Maintainer: Phillip Kühne <mail@phillipkuehne.de>
# Contributor: Eric DeStefano <eric at ericdestefano dot com>
# Contributor: Iñigo Alvarez <alvarezviu@gmail.com>
# Contributor: William Termini <aur@termini.me>
pkgname='minivmacii'
pkgver='36.04'
pkgrel=1
pkgdesc="a miniature Macintosh II emulator"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.gryphel.com/c/minivmac/"
license=('GPL2')
makedepends=(tar)
depends=('libx11')
source=("https://www.gryphel.com/d/minivmac/minivmac-${pkgver}/minivmac-${pkgver}.src.tgz" 'minivmacii.desktop')
md5sums=('c84168a8d7df5f1f66270720c48c906c' '023f65e824000e7f213df2b467a59a99')

# Custom variables below this
# Screen depth. See https://www.gryphel.com/c/minivmac/options.html#option_depth
depth=3

prepare() {
    cd $srcdir/minivmac
    gcc setup/tool.c -o setup_t
}

build() {
    setupflags='-m II '
    cd $srcdir/minivmac
    # Set cpu architecture
    if [ "${CARCH}" == 'x86_64' ]; then
        setupflags+='-t lx64'
    elif [ "${CARCH}" == 'i686' ]; then
        setupflags+='-t lx86'
    elif [ "${CARCH}" == 'armv7h' ] || [ "${CARCH}" == 'aarch64' ]; then
        setupflags+='-t larm'
    fi
    # Set screen depth
    setupflags+=" -depth $depth"
    # Set language (https://www.gryphel.com/c/minivmac/options.html#option_lang)
    hostlang=$(locale | grep LANG | cut -d= -f2 | cut -d_ -f1)
    if [ "${hostlang}" == 'en' ]; then
        setupflags+=' -lang eng'
    elif [ "${hostlang}" == 'de' ]; then
        setupflags+=' -lang ger'
    elif [ "${hostlang}" == 'fr' ]; then
        setupflags+=' -lang fre'
    elif [ "${hostlang}" == 'es' ]; then
        setupflags+=' -lang spa'
    elif [ "${hostlang}" == 'it' ]; then
        setupflags+=' -lang ita'
    elif [ "${hostlang}" == 'nl' ]; then
        setupflags+=' -lang dut'
    elif [ "${hostlang}" == 'pt' ]; then
        setupflags+=' -lang ptb'
    elif [ "${hostlang}" == 'sr' ]; then
        setupflags+=' -lang srl'
    elif [ "${hostlang}" == 'pl' ]; then
        setupflags+=' -lang pol'
    elif [ "${hostlang}" == 'ca' ]; then
        setupflags+=' -lang cat'
    elif [ "${hostlang}" == 'cs' ]; then
        setupflags+=' -lang cze'
    fi
    ./setup_t $setupflags > setup.sh
    chmod +x setup.sh
    ./setup.sh
    make
}

package() {
    cd $srcdir/minivmac
    install -Dm755 minivmac "$pkgdir"/usr/bin/$pkgname
    install -Dm644 src/ICONAPPW.ico "${pkgdir}/usr/share/${pkgname}/${pkgname}.ico"
    install -Dm644 $srcdir/minivmacii.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
