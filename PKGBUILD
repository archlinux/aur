# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=wing-personal
pkgver=7.2.2.0
pkgrel=1
pkgdesc="IDE designed from the ground up for Python, to bring you a more productive development experience"
arch=('x86_64')
url="https://wingware.com"
license=('custom')
depends=('python' 'xcb-util-wm')
provides=('wing')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.bz2::https://wingware.com/pub/wing-personal/${pkgver}/wing-personal-${pkgver}-linux-x64.tar.bz2")
sha256sums=('a33fdc849ed7075332fe87f111389811d2aacb4a4ab10a5717316880c8998267')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-linux-x64"
  ./wing-install.py --winghome "${pkgdir}/opt/${pkgname}" --bin-dir "${pkgdir}/usr/bin" --verbose
  for i in 16 32 64 48 128; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/"
    mv -v "${pkgdir}/opt/${pkgname}/resources/wing${i}.png" \
     "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wing.png"
  done
  install -d "${pkgdir}/usr/share/applications/" \
   "${pkgdir}/usr/share/mime/packages/" \
   "${pkgdir}/usr/share/doc/${pkgname}/" \
   "${pkgdir}/usr/share/licenses/${pkgname}/"
  mv -v "${pkgdir}/opt/${pkgname}/resources/linux/desktop/wing-personal7.desktop" \
   "${pkgdir}/usr/share/applications/"
  mv -v "${pkgdir}/opt/${pkgname}/resources/linux/desktop/wing-personal7.xml" \
   "${pkgdir}/usr/share/mime/packages/"
  cp -v "${pkgdir}/opt/${pkgname}/LICENSE.txt" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv -v "${pkgdir}/opt/${pkgname}/doc"/* "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 "${pkgdir}/usr/share/icons/hicolor/128x128/apps/wing.png" \
   "${pkgdir}/usr/share/pixmaps/wing-personal7.png"

  for file in wing-personal wingdbstub.py file-list.txt; do
    sed -i "s|$pkgdir||" "${pkgdir}/opt/${pkgname}/$file" 
  done
  for rem in resources/win32 resources/osx resources/linux wing-uninstall doc; do
    rm -rvf "${pkgdir}/opt/${pkgname}/$rem"
  done
  #libxcb1, libxcb-xkb1
}