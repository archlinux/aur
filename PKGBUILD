# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Submitter: Ecmel Ercan <ecmel dot ercan at gmail dot com>
# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: BlindPenguin <ferdinand holzner at gmail dot com>
# Contributor: Ivan ivabus Bushchik <ivabus@ivabus.dev>
# Contributor: Johnothan King <johnothanking dot protonmail at com>
# Thanks goes to yjftsjthsd for https://aur.archlinux.org/packages/cdesktopenv-git/ PKGBUILD.
#
pkgname=cdesktopenv
pkgver=2.5.1
pkgrel=1
pkgdesc="CDE - Common Desktop Environment"
url="http://sourceforge.net/projects/cdesktopenv/"
arch=('i686' 'x86_64') # Some parts of CDE are not stable on x86_64 yet.
license=('LGPL2.1')
options=(!strip !zipman)
install="cdesktopenv.install"
depends=(dnsutils libxinerama libxss ncurses openmotif rpcbind xbitmaps flex ksh opensp)
makedepends=(tcl ncompress bison rpcsvc-proto xorg-mkfontscale xorg-bdftopcf)
optdepends=('xorg-fonts-100dpi: additional fonts'
            'cups: for printing support'
            'xinetd: for rpc services')
backup=('etc/dt/config/xfonts/C/fonts.alias')
source=("git+https://git.code.sf.net/p/cdesktopenv/code#tag=${pkgver}"
        'cdesktopenv.install'
        'dtlogin.service'
        'fonts.alias'
        'fonts.dir'
        'cde.desktop'
        'startxsession.sh')
sha256sums=('SKIP'
            '51311576857d8c539fab23795bd9353c8a0c58c4e1b2b1fafef6b69fb7fbd0fb'
            'b6ca01a4ea42849e11dba973c02b6d26608c2abb48a13dca0af3b95efec6de7f'
            '5de87d008bc6a8b7d6c2dc0637a127fb1ceea819fdc28a5d466973d302337e90'
            '9a271f2a916b0b6ee6cecb2426f0b3206ef074578be55d9bc94f6f3fe3ab86aa'
            'b355515c6c4dc33fd554064ca8061d8ea8c08c7266c39e7a736e5d1f206212d3'
            '8a7ba3b3856d4ef05c5703abd8e779df577c6b91931d3d0cc5f04d15dc665d57')

build() {
  cd "$srcdir/code/cde/"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "$srcdir/code/cde"
  make DESTDIR="$pkgdir/" install

  # installing additional things. Without them CDE won't work
  mkdir -p $pkgdir/var/spool/calendar

  chmod a+x $srcdir/startxsession.sh
  mkdir -p $pkgdir/etc/dt/config/xfonts/C/ $pkgdir/etc/rc.d $pkgdir/etc/xinet.d
  install -m644 "$srcdir"/fonts.{alias,dir} "$pkgdir/etc/dt/config/xfonts/C/"

  install -Dm644 "$srcdir/cde.desktop" \
                 "$pkgdir/usr/share/xsessions/cde.desktop"
  install -Dm644 "$srcdir/dtlogin.service" \
                 "$pkgdir/usr/lib/systemd/system/dtlogin.service"
  install -Dm755 "$srcdir/code/cde/contrib/rc/linux/dtlogin" \
                 "$pkgdir/etc/rc.d/dtlogin"

  install -dm755 "$pkgdir/usr/spool"
  install -Dm644 "$srcdir/code/cde/contrib/xinetd/cmsd" \
                 "$pkgdir/etc/xinetd.d/cmsd"
  install -Dm644 "$srcdir/code/cde/contrib/xinetd/ttdbserver" \
                 "$pkgdir/etc/xinetd.d/ttdbserver"
  install -Dm644 "$srcdir/startxsession.sh" \
		 "$pkgdir/usr/bin/startxsession.sh"
}
