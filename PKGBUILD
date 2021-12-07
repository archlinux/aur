# Maintainer: yjun <jerrysteve1101@gmail.com>
# Maintainer: Maik93 <michael.mugnai@gmail.com>

# fork from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=stm32cubeide

pkgname="stm32cubeprog"
_pkgname="STM32CubeProgrammer"
pkgver=2.9.0
_stlink_updater_ver=2.38.27
pkgrel=3
pkgdesc="An all-in-one multi-OS software tool for programming STM32 products."
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubeprog.html"
license=('custom:SLA0048')
# libusb1.0.12 version or higher is required to run STM32CubeProgrammer.

#
# There is no need to install any Java™ SE Run Time Environment since version 2.6.0. The
# STM32CubeProgrammer runs with a bundled JRE available inside the downloaded
# package and no longer with the one installed on your machine.

# -------------------------------------------------->
# https://www.st.com/resource/en/user_manual/dm00403500-stm32cubeprogrammer-software-description-stmicroelectronics.pdf
#
# stlink provides stlink udev rules
depends=('stlink'
         'libusb')
makedepends=('xdotool'
             'xorg-server-xvfb'
             'icoutils')
provides=("${pkgname}rammer")
options=('!strip')
_pkg_main_name="${pkgname//prog/prg}-lin_v${pkgver//./-}"
_pkg_main_url_index="af/f8/e3/60/56/b9/42/9d"
_stlink_updater_name="stsw-link007_V${_stlink_updater_ver//./-}"
_stlink_url_index="4e/80/8d/29/e0/c7/4e/13"
# stm32cubeprog
## https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-programmers/stm32cubeprog/_jcr_content/get-software/get-software-table-body.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html
# stsw-link007
## https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-programmers/stsw-link007/_jcr_content/get-software/get-software-table-body.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html
source=("en.${_pkg_main_name}.zip::https://www.st.com/content/ccc/resource/technical/software/utility/group0/${_pkg_main_url_index}/${_pkg_main_name}/files/${_pkg_main_name}.zip/jcr:content/translations/en.${_pkg_main_name}.zip"
        "en.${_stlink_updater_name}.zip::https://st.com/content/ccc/resource/technical/software/firmware/group1/${_stlink_url_index}/${_stlink_updater_name}/files/${_stlink_updater_name}.zip/jcr:content/translations/en.${_stlink_updater_name}.zip"
        "${pkgname}.xdotool")
sha256sums=('53b3648bd0297330b4e82eaba80d69d9fa50ac8e57a41c32d00ac32ca77ccad9'
            'bb0c1849aa26fac956618c07cb81e29c68676d28ae630ce7a2498968dcfef33e'
            '3194268b73572c4e0fb69e51145f989e85c0415d1c2d932d115708b0c514b005')

prepare() {
  cat > ${pkgname}.xvfb <<END
#!/usr/bin/sh

echo ' '
echo 'please wait for minutes ......'
echo ' '

./SetupSTM32CubeProgrammer-${pkgver}.linux &

# specify $srcdir/build as temporary dir
xdotool stm32cubeprog.xdotool ${srcdir}/build
END

  chmod u+x Setup${_pkgname}-${pkgver}.linux ${pkgname}.xvfb
}

build() {
  mkdir -p build

  # use xvfb-run and xdotool to cheat the Installer
  xvfb-run --auto-servernum --server-args="-screen 0 1920x1080x24" -w 0 ./${pkgname}.xvfb

  # convert ico to icon
  mkdir -p icon
  icotool -x ${srcdir}/build/util/Programmer.ico -o icon
}

package() {
  install -dm755 ${pkgdir}/opt/${pkgname}
  cp -a ${srcdir}/build/* ${pkgdir}/opt/${pkgname}

  # icon
  index=0
  for size in 256 128 64 48 32 24 16
  do
    index=$((index+1))
    install -Dm 644 ${srcdir}/icon/Programmer_${index}_${size}x${size}x32.png \
                    ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png
  done
  
  # doc
  for _doc in CLI_TREE.txt Readme.txt
  do
    install -Dm644 ${pkgdir}/opt/${pkgname}/doc/${_doc} -t ${pkgdir}/usr/share/doc/${pkgname}
  done

  # license
  install -Dm644 ${pkgdir}/opt/${pkgname}/doc/license.txt -t ${pkgdir}/usr/share/licenses/${pkgname}

  # desktop enrty
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Comment=${_pkgname}-Cube ${pkgver}
Comment[en]=${_pkgname}-Cube ${pkgver}
Encoding=UTF-8
Exec=env GDK_BACKEND=x11 /opt/${pkgname}/bin/${_pkgname}
Icon=${pkgname}
Name=${_pkgname}
Name[en]=${_pkgname}
Path=/opt/${pkgname}/bin
Type=Application
END

  # soft link
  install -dm 755 ${pkgdir}/usr/bin
  for _cmd in STM32_Programmer_CLI STM32_Programmer.sh STM32MP_SigningTool_CLI STM32MP_KeyGen_CLI
  do
    ln -sf /opt/${pkgname}/bin/${_cmd} ${pkgdir}/usr/bin/${_cmd}
  done

  # Remove STM32CubePrgUpd update
  rm -rf ${pkgdir}/opt/${pkgname}/updater

  # ST-link updater
  # https://community.st.com/s/question/0D53W00000mlLP9/how-to-install-stlinkupgradejar-from-stswlink007-so-it-can-be-found-by-stm32cubeprogrammer
  install -Dm644 stsw-link007/AllPlatforms/STLinkUpgrade.jar ${pkgdir}/opt/${pkgname}/Drivers/FirmwareUpgrade/STLinkUpgrade.jar
  install -Dm644 stsw-link007/AllPlatforms/native/linux_x64/libSTLinkUSBDriver.so ${pkgdir}/opt/${pkgname}/Drivers/FirmwareUpgrade/native/linux_x64/libSTLinkUSBDriver.so
}
# vim: set sw=2 ts=2 et:
