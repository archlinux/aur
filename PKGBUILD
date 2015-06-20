# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=nmclient
pkgver=2.2.2
pkgrel=5
pkgdesc="Novell Messenger client for linux"
url="http://gwclient.provo.novell.com/"
arch=('i686' 'x86_64')
license=(custom)
install=$pkgname.install
depends=('bash' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('unzip' 'rpmextract')
depends_i686=('java-runtime' 'glib2' 'libxext' 'gtk2')
depends_x86_64=('java32-runtime' 'lib32-glib2' 'lib32-libxext' 'lib32-gtk2')
source=(https://gwclient.innerweb.novell.com/client/messenger/nvlmsgrlinuxrpm.zip)
md5sums=('b10d0015e76edb50eb169193bc919a5a')

build() {
    # just extract blob package
  rm -rf "$pkgname-$pkgver"
  mkdir "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  rpmextract.sh "$srcdir"/nvlmsgrlinux.rpm
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
  
  sed -e "s#LD_LIBRARY_PATH=.*#LD_LIBRARY_PATH=\$JAVA_BIN:\$CLIENT_PATH \\\\#" \
    -e "s#^JAVA_BIN=.*#JAVA_BIN=$JAVA_BIN#" \
    -e "s#^CLIENT_PATH=.*#CLIENT_PATH=/usr/share/nmclient/#" \
    -i "$pkgdir"/usr/bin/nmclient
  
    # set Icons and desktop file, and fix their paths
  mv "$pkgdir"/usr/share/nmclient/nmclient.desktop \
       "$pkgdir"/usr/share/applications/
  mv "$pkgdir"/usr/share/nmclient/nmclient.png \
       "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
  
  sed -e 's/Exec=.*/Exec=nmclient/;s/Icon=.*/Icon=nmclient.png/' \
    -i "$pkgdir"/usr/share/applications/nmclient.desktop
}
