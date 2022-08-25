# Maintainer: Ivan ivabus Bushchik <ivabus@ivabus.dev>
# old Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Submitter: Ecmel Ercan <ecmel dot ercan at gmail dot com>
# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: BlindPenguin <ferdinand holzner at gmail dot com>
# Thanks goes to yjftsjthsd for https://aur.archlinux.org/packages/cdesktopenv-git/ PKGBUILD.
#
pkgname=cdesktopenv
pkgver=2.5.0
pkgrel=1
pkgdesc="CDE - Common Desktop Environment"
url="http://sourceforge.net/projects/cdesktopenv/"
arch=('i686' 'x86_64') # Some parts of CDE are not stable on x86_64 yet.
license=('LGPL2.1')
options=(!strip !zipman)
install="cdesktopenv.install"
depends=(xorg-server-devel gcc dnsutils libxinerama libxss ncurses openmotif rpcbind xbitmaps flex ksh opensp)
makedepends=(tcl ncompress bison rpcsvc-proto)
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
md5sums=('SKIP'
         '66ff27b4c6b7c5fda4e2db69f829e4aa'
         '18f9ef4643ff7ed6637907f5cbdabecf'
         '5cc80c2851ea90b94e94b0c5d92d81fb'
         '897316929176464ebc9ad085f31e7284'
         '7d11b9d2bc1234278f14151025744916'
         '2e5557241915e4c2761ba136dbcba469')
build() {
  cd "$srcdir/code/cde/"
  sed -i '15 a setv mam_cc_FLAGS -lm\nsetv mam_libm -lm' programs/dtksh/ksh93/src/cmd/ksh93/Mamfile
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

