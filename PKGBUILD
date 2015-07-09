# Submitter: Ecmel Ercan <ecmel dot ercan at gmail dot com>
# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
#
# New Maintainer: BlindPenguin <ferdinand holzner at gmail dot com>
#
pkgname=cdesktopenv
pkgver=2.2.0d
pkgrel=1
pkgdesc="CDE - Common Desktop Environment"
url="http://sourceforge.net/projects/cdesktopenv/"
arch=('i686' 'x86_64') # Some parts of CDE are not stable on x86_64 yet.
license=('LGPL2')
options=(!strip !zipman)
depends=(openmotif xbitmaps rpcbind mksh ncurses)
makedepends=(tcl ncompress)
optdepends=('xorg-fonts-100dpi: additional fonts'
            'cups: for printing support'
            'xinetd: for rpc services')
backup=('etc/dt/config/xfonts/C/fonts.alias')
source=("http://downloads.sourceforge.net/$pkgname/cde-src-$pkgver-beta.tar.gz"
        'dtlogin.service'
        'fonts.alias'
        'fonts.dir'
        'cde.desktop'
	'startxsession.sh')

md5sums=('6ebda6347706c2aac361e399acad2120'
         '18f9ef4643ff7ed6637907f5cbdabecf'
         '5cc80c2851ea90b94e94b0c5d92d81fb'
         '897316929176464ebc9ad085f31e7284'
         'f4c8125c54dbed1e91ce859b7ad6a365'
         '2e5557241915e4c2761ba136dbcba469')

build() {
  cd "$srcdir/cde-$pkgver/"

  sed -e '1i #define FILE_MAP_OPTIMIZE' -i programs/dtfile/Utils.c

  cat >> config/cf/site.def <<EOF
#define KornShell /bin/mksh
#define CppCmd cpp
#define YaccCmd bison -y
#define HasTIRPCLib YES
#define HasZlib YES
#define DtLocalesToBuild
EOF

  mkdir -p imports/x11/include
  ln -sf /usr/include/X11 imports/x11/include/
  
  (
     export LANG=C
     export LC_ALL=C
     export IMAKECPP=cpp
     make -j1 World
  )  

  sed -e "s:mkProd -D :&$pkgdir:" -i admin/IntegTools/dbTools/installCDE
}

package() {
  cd "$srcdir/cde-$pkgver/admin/IntegTools/dbTools/"

  (
    export LANG=C
    export LC_ALL=C
    export INSTALL_LOCATION="$pkgdir/usr/dt"
    export LOGFILES_LOCATION="$pkgdir/var/dt"
    export CONFIGURE_LOCATION="$pkgdir/etc/dt"
    ./installCDE -s "$srcdir/cde-$pkgver"
  )

  cd "$pkgdir/var/dt/"
  chmod 755 .
  chown bin .
  chgrp bin .
  mkdir -p appconfig/appmanager
  mkdir -p tmp
  chmod -R 755 *
  chown -R bin *
  chgrp -R bin *

  cd "$pkgdir/etc/dt/"
  chmod 755 .
  mkdir -p appconfig/appmanager/C
  mkdir -p appconfig/help/C
  mkdir -p appconfig/icons/C
  mkdir -p appconfig/types/C
  mkdir -p config/Xsession.d
  mkdir -p config/xfonts/C
  chmod -R 755 *

  chmod a+x $srcdir/startxsession.sh
  install -m644 "$srcdir"/fonts.{alias,dir} "$pkgdir/etc/dt/config/xfonts/C/"
  
  install -Dm644 "$srcdir/cde.desktop" \
                 "$pkgdir/usr/share/xsessions/cde.desktop"
  install -Dm644 "$srcdir/dtlogin.service" \
                 "$pkgdir/usr/lib/systemd/system/dtlogin.service" 
  install -Dm755 "$srcdir/cde-$pkgver/contrib/rc/linux/dtlogin" \
                 "$pkgdir/etc/rc.d/dtlogin"

  install -dm755 "$pkgdir/usr/spool"
  install -Dm644 "$srcdir/cde-$pkgver/contrib/xinetd/cmsd" \
                 "$pkgdir/etc/xinetd.d/cmsd"
  install -Dm644 "$srcdir/cde-$pkgver/contrib/xinetd/ttdbserver" \
                 "$pkgdir/etc/xinetd.d/ttdbserver"
  install -Dm644 "$srcdir/startxsession.sh" \
		 "$pkgdir/usr/bin/startxsession.sh"
}

