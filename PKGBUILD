# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Johnothan King <johnothanking dot protonmail at com>
# Contributor: Ivan ivabus Bushchik <ivabus@ivabus.dev>
# Contributor: Brian Cole <arch at brianEcole dot com>
# Contributor: BlindPenguin <ferdinand holzner at gmail dot com>
# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: Ecmel Ercan <ecmel dot ercan at gmail dot com>

pkgname=cdesktopenv
pkgver=2.5.3
pkgrel=1
pkgdesc="The Common Desktop Environment, the classic UNIX desktop"
url="http://sourceforge.net/projects/cdesktopenv/"
arch=('i686' 'x86_64') # Some parts of CDE are not stable on x86_64 yet.
license=('LGPL-2.1-or-later')
options=(!strip !zipman)
install="cdesktopenv.install"
depends=('bash'
         'bind'
         'gcc-libs'
         'glibc'
         'ksh'
         'libice'
         'libjpeg-turbo'
         'libsm'
         'libtirpc'
         'libutempter'
         'libx11'
         'libxau'
         'libxaw'
         'libxcrypt'
         'libxdmcp'
         'libxext'
         'libxinerama'
         'libxmu'
         'libxpm'
         'libxrender'
         'libxss'
         'libxt'
         'ncurses'
         'openmotif'
         'opensp'
         'pam'
         'rpcbind'
         'tcl'
         'xbitmaps'
         'xorg-sessreg'
         'xorg-xrdb')
makedepends=('ncompress'
             'rpcsvc-proto'
             'xorg-bdftopcf'
             'xorg-mkfontscale')
optdepends=('cups: for printing support'
            'xinetd: for rpc services'
            'xorg-fonts-100dpi: additional fonts')
backup=('etc/dt/config/xfonts/C/fonts.alias')
source=("https://downloads.sourceforge.net/project/cdesktopenv/src/cde-$pkgver.tar.gz"
        'cdesktopenv.install'
        'dtlogin.service'
        'fonts.alias'
        'fonts.dir'
        'cde.desktop'
        'startcdesession.sh')
sha256sums=('2b58c08ebf0a6bb9d4a32191cd25e204f5d8cba81bccaa36fc72f5c4aa979854'
            '67ab37acbe7f7610c1e80e408bd25377f3e4fc7cea2b765b7399d3dc04277160'
            'b6ca01a4ea42849e11dba973c02b6d26608c2abb48a13dca0af3b95efec6de7f'
            '5de87d008bc6a8b7d6c2dc0637a127fb1ceea819fdc28a5d466973d302337e90'
            '9a271f2a916b0b6ee6cecb2426f0b3206ef074578be55d9bc94f6f3fe3ab86aa'
            '1db4036888515de17a4b49d7f5ca3d34a5d601cc8696f603b390e98283197125'
            '8a7ba3b3856d4ef05c5703abd8e779df577c6b91931d3d0cc5f04d15dc665d57')

build() {
	cd "cde-$pkgver"
	./autogen.sh
	export CC='gcc -std=c90'
	export TIC="/usr/bin/tic -o${pkgdir}/usr/dt/share/terminfo"
	./configure --with-gnu-ld
	make LDFLAGS=-lm
}

package() {
	cd "cde-$pkgver"
	export LANG=C
	export LC_ALL=C
	make DESTDIR="${pkgdir}" install
	install -dm755 "${pkgdir}/var/dt/"
	install -dm755 "${pkgdir}/var/spool/calendar/"
	install -dm755 "${pkgdir}/usr/spool"
	install -Dm644 -t "${pkgdir}/etc/dt/config/xfonts/C/" "${srcdir}/fonts.alias"
	install -Dm644 -t "${pkgdir}/etc/dt/config/xfonts/C/" "${srcdir}/fonts.dir"
	install -Dm644 -t "${pkgdir}/usr/share/xsessions/" "${srcdir}/cde.desktop"
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/dtlogin.service"
	install -Dm755 -t "${pkgdir}/etc/rc.d/" "${srcdir}/cde-${pkgver}/contrib/rc/linux/dtlogin"
	install -Dm644 -t "${pkgdir}/etc/xinetd.d/" "${srcdir}/cde-${pkgver}/contrib/xinetd/cmsd"
	install -Dm644 -t "${pkgdir}/etc/xinetd.d/" "${srcdir}/cde-${pkgver}/contrib/xinetd/ttdbserver"
	install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/startcdesession.sh"
}
