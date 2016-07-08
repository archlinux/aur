# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=nmclient2
pkgver=2.2.2
pkgrel=2
pkgdesc="Novell Messenger client for linux (version 2)"
url="http://gwclient.provo.novell.com/"
arch=('i686' 'x86_64')
license=(custom)
provides=("nmclient")
conflicts=("nmclient")
makedepends=('unzip' 'rpmextract')
depends_i686=('java-runtime' 'gtk2' 'libxss' 'libpng12' 'glitz')
depends_x86_64=('java32-runtime'  'lib32-gtk2' 'lib32-libxss' 'lib32-libpng12' 'lib32-glitz')
source=("https://nm-pers.hj.se:8300/~down/client/xplat/linux/nvlmsgr.bin")
   # another source URL: https://gwm.health.unm.edu:8300/~down/client/xplat/linux/nvlmsgr.bin
md5sums=('d2f94e16858f1f06385ade028557e810')

prepare() {
   msg2 "patching the source file..."
   sed -e "s/^TMP_DIR=.*/TMP_DIR=$pkgname-$pkgver/" -i nvlmsgr.bin
}

build() {
  rm -rf "$pkgname-$pkgver"
  
    # obtain rpmfile, although it can't find rpm executable - no problem here
  msg2 "obtaining RPM file from BIN file..."
  fakeroot sh ./nvlmsgr.bin 2> /dev/null || true
    # just extract rpm package
  msg2 "extracting RPM file..."
  cd "$pkgname-$pkgver"
  rpmextract.sh nmclient/novell-messenger-client-2.2.2-20150416.i586.rpm
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
  
    # install executable script, and fix java path and LD_LIBRARY_PATH
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
