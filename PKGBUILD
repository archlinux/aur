# Contributor: Vryali <vryali at gmail dot com>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

# NOTE: the source gw802linuxclientmulti is a ~200MB file,
#       but the package to be installed has only ~56MB.

pkgname=gwclient
_version=8.0.2
_build=90840
pkgver=${_version}.${_build}
pkgrel=8
pkgdesc="Novell Groupwise 8 Client for Linux"
url="http://gwclient.provo.novell.com/"
arch=('i686' 'x86_64')
license=(custom)
install=$pkgname.install
depends=('libgnome' 'hicolor-icon-theme' 'desktop-file-utils')
depends_i686=('glibc' 'libstdc++5' 'java-runtime' 'libxrender' 'libgnome' 'libxt')
depends_x86_64=('lib32-glibc' 'lib32-libstdc++5' 'java32-runtime' 'lib32-libxrender' 'lib32-libxt')
makedepends=('rpmextract' 'prelink')
source=(https://gwclient.innerweb.novell.com/client/gw802linuxclientmulti.tar.gz
        groupwise.sh.in)
md5sums=('16b1e563cc60b933ed2444e804ee7562'
         '4bdde9dfc9c1b08bf2c335712ea7a8ad')

package() {
      # reduce the number of chars by setting variables
    GWDIR=opt/novell/groupwise/client
    if [ $CARCH == x86_64 ]; then
      JAVA_RUNTIME=/usr/lib32/jvm/default-runtime/lib/i386/client/
      MOZ_PLUGIN_PATH=/usr/lib32/mozilla
      GWLIBDIR=/usr/lib32/gwclient      
    elif [ $CARCH == i686 ]; then
      JAVA_RUNTIME=/usr/lib/jvm/default-runtime/lib/i386/client/
      MOZ_PLUGIN_PATH=/usr/lib/mozilla
      GWLIBDIR=/usr/lib/gwclient
    fi
    
      # prepare system folders and symlinks
    install -d "$pkgdir"/opt/novell/groupwise/bin             \
               "$pkgdir"/usr/bin/                             \
               "$pkgdir"/$GWLIBDIR                            \
               "$pkgdir"/usr/share/applications/              \
               "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
    
       msg2 "  Extracting tarball and removing embedded JRE and help files"
    [ -d "$pkgname-$pkgver" ] && rm -rf "$pkgname-$pkgver"
    mkdir "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    ls "$srcdir/gw${_version}-${_build}_client_linux_multi/novell-groupwise-client-${_version}-${_build}.i586.rpm" | xargs rpmextract.sh

      # remove/comment this line to NOT remove all Help files
      # (it will increase the package size in ~90MB)
    rm -rf $GWDIR/lib/help
    
      # remove JRE; use distribution's JavaRE package instead
    rm -rf $GWDIR/java
    
       msg2 "  Fixing lib's stack guard"
      # fix this lib's stack guard (eliminate warning in the console)
    execstack -c $GWDIR/lib/libgwapijni.so.1

       msg2 "  Installing /opt, binaries and libraries"
    mv $GWDIR/bin/groupwise-bin "$pkgdir"/opt/novell/groupwise/bin
    ln -s $GWLIBDIR "$pkgdir"/opt/novell/groupwise/lib
    
      # install binaries
    install -m755 "$srcdir"/groupwise.sh.in "$pkgdir"/usr/bin/groupwise
    sed -i "$pkgdir"/usr/bin/groupwise             \
        -e "s#@JAVA_RUNTIME@#$JAVA_RUNTIME#"       \
        -e "s#@MOZ_PLUGIN_PATH@#$MOZ_PLUGIN_PATH#" \
        -e "s#@GWLIBDIR@#$GWLIBDIR#"
    
      # install libraries
    mv $GWDIR/lib/* "$pkgdir"/$GWLIBDIR
    
       msg2 "  Installing icons and desktop files"
    mv $GWDIR/gwclient.desktop "$pkgdir"/usr/share/applications/
    mv $GWDIR/gwclient.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
    
      # fix Name and Exec and Icon paths in the desktop file
    sed -i "$pkgdir"/usr/share/applications/gwclient.desktop \
        -e 's/Name=.*/Name=Novell GroupWise/'                \
        -e 's/Exec=.*/Exec=groupwise/'                       \
        -e 's/Icon=.*/Icon=gwclient.png/'
}
