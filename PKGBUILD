# Maintainer: Eric Anderson <ejona86@gmail.com>
# Contributor: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: Yann Kaiser <kaiser.yann@gmail.com>

pkgname=jamestown
pkgver=1.0.2
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc='A neo-classical top-down shooter for up to four players set on 17th-century British Colonial Mars (game sold separately)'
arch=('i686' 'x86_64')
url="http://www.finalformgames.com/jamestown/"
license=('custom')
if [ "$CARCH" == "x86_64" ]; then
  # The 64-bit build is broken in 1.0.2
  depends=('lib32-libgl' 'lib32-openal' 'lib32-sdl')
else
  depends=('libgl' 'openal' 'sdl')
fi
source=("hib://JamestownLinux_${_pkgver}.zip"
        'https://github.com/ValveSoftware/source-sdk-2013/raw/master/sp/src/lib/public/linux32/libsteam_api.so'
        'jamestown.desktop'
        'jamestown.sh')
md5sums=('dcfb4348aba89f0f26bf5b4c7e05d936'
         '60ded2356764af5c0e81fddc18b347da'
         'a3c076b5acfe960aed6464d1d268d6d2'
         '031b946ddcc8538bd19d0eda8b34b91c')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
PKGEXT='.pkg.tar'

prepare() {
  cd "${srcdir}"

  mkdir -p "${pkgname}-${pkgver}"
  bsdtar -x -C "${pkgname}-${pkgver}" -f "JamestownInstaller_${_pkgver}-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cd data
  find Archives -type f -exec \
      install -Dm644 {} "${pkgdir}/opt/${pkgname}/{}" \;
  install -m755 -t "${pkgdir}/opt/${pkgname}" \
      Jamestown-x86 README-linux.txt steam_appid.txt
  install -Dm755 "${srcdir}/libsteam_api.so" "${pkgdir}/opt/${pkgname}/"

  install -Dm644 Jamestown_EULA.txt \
      "${pkgdir}/usr/share/licenses/${pkgname}/Jamestown_EULA.txt"
  install -Dm644 LICENSES.TXT \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.TXT"

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
