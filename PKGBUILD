# Maintainer: kumen
# Contributor: nightuser <nightuser.android@gmail.com>

pkgname="stm32cubeide"
pkgver=1.7.0
_pkgver_ext=1.7.0_10852_20210715_0634
_pkg_file_name=en.st-stm32cubeide_1.7.0_10852_20210715_0634_amd64.sh_v1.7.0.zip
pkgrel=1
pkgdesc="Integrated Development Environment for STM32"
arch=("x86_64")
makedepends=('xdg-user-dirs' 'imagemagick')
depends=('java-runtime' 'jlink-software-and-documentation' 'stlink' 'ncurses5-compat-libs' 'glibc' 'libusb' 'webkit2gtk')
optdepends=()
conflicts=()
url="https://www.st.com/en/development-tools/stm32cubeide.html"
license=('Commercial')
options=(!strip)

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		msg2 ""
		msg2 "Package not found!"
		msg2 "The package can be downloaded here: ${url}"
		msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://${_pkg_file_name}"
	"99-jlink.rules.patch"
	"https://www.st.com/resource/en/license_agreement/dm00218346.pdf")
sha256sums=('bfe2fb78652cbea961c46da9a71640b3b00eaf8137d6f258622638d65fb85ae1'
	'0f3f69f7c980a701bf814e94595f5acb51a5d91be76b74e5b632220cfb0e7bb3'
	'SKIP')

prepare(){
	mkdir -p build
	sh "${srcdir}/"st-stm32cubeide_${_pkgver_ext}_amd64.sh --quiet --noexec --nox11 --target "${srcdir}/build"

	mkdir -p "${srcdir}/build/stlink-server"
	sh "${srcdir}/build/"st-stlink-server.*.install.sh --quiet --noexec --nox11 --target "${srcdir}/build/stlink-server"

	mkdir -p "${srcdir}/build/stlink-udev"
	sh "${srcdir}/build/"st-stlink-udev-rules-*-linux-noarch.sh --quiet --noexec --nox11 --target "${srcdir}/build/stlink-udev"

	mkdir -p "${srcdir}/build/jlink-udev"
	sh "${srcdir}/build/"segger-jlink-udev-rules-*-linux-noarch.sh --quiet --noexec --nox11 --target "${srcdir}/build/jlink-udev"
}

package() {
	cd "$srcdir"

	msg2 'Installing STM32CubeIDE'
	install -d -m755 "${pkgdir}/opt/${pkgname}"
	tar zxf "./build/st-stm32cubeide_${_pkgver_ext}_amd64.tar.gz" -C "${pkgdir}/opt/${pkgname}"

	msg2 'Installing stlink server'
	install -d -m755 "${pkgdir}/usr/bin/"
	cp "${srcdir}/build/stlink-server/stlink-server" "${pkgdir}/usr/bin/"
	chmod 0755 "${pkgdir}/usr/bin/stlink-server"
	chown root:root "${pkgdir}/usr/bin/stlink-server"

	msg2 'Instalation of STlink udev rules skipped'
	#msg2 'Installing STlink udev rules'
	#install -d -m755 "${pkgdir}/usr/lib/udev/rules.d/"
	#install -D -o root -g root -m 644 -t "${pkgdir}/usr/lib/udev/rules.d/" "$srcdir/build/stlink-udev/fileset/"*.rules

	msg2 'Instalation of JLink udev rules skipped'
	#msg2 'Installing JLink udev rules'
	#install -d -m755 "${pkgdir}/usr/lib/udev/rules.d/"
	#install -D -o root -g root -m 644 -t "${pkgdir}/usr/lib/udev/rules.d/" "$srcdir/build/jlink-udev/"*.rules
	#patch -i "${srcdir}/99-jlink.rules.patch" "${pkgdir}/usr/lib/udev/rules.d/99-jlink.rules"

	msg2 'Instalation of binary file'
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
/opt/stm32cubeide/stm32cubeide "\$@"
END

	msg2 'Installing desktop shortcut and icon'
	convert "${pkgdir}/opt/stm32cubeide/icon.xpm" "${srcdir}/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=STM32CubeIDE
Comment=STM32CubeIDE 1.7.0
GenericName=STM32CubeIDE
Exec=env GDK_BACKEND=x11 stm32cubeide %F
Icon=stm32cubeide
Path=/opt/stm32cubeide/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
END

	msg2 'Instalation of license file'
	install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -D -o root -g root -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/dm00218346.pdf"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
