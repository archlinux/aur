
pkgname=papoandyo
pkgver=1.0
pkgrel=2
pkgdesc="A modern fairytale in an jump-and-run puzzle solving computer game"
arch=('i686' 'x86_64')
url="http://www.weareminority.com/papo-yo/"
license=("custom: commercial")
depends=()
source=("hib://PapoYo_linux_1389070953.sh")
md5sums=("d8222b87222f4eb05025584bf923da41")
noextract=("${source[@]#*//}")
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
PKGEXT='.pkg.tar'

prepare() {
  cd $srcdir
  msg "Extracting Mojo-Archive..."
  unzip -qq -o PapoYo_linux_1389070953.sh >/dev/null 2>&1 || true
}

package() {
  cd $srcdir
  _installdir=$pkgdir/opt/$pkgname
  install -d $_installdir
  cp -r data/x86/* $_installdir
  cp -r data/noarch/* $_installdir

  sed -i $_installdir/PapoYo.sh -e '2s|".*"|/opt/'$pkgname'|'
  install -Dm644 data/noarch/PapoYoIcon.png $pkgdir/usr/share/pixmaps/${pkgname}.png
  install -d $pkgdir/usr/bin
  ln -s /opt/$pkgname/PapoYo.sh $pkgdir/usr/bin/$pkgname

  #desktop-file
  install -d $pkgdir/usr/share/applications
  cat > $pkgdir/usr/share/applications/${pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Name=Papo & Yo
GenericName=Papo & Yo
Comment=Papo & Yo
Icon=/usr/share/pixmaps/${pkgname}.png
Exec=/usr/bin/$pkgname
Categories=Game;
Path=/opt/$pkgname
EOF
}
