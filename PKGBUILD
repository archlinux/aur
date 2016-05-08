pkgname=nmclient
pkgver=3.0.2
pkgrel=1
pkgdesc="Novell Messenger Client for Linux"
url="http://gwclient.provo.novell.com/"
arch=('i686' 'x86_64')
license=(custom)
provides=('nmclient')
conflictis=('nmclient2')
depends=('bash' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('unzip' 'rpmextract')
depends_i686=('jre' 'glib2' 'libxext' 'gtk2')
depends_x86_64=('bin32-jre' 'lib32-glib2' 'lib32-libxext' 'lib32-gtk2')
source=(https://gwclient.innerweb.novell.com/client/messenger/nim30linux.zip)
md5sums=('e332649760df984b166d39c427d2ae9f')

build() {
    # just extract blob package
  rm -rf "$pkgname-$pkgver"
  mkdir "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  rpmextract.sh "$srcdir"/novell-messenger-client-3.0.2-20151117.x86_64.rpm
  chmod +rx opt usr
}

package() {
  cd "$pkgname-$pkgver"
 
     # prepare directories  
  install -d "$pkgdir"/usr/bin \
         "$pkgdir"/usr/share/nmclient/ \
         "$pkgdir"/usr/share/applications/ \
         "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
  
    # install data and doc files, excluding embedded JRE
  for file in `ls opt/novell/messenger/client/ | egrep -v 'jre'`; do
    cp -R opt/novell/messenger/client/$file "$pkgdir"/usr/share/nmclient/
  done
  
    # install  executable script, and fix java path and LD_LIBRARY_PATH
  mv "$pkgdir"/usr/share/nmclient/run-messenger "$pkgdir"/usr/bin/nmclient
  
  if [ "$CARCH"  == "i686" ]; then
    JAVA_BIN=/usr/bin/java
  elif [ "$CARCH"  == "x86_64" ]; then
    JAVA_BIN=/usr/bin/java32
  fi
  
    # set paths
  sed -e "s#^CLIENT_PATH=.*#CLIENT_PATH=/usr/share/nmclient/#" \
    -i "$pkgdir"/usr/bin/nmclient    
  sed -e "s#LD_LIBRARY_PATH=.*#LD_LIBRARY_PATH=\$JAVA_BIN:\$CLIENT_PATH \\\\#" \
    -e "s#^JAVA_BIN=.*#JAVA_BIN=$JAVA_BIN#"                                    \
    -e "s#^CLIENT_PATH=.*#CLIENT_PATH=/usr/share/nmclient/#"                   \
    -i "$pkgdir"/usr/share/nmclient/launcher
  
    # set Icons and desktop file, and fix their paths
  mv "$pkgdir"/usr/share/nmclient/nmclient.desktop  \
       "$pkgdir"/usr/share/applications/
  mv "$pkgdir"/usr/share/nmclient/nmclient3.png     \
       "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
  
  sed -e 's/Exec=.*/Exec=nmclient/;s/Icon=.*/Icon=nmclient3.png/' \
    -i "$pkgdir"/usr/share/applications/nmclient.desktop
}
