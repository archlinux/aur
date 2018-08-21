pkgname=nmclient
pkgver=3.0.3
_date=20160302
pkgrel=2
pkgdesc="Novell Messenger Client for Linux"
url="http://gwclient.provo.novell.com/"
arch=('x86_64')
license=(custom:proprietary)
depends=('bin32-jre' 'lib32-glib2' 'lib32-libxext' 'lib32-gtk2'
         'bash' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('unzip')
source=(https://gwclient.innerweb.novell.com/client/messenger/nim30linux.zip
        LICENSE)
sha256sums=('0defd9414ba96a66d407c34c6de88fc495f27ff028457afe95a64499e3f5504a'
            'c7af4afb70c93eecfb851f799f7242c7b6798c196d455d50d992fa9f54d9f066')

build() {
  [ -d "$pkgname-$pkgver" ] && rm -rf "$pkgname-$pkgver"
  mkdir "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"

  rpmfile=novell-messenger-client-$pkgver-$_date.$arch.rpm
  msg2 "Extracting $rpmfile..."
  
    # exclude jre from extraction to save 109 MB
  bsdtar -xf "$srcdir"/$rpmfile --exclude=jre
  chmod +rx opt usr
}

package() {
  cd "$pkgname-$pkgver"

    # install everything, keeping files in /opt
  install -dm755 "$pkgdir"/opt/novell/messenger/
  cp -av opt/novell/messenger/client "$pkgdir"/opt/novell/messenger/

    # make launcher script avaiable in PATH by installing in /usr/bin
  install -dm755 "$pkgdir"/usr/bin
  ln -s /opt/novell/messenger/client/run-messenger "$pkgdir"/usr/bin/nmclient

    # install desktop file, remove redundant file
  install -Dm644 {,"$pkgdir"/}usr/share/applications/nmclient.desktop
  rm "$pkgdir"/opt/novell/messenger/client/nmclient.desktop

    # set to use system's java32 instead of the expected internal JVM
  JAVA_BIN=/usr/bin/java32
  sed -e "s|LD_LIBRARY_PATH=|&\$JAVA_BIN|"    \
      -e "s|^JAVA_BIN=.*|JAVA_BIN=$JAVA_BIN|" \
      -i "$pkgdir"/opt/novell/messenger/client/launcher

    # install license file
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
