# Maintainer: Brian Cole <arch at brianEcole dot com>
# Contributor: Ecmel Ercan <ecmel dot ercan at gmail dot com>
# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: BlindPenguin <ferdinand holzner at gmail dot com>

_gitname=cdesktopenv
pkgname="$_gitname"-git
pkgver=2.3.1
pkgrel=1
pkgdesc="Common Desktop Environment"
url="http://sourceforge.net/projects/cdesktopenv/"
arch=('i686' 'x86_64') # Some parts of CDE are not stable on x86_64 yet.
license=('LGPL2')
options=(!strip !zipman)
install="cdesktopenv.install"
depends=(openmotif xbitmaps rpcbind mksh ncurses libxss xbitmaps libxinerama)
makedepends=(tcl ncompress bison)
optdepends=('xorg-fonts-100dpi: additional fonts'
            'cups: for printing support'
            'xinetd: for rpc services')
conflicts=('cdesktopenv')
backup=('etc/dt/config/xfonts/C/fonts.alias')
source=("git+https://git.code.sf.net/p/cdesktopenv/code"
        'cdesktopenv.install'
        'dtlogin.service'
        'fonts.alias'
        'fonts.dir'
        'startxsession.sh'
        'cde.desktop')

md5sums=('SKIP'
         'ba7fcfcfa2996be6d87b5a90dd94fd7b'
         '18f9ef4643ff7ed6637907f5cbdabecf'
         '5cc80c2851ea90b94e94b0c5d92d81fb'
         '897316929176464ebc9ad085f31e7284'
         '2e5557241915e4c2761ba136dbcba469'
         '7d11b9d2bc1234278f14151025744916')

pkgver() {
    cd "$srcdir/code/cde"
    git describe --long | sed 's/\([0-9]\.[0-9]\.[0-9]\).*/\1/'
}

build() {
    cd "$srcdir/code/cde"

  #sed -e '1i #define FILE_MAP_OPTIMIZE' -i programs/dtfile/Utils.c  # ?

  cat >> config/cf/site.def <<EOF
#define KornShell /bin/mksh
#define CppCmd cpp
#define YaccCmd bison -y
#define HasTIRPCLib YES
#define HasZlib YES
#define DtLocalesToBuild
EOF

#  mkdir -p imports/x11/include
#  ln -sf /usr/include/X11 imports/x11/include/
  
  (
     export LANG=C
     export LC_ALL=C
     export IMAKECPP=cpp
     make -j1 World
  )  

  sed -e "s:mkProd -D :&$pkgdir:" -i admin/IntegTools/dbTools/installCDE
}

package() {
  echo 'DEBUG: start package'
  cd "$srcdir/code/cde/admin/IntegTools/dbTools/"

  echo 'DEBUG: installCDE'
  (
    export LANG=C
    export LC_ALL=C
    export INSTALL_LOCATION="$pkgdir/usr/dt"
    export LOGFILES_LOCATION="$pkgdir/var/dt"
    export CONFIGURE_LOCATION="$pkgdir/etc/dt"
    ./installCDE -s "$srcdir/code/cde" -destdir "$pkgdir"
  )

  echo 'DEBUG: bit fiddling'

  cd "$pkgdir/var/dt/"
  chmod 755 .
  chown bin .
  chgrp bin .
  mkdir -p appconfig/appmanager
  mkdir -p tmp
  chmod -R 755 *
  chown -R bin *
  chgrp -R bin *

  echo 'DEBUG: mkdir'
  cd "$pkgdir/etc/dt/"
  chmod 755 .
  mkdir -p appconfig/appmanager/C
  mkdir -p appconfig/help/C
  mkdir -p appconfig/icons/C
  mkdir -p appconfig/types/C
  mkdir -p config/Xsession.d
  mkdir -p config/xfonts/C
  chmod -R 755 *

  echo 'DEBUG: install stanza'
  chmod a+x $srcdir/startxsession.sh
  install -m644 "$srcdir"/fonts.{alias,dir} "$pkgdir/etc/dt/config/xfonts/C/"
  
  install -Dm644 "$srcdir/cde.desktop" \
                 "$pkgdir/usr/share/xsessions/cde.desktop"
  install -Dm644 "$srcdir/dtlogin.service" \
                 "$pkgdir/usr/lib/systemd/system/dtlogin.service" 

  install -dm755 "$pkgdir/usr/spool"
  install -Dm644 "$srcdir/code/cde/contrib/xinetd/cmsd" \
                 "$pkgdir/etc/xinetd.d/cmsd"
  install -Dm644 "$srcdir/code/cde/contrib/xinetd/ttdbserver" \
                 "$pkgdir/etc/xinetd.d/ttdbserver"
  install -Dm644 "$srcdir/startxsession.sh" \
		 "$pkgdir/usr/bin/startxsession.sh"
}

