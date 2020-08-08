# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Martin Lukes <martin.meridius@gmail.com>
# Contributor: Samuel Littley <samuel.littley@toastwaffle.com>
# Contributor: William Giokas <1007380@gmail.com>

_longname="Mini Metro"
pkgname="${_longname,,}"
pkgname="${pkgname/ }"
pkgver=41
pkgrel=1
pkgdesc='minimalistic subway layout game'
url="http://dinopoloclub.com/${pkgname}/"
license=('custom:None')
arch=('i686' 'x86_64')
depends=('libgl' 'libx11' 'glu' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('imagemagick')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
install=desktop.install
source=("hib://${_longname/ }-release-${pkgver}-linux.tar.gz"
        "${pkgname}.desktop"
        "starter.sh"
        "${pkgname}.png::${url%/*/*}/wp-content/uploads/2019/08/${_longname/ /-}-Icon.png")
md5sums=('01f6f15ba835e1c54e52df90ff890408'
         'b89a42a38136d0a126c8c13657b21c3f'
         '5006f1c488369854b7ac714168742aae'
         '8412b1e4cc11be455af993d921a68ced')

package() {
  # Prepare variables.
  destdir="$pkgdir/opt/$pkgname"
  if [ "$CARCH" == 'i686' ]
  then
    CARCH=x86
  fi
  install -d "$destdir" "$pkgdir"/usr/{bin,share/applications}

  # Install the game and data files.
  cp -r --no-preserve=mode,ownership "${_longname}_Data" "$destdir"
  install "$_longname.$CARCH" "$destdir"

  # Care for the icon.
  for size in 16 22 24 32 36 48 64 72 96 128 192 256 384 512; do
    size=${size}x${size}
    install -d "$pkgdir/usr/share/icons/hicolor/$size/apps"
    convert $pkgname.png -resize $size "$pkgdir/usr/share/icons/hicolor/$size/apps/$pkgname.png"
  done

  # Compose the desktop entry and starter.
  export longname="$_longname" pkgname pkgdesc CARCH
  envsubst < "$pkgname.desktop" > "$pkgdir/usr/share/applications/$pkgname.desktop"
  envsubst < starter.sh > "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
