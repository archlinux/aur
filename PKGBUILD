# Maintainer(s):	remspoor <remspoor AT linuxmail DOT org>
#			Jake <aur@ja-ke.tech>

# These variables should be updated with ./update_download_id.sh
_download_url='https://magentacloud.de/s/t3ErMHHFdZnm3fZ/download/cgm-rc-flight-simulator-linux-2061.zip'
# _download_[id|file] can be cleaned up later
_download_id='t3ErMHHFdZnm3fZ'
_download_file='cgm-rc-flight-simulator-linux-2061.zip'
_pkgver='2.061'

pkgname=next
pkgver=2.061
pkgrel=1
pkgdesc="CGM rc Heli Flight Simulator"
arch=('x86_64')
url="http://www.rc-aerobatics.eu/index_e.html"
license=('custom')
optdepends=(	'joyutils: jscal, jstest, and jsattach utilities for the Linux joystick driver'
		'controllermap: Game controller mapping generator, to generate env. var. SDL_GAMECONTROLLERCONFIG')

install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::${_download_url}"
        "next.desktop"
        "next.sh")

sha512sums=('ada729feb6ac72ea886f168bd73e0da3ff940b64b42f00c7f0cbb6a3b5185d64e31b3369bf95665bb9d3a669a6be25ff40dbcb0574fb35bc817e2ad59bba2434'
            '73fa793d92ef60e052b82776e89316024fbe46634a695516820b0f2740727c92e94da72f318bb22817686e53f827106ce3048126852c23608295464d90ee4b6d'
            'c982aea8a23d6259069f97a8a71f74270811488818ad0e5c8496047f94cf357d64fe3267f04628030d6b766dc3dd62d5d56ab0387e4ad5bd943a7e7a39598669')


prepare() {
  # rename the original directory to something sane and remove an OSX directory
  mv "neXt" "${pkgname}"

  cd "${srcdir}/${pkgname}"

  tail -n 2 ReadMe.txt > License.txt

  # Remove OSX stuff
  find . -type f -name ".DS_Store" -exec rm {} \;
}

package() {
  # Install files to ${pkgdir}
  install -dm755 "${pkgdir}/opt/${pkgname}"

  msg2 "Copying files to package directory..."
  cp -dr --no-preserve=ownership "${srcdir}/${pkgname}" "${pkgdir}/opt/"

  msg2 "Installing icon file..."
  install -Dm644 "${srcdir}/${pkgname}/neXt_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  msg2 "Installing ${pkgname}.desktop file..."
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  msg2 "Installing start script..."
  install -Dm775 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  msg2 "Installing LICENSE file..."
  install -Dm644 ${srcdir}/${pkgname}/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
