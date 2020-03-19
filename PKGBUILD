# Contributor: Vryali <vryali at gmail dot com>
# Maintainer: rafaelff <rafaelff@gnome.org>

# NOTE: the source gw802linuxclientmulti is a ~200MB file,
#       but the package to be installed has only ~56MB.

pkgname=gwclient
_version=8.0.2
_build=90840
pkgver=${_version}.${_build}
pkgrel=9
pkgdesc="Novell Groupwise 8 Client for Linux"
url="http://gwclient.provo.novell.com/"
arch=('x86_64')
license=(custom)
depends=('libgnome' 'gtk-update-icon-cache' 'desktop-file-utils' 'shared-mime-info'
         'lib32-glibc' 'lib32-libstdc++5' 'bin32-jre6' 'lib32-libxrender' 'lib32-libxt')
source=("https://gwclient.innerweb.novell.com/client/gw802linuxclientmulti.tar.gz"
        groupwise.sh.in)
md5sums=('16b1e563cc60b933ed2444e804ee7562'
         '4bdde9dfc9c1b08bf2c335712ea7a8ad')

prepare() {
    mkdir $pkgname-$pkgver || true
    cd $pkgname-$pkgver

      # Excluding filters save 51MB from java/ and 92M from help/.
      # Remove exclude filter of help/ in order to have help files in the pk
    msg2 "  Extracting tarball and removing embedded JRE and help files"
    bsdtar xf "$srcdir/gw${_version}-${_build}_client_linux_multi/novell-groupwise-client-${_version}-${_build}.i586.rpm" \
        --exclude=java --exclude=help
}

package() {
      # reduce the number of chars by setting variables
    GWDIR=opt/novell/groupwise/client
    JAVA_RUNTIME=/usr/lib32/jvm/java32-6-jre/jre/lib/i386/client/
    MOZ_PLUGIN_PATH=/usr/lib/mozilla
    GWLIBDIR=/usr/lib/gwclient
    
      # prepare system folders and symlinks
    install -d "$pkgdir"/opt/novell/groupwise/bin             \
               "$pkgdir"/usr/bin/                             \
               "$pkgdir"/$GWLIBDIR                            \
               "$pkgdir"/usr/share/applications/              \
               "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
    

    cd "$pkgname-$pkgver"

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
