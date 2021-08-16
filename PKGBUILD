# Maintainer: yjun <jerrysteve1101@gmail.com>

# fork from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=stm32cubeide

pkgname="stm32cubeprog"
_pkgname="STM32CubeProgrammer"
pkgver=2.8.0
_stlink_updater_ver=2.38.27
pkgrel=2
pkgdesc="An all-in-one multi-OS software tool for programming STM32 products."
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubeprog.html"
license=('SLA0048')
# libusb1.0.12 version or higher is required to run STM32CubeProgrammer.

# There is no need to install any Java™ SE Run Time Environment since version 2.6.0. The
# STM32CubeProgrammer runs with a bundled JRE available inside the downloaded
# package and no longer with the one installed on your machine.

# -------------------------------------------------->
# https://www.st.com/resource/en/user_manual/dm00403500-stm32cubeprogrammer-software-description-stmicroelectronics.pdf
depends=('stlink'
         'libusb'
         'libnet'
         'qt5-serialport'
         'openssl-1.0')
makedepends=('xdotool'
             'xorg-server-xvfb'
             'xdg-user-dirs'
             'icoutils')
provides=("${pkgname}rammer")
options=('!strip')
_pkg_main_archive="en.${pkgname//prog/prg}-lin_v${pkgver//./-}_v${pkgver}.zip"
_stlink_updater_archive="en.stsw-link007_V${_stlink_updater_ver//./-}_v${_stlink_updater_ver}.zip"
source=("local://${_pkg_main_archive}"
        "local://${_stlink_updater_archive}"
        "${pkgname}.xdotool")
sha256sums=('c896a9e2cd6c43c9d98a7271c52934eb7151c22117afdf6e8175e7c6a83fdc40'
            'bb0c1849aa26fac956618c07cb81e29c68676d28ae630ce7a2498968dcfef33e'
            '3194268b73572c4e0fb69e51145f989e85c0415d1c2d932d115708b0c514b005')
      
_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_main_archive} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_main_archive} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_main_archive} ${PWD}
	else
		echo ""
		echo "Main archive not found. The package can be downloaded here: https://www.st.com/en/development-tools/stm32cubeprog.html"
		echo "Please remember to put a downloaded package ${_pkg_main_archive} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		echo ""
	fi
fi

if [ ! -f ${PWD}/${_stlink_updater_archive} ]; then
  if [ -f $_DOWNLOADS_DIR/${_stlink_updater_archive} ]; then
    ln -sfn $_DOWNLOADS_DIR/${_stlink_updater_archive} ${PWD}
  else
    echo ""
    echo "St-link updater archive not found. The package can be downloaded here: https://www.st.com/en/development-tools/stsw-link007.html"
    echo "Please remember to put a downloaded package ${_stlink_updater_archive} into the build directory ${PWD} or $_DOWNLOADS_DIR"
    echo ""
  fi
fi

prepare() {
  cat > ${pkgname}.xvfb <<'END'
#!/usr/bin/sh

echo ' '
echo 'please wait for minutes ......'
echo ' '

./SetupSTM32CubeProgrammer-2.8.0.linux &
xdotool stm32cubeprog.xdotool ${1}
END

  chmod u+x Setup${_pkgname}-${pkgver}.linux ${pkgname}.xvfb
}

build() {
  mkdir -p build

  # use xvfb-run and xdotool to cheat the Installer
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

  # ST-link updater
  install -Dm644 stsw-link007/AllPlatforms/STLinkUpgrade.jar ${pkgdir}/opt/${pkgname}/Drivers/FirmwareUpgrade/STLinkUpgrade.jar
  install -Dm644 stsw-link007/AllPlatforms/native/linux_x64/libSTLinkUSBDriver.so ${pkgdir}/opt/${pkgname}/Drivers/FirmwareUpgrade/native/linux_x64/libSTLinkUSBDriver.so
}
# vim: set sw=2 ts=2 et:
