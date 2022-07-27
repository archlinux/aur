# Maintainer kyle[at]kylemanna[d0t]com
_pkgbin=akashlytics-deploy
pkgname=${_pkgbin}-bin
pkgdesc='Desktop app to easily deploy on the Akash Network'
license=('GPL')
url='https://github.com/Akashlytics/akashlytics-deploy'
pkgver=0.14.3
pkgrel=1
arch=('x86_64')
depends=('libusb')

_pkgsrc="Akashlytics-Deploy-${pkgver}.AppImage"

source=(
  "${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
  "LICENSE::https://raw.githubusercontent.com/Akashlytics/akashlytics-deploy/v${pkgver}/LICENSE"
)
sha512sums=('bce890ddd82dc9466ad203de876a887a32f370611a888fe047b8d99e661c309a872beaf51c00bb8d65ef398be9631a1e02d24ffe1fdfce793146c688c3cef948'
            'adfa9547f59d194835eb7cfa4014fd3f972470f92802e1f9c39e636225f285331956620accc7d431e5c0ff4171a462ef184c334e2bd639a92d383e22501ae60c')

build() {
  # Extract files
  chmod +x "$srcdir/$_pkgsrc"
  $srcdir/$_pkgsrc --appimage-extract
}


package() {
  cd $srcdir/squashfs-root

  # Correct .desktop
  sed -e "s/AppRun/${_pkgbin}/g" -i "${_pkgbin}.desktop"

  install -d "$pkgdir/opt/$_pkgbin"
  cp -a . "$pkgdir/opt/$_pkgbin/"
  chmod -R +rx "$pkgdir/opt/$_pkgbin"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgbin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

  install -d "$pkgdir/usr/share"
  cp -r "usr/share/." "${pkgdir}/usr/share/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 "$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
