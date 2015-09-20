# Maintainer: Ner0

pkgname=botanicula
pkgver=20120501
pkgrel=1
pkgdesc="A point'n'click exploration game from the creators of Machinarium (requires full copy of the game)"
arch=('any')
url="http://www.botanicula.net/"
license=('custom:commercial')
install=$pkgname.install

# Uncomment next line to reduce the compression time (doesn't work with yaourt)
#PKGEXT='.pkg.tar'

if [ "$CARCH" == 'i686' ]; then
   _gamepkg=("$pkgname-$pkgver-i386.tar.gz")
   depends=('gcc-libs' 'gtk2' 'hicolor-icon-theme' 'libxml2' 'nss')
elif [ "$CARCH" == 'x86_64' ]; then
   _gamepkg=("$pkgname-$pkgver-amd64.tar.gz")
   depends=('hicolor-icon-theme' 'lib32-gcc-libs' 'lib32-gtk2' 'lib32-libxml2' 'lib32-nss')
fi

package () {
   msg "You need a full copy of this game in order to install it"
   msg "Searching for ${_gamepkg} in dir: \"$startdir\""
	 pkgpath=$startdir
   if [[ ! -f "$startdir/${_gamepkg}" ]]; then
       error "Game package not found, please type absolute path to ${_gamepkg} (/home/$USER):"
       read pkgpath
       if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
           error "Unable to find game package." && return 1
       fi
    fi
    msg "Found game package, installing..."


  # Creating folders
  install -dm755 "$pkgdir/opt"

  msg "Extracting $_gamepkg..."
  tar -xf "$pkgpath/$_gamepkg" -C "$pkgdir/opt/"

  # Installing launch script and desktop file
  cd "$pkgdir/opt/$pkgname"
  install -Dm644 "$pkgname.desktop.in" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname.in" "$pkgdir/usr/bin/$pkgname"

  # Installing icons
  for i in 16 32 36 48 72 128 256 512; do
    install -Dm644 "bin/data/icons/b$i.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  sed -i 's|cd.*|cd /opt/botanicula/|' "$pkgdir/usr/bin/$pkgname"
  sed -i 's|Exec=.*|Exec=/usr/bin/botanicula \&|' "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i 's|Icon=.*|Icon=botanicula|' "$pkgdir/usr/share/applications/$pkgname.desktop"

  rm -f "$pkgdir/opt/$pkgname"/*.{in,sh}
}
