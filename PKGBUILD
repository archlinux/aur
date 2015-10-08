# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Samuel Littley <samuel.littley@toastwaffle.com>
# Contributor: William Giokas <1007380@gmail.com>

pkgname=minimetro
_pkgname=MiniMetro
pkgver=beta34
pkgrel=1
pkgdesc='minimalistic subway layout game'
url="http://dinopoloclub.com/${pkgname}/"
license=('custom:None')
arch=('i686' 'x86_64')
depends=('libgl' 'libx11' 'glu' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('imagemagick')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
install=desktop.install
source=("hib://${_pkgname}-${pkgver}-linux.tar.gz"
        "minimetro.desktop"
        "minimetro.svg"
        "minimetro.png::https://humblebundle-a.akamaihd.net/misc/files/hashed/45825dc5e82cc4626cbae2302de7a182df5d357d.png")
md5sums=('d16ae731ee2fe1410566fdbaf1fb26e5'
         '0fe19f989f9606a825b67b9b379c9d6c'
         '6e7915bc03ced67cffb81174f260a742'
         '8e9b34b4e784d4aa306e29cf46194ff8')

prepare() {
  case $CARCH in
    i686) _notarch=x86_64 ;;
    x86_64) _notarch=x86 ;;
  esac
  find -name "*$_notarch" -exec rm -r {} +
}

package() {
  # First, install the game itself.
  destdir="$pkgdir/opt/$pkgname"
  install -dm 755 "$destdir"
  cp -r ${_pkgname}{_,.}* "$destdir"

  # Make the log file writable by the 'games' group. This is needed to run.
  log="$destdir"/${_pkgname}_Data/log.txt
  touch "$log"
  chmod 664 "$log"
  chown :games "$log"

  # Now, care for supplementary files.
  install -dm 755 "$pkgdir"/usr/{bin,share/{applications,icons/hicolor/{scalable,256x256,64x64}/apps}} "$destdir"

  echo "#!/opt/$pkgname/${_pkgname}.$CARCH" > "$pkgdir"/usr/bin/${pkgname}
  chmod +x "$pkgdir"/usr/bin/$pkgname

  cp ${pkgname}.desktop "$pkgdir"/usr/share/applications
  cp ${pkgname}.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps
  convert ${pkgname}.svg "$pkgdir"/usr/share/icons/hicolor/256x256/apps/minimetro.png
  convert ${pkgname}.png -resize 64x64 "$pkgdir"/usr/share/icons/hicolor/64x64/apps/minimetro.png
}
