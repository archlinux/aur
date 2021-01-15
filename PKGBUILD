# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname="stm32cubeprog"
_pkgname="STM32CubeProgrammer"
pkgver=2.6.0
pkgrel=1
pkgdesc="An all-in-one multi-OS software tool for programming STM32 products."
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubeprog.html"
license=('SLA0048')
depends=('stlink'
         'libusb')
makedepends=('xdotool'
             'xorg-server-xvfb'
             'xdg-user-dirs')
provides=("${pkgname}rammer")
options=('!strip')
_pkg_file_name="en.${pkgname//prog/prg}-lin_v${pkgver//./-}.zip"
source=("local://${_pkg_file_name}"
        "${pkgname}.xdotool"
        "${pkgname}.xvfb")
sha256sums=('e34a0257f77a399dd66ffd5283c976c8ac10a794951386a0bd6fb15152d54710'
            '3194268b73572c4e0fb69e51145f989e85c0415d1c2d932d115708b0c514b005'
            '301e38bde6ec8fb460077b1f087e6a121e02ede20a1f633eadd5f16279db2c36')
      
_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		echo ""
		echo "The package can be downloaded here: "
		echo "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		echo ""
	fi
fi

prepare () {
  mkdir -p build

  chmod u+x Setup${_pkgname}-${pkgver}.linux ${pkgname}.xvfb

  xvfb-run --auto-servernum --server-args="-screen 0 1920x1080x24" -w 0 ./${pkgname}.xvfb ${srcdir}/build

  # convert ico to icon
  mkdir -p icon
  icotool -x ${srcdir}/build/util/Programmer.ico -o icon
}

package() {
  install -dm755 ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/build/* ${pkgdir}/opt/${pkgname}

  # icon
  index=0
  for size in 256 128 64 48 32 24 16
  do
    index=$((index+1))
    install -Dm 644 ${srcdir}/icon/Programmer_${index}_${size}x${size}x32.png ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png
  done
  
  # license
  install -Dm644 ${pkgdir}/opt/${pkgname}/doc/license.txt -t ${pkgdir}/usr/share/licenses/${pkgname}

  # desktop enrty
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Comment=${_pkgname}-Cube ${pkgver}
Comment[en]=${_pkgname}-Cube ${pkgver}
Encoding=UTF-8
Exec=/opt/${pkgname}/bin/${_pkgname}
Icon=${pkgname}
Name=${_pkgname}
Name[en]=${_pkgname}
Path=/opt/${pkgname}/bin
Type=Application
END

  # soft link
  install -dm 755 ${pkgdir}/usr/bin
  for cmd in STM32_Programmer_CLI STM32MP_SigningTool_CLI STM32MP_KeyGen_CLI      
  do
    ln -sf /opt/${pkgname}/bin/${cmd} ${pkgdir}/usr/bin/${cmd}
  done
}
# vim: set sw=2 ts=2 et:
