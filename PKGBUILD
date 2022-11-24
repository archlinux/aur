# Maintainer kyle[at]kylemanna[d0t]com
_pkgbin=cloudmos-deploy
_pkgbin2=akashlytics-deploy
pkgname=${_pkgbin}-bin
pkgdesc='Desktop app to easily deploy on the Akash Network'
license=('GPL')
url='https://github.com/maxmaxlabs/cloudmos-deploy'
pkgver=0.17.1
pkgrel=1
arch=('x86_64')
depends=('libusb')
conflicts=('akashlytics-deploy-bin')

_pkgsrc="CloudMos-Deploy-${pkgver}.AppImage"

source=(
  "${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
  "LICENSE::https://raw.githubusercontent.com/maxmaxlabs/cloudmos-deploy/v${pkgver}/LICENSE"
)
sha512sums=('4f7c129932f61912725eb8d734871143c02fec9350527e358fad8d1d7991d557ce0f8ad9e3132f3dbba1b341abc044406b95b1c3e0c5e1f4d7c2a50f3fb5440f'
            'adfa9547f59d194835eb7cfa4014fd3f972470f92802e1f9c39e636225f285331956620accc7d431e5c0ff4171a462ef184c334e2bd639a92d383e22501ae60c')

build() {
  # Extract files
  chmod +x "$srcdir/$_pkgsrc"
  $srcdir/$_pkgsrc --appimage-extract
}


package() {
  cd $srcdir/squashfs-root

  # Correct .desktop
  sed -e "s/AppRun/${_pkgbin}/g" -i "${_pkgbin2}.desktop"

  install -d "${pkgdir}/opt/${_pkgbin}"
  cp -a . "${pkgdir}/opt/${_pkgbin}/"
  chmod -R +rx "${pkgdir}/opt/${_pkgbin}"

  install -d "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/opt/${_pkgbin}/${_pkgbin2}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -d "${pkgdir}/usr/share"
  cp -r "usr/share/." "${pkgdir}/usr/share/"

  find "${pkgdir}" -type d -exec chmod 755 {} +

  install -Dm644 "${_pkgbin2}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin2}.desktop"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
