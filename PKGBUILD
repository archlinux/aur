# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Martin Lukes <martin.meridius@gmail.com>
# Contributor: Samuel Littley <samuel.littley@toastwaffle.com>
# Contributor: William Giokas <1007380@gmail.com>

_pkgname="Mini Metro"
pkgname="${_pkgname,,}"
pkgname="${pkgname/ }"
pkgver=gamma18
pkgrel=3
pkgdesc='minimalistic subway layout game'
url="http://dinopoloclub.com/${pkgname}/"
license=('custom:None')
arch=('i686' 'x86_64')
depends=('libgl' 'libx11' 'glu' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('imagemagick')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
install=desktop.install
source=("hib://${_pkgname/ }-${pkgver}-linux.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png::http://dinopoloclub.com/press/mini_metro/images/icon.png")
md5sums=('765bfdb52584df48784728e6476f47d7'
         '0fe19f989f9606a825b67b9b379c9d6c'
         '8412b1e4cc11be455af993d921a68ced')

prepare() {
  case $CARCH in
    i686) _notarch=x86_64 ;;
    x86_64) _notarch=x86 ;;
  esac
  find -name "*$_notarch" -exec rm -r {} +
}

package() {
  # Prepare variables.
  destdir="$pkgdir/opt/$pkgname"
  install -d "$destdir" "$pkgdir"/usr/{bin,share/applications}

  # Install the game and data files.
  cp -r --no-preserve=mode,ownership "${_pkgname}_Data" "$destdir"
  install "$_pkgname".* "$destdir"

  # Now, care for supplementary files.
  for size in 16 22 24 32 36 48 64 72 96 128 192 256 384 512; do
    size=${size}x${size}
    install -d "$pkgdir/usr/share/icons/hicolor/$size/apps"
    convert $pkgname.png -resize $size "$pkgdir/usr/share/icons/hicolor/$size/apps/$pkgname.png"
  done

  echo "#!/opt/$pkgname/${_pkgname}.$CARCH" > "$pkgdir"/usr/bin/${pkgname}
  chmod +x "$pkgdir"/usr/bin/$pkgname
  cp ${pkgname}.desktop "$pkgdir"/usr/share/applications
}
