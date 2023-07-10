# Maintainer: kumen
# Contributor: nightuser <nightuser.android@gmail.com>

pkgname="stm32cubeide"
pkgver=1.12.1
_pkgver_ext=1.12.1_16088_20230420_1057
_pkg_file_name=en.st-stm32cubeide_1.12.1_16088_20230420_1057_amd64.sh.zip
pkgrel=5
pkgdesc="Integrated Development Environment for STM32"
arch=("x86_64")
makedepends=('imagemagick')
depends=('glibc' 'libusb' 'ncurses5-compat-libs' 'webkit2gtk')
optdepends=('jlink-software-and-documentation' 'stlink' 'arm-none-eabi-gdb')
conflicts=()
url="https://www.st.com/en/development-tools/stm32cubeide.html"
license=('custom:SLA0048')
options=(!strip)

# Extract actual direct download link */
_curl_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/77.0.3865.75 \
                        Safari/537.36"
_curl_useragent="$(printf '%s' "$_curl_useragent" | sed 's/[[:space:]]\+/ /g')"
_useragent_escaped="${_curl_useragent// /\\ }"
_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-ides/stm32cubeide/_jcr_content/get-software/get-software-table-body.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"

_curl_req="$(curl -s --compressed -H "$_curl_useragent" "$_curl_req_url")"
_curl_req="$(grep -m 1 "${_pkg_file_name}" <<< "$_curl_req")"
_download_path="https://www.st.com""$(awk -F'"' '{print $4}' <<< "$_curl_req")"

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              -H ${_useragent_escaped} \
              -o %o --compressed %u")

source=("${_pkg_file_name}"::"$_download_path"
#	"99-jlink.rules.patch"
	"https://www.st.com/resource/en/license/SLA0048_STM32CubeIDE.pdf"
	)
sha256sums=('896c6917ad0b0660e7fe7e15b94d464106c0259442564d0150cc090dc255d8c0'
#	'0f3f69f7c980a701bf814e94595f5acb51a5d91be76b74e5b632220cfb0e7bb3'
	'SKIP'
)

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

	msg2 'Installation of STlink udev rules skipped'
	#msg2 'Installing STlink udev rules'
	#install -d -m755 "${pkgdir}/usr/lib/udev/rules.d/"
	#install -D -o root -g root -m 644 -t "${pkgdir}/usr/lib/udev/rules.d/" "$srcdir/build/stlink-udev/fileset/"*.rules

	msg2 'Installation of JLink udev rules skipped'
	#msg2 'Installing JLink udev rules'
	#install -d -m755 "${pkgdir}/usr/lib/udev/rules.d/"
	#install -D -o root -g root -m 644 -t "${pkgdir}/usr/lib/udev/rules.d/" "$srcdir/build/jlink-udev/"*.rules
	#patch -i "${srcdir}/99-jlink.rules.patch" "${pkgdir}/usr/lib/udev/rules.d/99-jlink.rules"

	msg2 'Installation of binary files'
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
mkdir -p /tmp/SWT-GDBusServer
/opt/stm32cubeide/stm32cubeide "\$@"
END
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}_wayland" <<END
#!/bin/sh
mkdir -p /tmp/SWT-GDBusServer
/opt/stm32cubeide/stm32cubeide_wayland "\$@"
END

	msg2 'Installing desktop shortcut and icon'
	convert "${pkgdir}/opt/${pkgname}/icon.xpm" "${srcdir}/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=STM32CubeIDE
Comment=STM32CubeIDE ${pkgver}
GenericName=STM32CubeIDE
#Exec=env GDK_BACKEND=x11 stm32cubeide %F
#Exec=env WEBKIT_DISABLE_COMPOSITING_MODE=1 stm32cubeide %F
Exec=stm32cubeide_wayland %F
Icon=${pkgname}
Path=/opt/${pkgname}/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development;IDE;Java;
END

	#msg2 'Replace GDB by system'
	#rm "${pkgdir}/opt/stm32cubeide/plugins/"com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32*/tools/bin/arm-none-eabi-gdb
	#rm "${pkgdir}/opt/stm32cubeide/plugins/"com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32*/tools/bin/arm-none-eabi-gdb-add-index
	#ln -s /usr/bin/arm-none-eabi-gdb "${pkgdir}/opt/stm32cubeide/plugins/"com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32*/tools/bin
	#ln -s /usr/bin/arm-none-eabi-gdb-add-index "${pkgdir}/opt/stm32cubeide/plugins/"com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32*/tools/bin
	
	msg2 'Create symlink from original directory name'
	read -r default_install_path < "${srcdir}/build/default_install_path.txt"
	install -d -m755  "${pkgdir}/opt/st/"
	ln -s "/opt/${pkgname}" "${pkgdir}${default_install_path}"
	
	msg2 'Installation of license file'
	install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -D -o root -g root -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/SLA0048_STM32CubeIDE.pdf"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
