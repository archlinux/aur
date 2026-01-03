# Maintainer: Rubin Simons <me@rubin55.org>
# Contributor: Sidney Kuyateh <autinerd-arch at kuyateh dot eu>
# Contributor: Brian Cole <arch at brianEcole dot com>
# Contributor: Ecmel Ercan <ecmel dot ercan at gmail dot com>
# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: BlindPenguin <ferdinand holzner at gmail dot com>

_gitname=cdesktopenv
pkgname="${_gitname}"-git
pkgver=2.5.3.30.gdd3fd3ddf
pkgrel=1
pkgdesc="Common Desktop Environment"
url="http://sourceforge.net/projects/cdesktopenv/"
arch=('x86_64')
license=('LGPL2')
options=(!strip !zipman)
install="cdesktopenv.install"
depends=(
    libutempter
    libxaw 
    libxinerama
    libxpm
    libxss
    mksh
    ncurses
    openmotif
    opensp
    rpcbind
    rpcsvc-proto
    xbitmaps
    xbitmaps
    xorg-bdftopcf
    xorg-fonts-misc
    xorg-mkfontdir
    xorg-sessreg
    xorg-xrdb
)
makedepends=(
    tcl
    ncompress
    bison
)
optdepends=(
    'xorg-fonts-100dpi: additional fonts'
    'cups: for printing support'
    'xinetd: for rpc services'
)
conflicts=('cdesktopenv')
backup=('etc/dt/config/xfonts/C/fonts.alias')
source=('git+https://git.code.sf.net/p/cdesktopenv/code'
    'cdesktopenv.install'
    'dtlogin.service'
    'fonts.alias'
    'fonts.dir'
    'startcdesession.sh'
    'cde.desktop')

sha256sums=('SKIP'
            'c7b9114eba1a89991a4abeb0b87cd7420f7301c341e29593901125214ea86e4d'
            'b6ca01a4ea42849e11dba973c02b6d26608c2abb48a13dca0af3b95efec6de7f'
            '5de87d008bc6a8b7d6c2dc0637a127fb1ceea819fdc28a5d466973d302337e90'
            '9a271f2a916b0b6ee6cecb2426f0b3206ef074578be55d9bc94f6f3fe3ab86aa'
            '8a7ba3b3856d4ef05c5703abd8e779df577c6b91931d3d0cc5f04d15dc665d57'
            '1db4036888515de17a4b49d7f5ca3d34a5d601cc8696f603b390e98283197125')

pkgver() {
    cd "$srcdir/code/cde"
    git describe --long --tags | sed 's/-/./g'
}

build() {
    export TIC="/usr/bin/tic -o${pkgdir}/usr/share/terminfo"
    cd "$srcdir/code/cde"
    ./autogen.sh
    ./configure --with-gnu-ld --prefix="/usr/dt"
    make CFLAGS="-std=c99 -I /usr/include/tirpc" LDFLAGS="-lm" 
}

package() {
    install -d -m 755 -o bin -g bin "$pkgdir/var/dt"
    install -d -m 755 -o bin -g bin "$pkgdir/var/dt/appconfig"
    install -d -m 755 -o bin -g bin "$pkgdir/var/dt/appconfig/appmanager"
    install -d -m 755 -o bin -g bin "$pkgdir/var/dt/tmp"

    mkdir -p "$pkgdir/etc/dt"
    mkdir -p "$pkgdir/etc/dt/appconfig/appmanager/C"
    mkdir -p "$pkgdir/etc/dt/appconfig/help/C"
    mkdir -p "$pkgdir/etc/dt/appconfig/icons/C"
    mkdir -p "$pkgdir/etc/dt/appconfig/types/C"
    mkdir -p "$pkgdir/etc/dt/config/Xsession.d"
    mkdir -p "$pkgdir/etc/dt/config/xfonts/C"

    install -m644 "$srcdir"/fonts.{alias,dir} "$pkgdir/etc/dt/config/xfonts/C/"
    install -Dm644 "$srcdir/cde.desktop" "$pkgdir/usr/share/xsessions/cde.desktop"
    install -Dm644 "$srcdir/dtlogin.service" "$pkgdir/usr/lib/systemd/system/dtlogin.service" 

    install -dm755 "$pkgdir/var/spool/calendar"
    install -Dm644 "$srcdir/code/cde/contrib/xinetd/cmsd" "$pkgdir/etc/xinetd.d/cmsd"
    install -Dm644 "$srcdir/code/cde/contrib/xinetd/ttdbserver" "$pkgdir/etc/xinetd.d/ttdbserver"
    install -Dm755 "$srcdir/startcdesession.sh" "$pkgdir/usr/bin/startcdesession.sh"

    export LANG=C
    export LC_ALL=C 
    cd "$srcdir/code/cde"
    make install DESTDIR="$pkgdir"

    # dtterm terminfo is provided by ncurses
    rm "$pkgdir/usr/share/terminfo/d/dtterm"
}
