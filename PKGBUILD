# Maintainer: taotieren <admin@taotieren.com>
# Contributor:

pkgname="lpcscrypt-bin"
pkgver=2.1.2
pkgrel=1
pkgdesc="LPCScrypt is the recommended tool for programming the latest versions of CMSIS-DAP and J-Link firmware onto boards with Link2/LPC-Link2 debug probes."
arch=("x86_64")
makedepends=('imagemagick')
depends=('jlink-software-and-documentation')
optdepends=()
conflicts=()
url="https://www.nxp.com/design/microcontrollers-developer-resources/lpcscrypt-v2-1-2:LPCSCRYPT"
license=('Commercial' 'Apache-2.0' 'BSD-4-clause' 'BSD-3-clause' 'LGPLV2.1' 'GPLV2' 'Zlib')
options=(!strip)
_pkgver_ext=${pkgver}_57
_pkg_file_name=${pkgname%-bin}-${_pkgver_ext}.${arch}.deb.bin
_deb_file_name=${pkgname%-bin}-${_pkgver_ext}.${arch}.deb
_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		msg2 ""
		msg2 "The package can be downloaded here: "
		msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://${_pkg_file_name}")
sha256sums=('379c63b788a72e64571af870d760ad6b3be32e4c863d29ca58276f750e416750')
noextract=(${_pkg_file_name})

prepare(){
	cd "$srcdir"
    tail -n +499 ${_pkg_file_name} > ${_deb_file_name}
    mkdir -p build
    bsdtar xf ${_deb_file_name} -C build
    bsdtar xf build/${_deb_file_name} -C build
}
package() {
	cd "$srcdir"

	msg2 'Installing LPCScrypt'
	tar xf "build/data.tar.gz" -C "${pkgdir}/"
	mv "${pkgdir}/lib" "${pkgdir}/usr"
	msg2 'Instalation of binary file'
	install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<END
#!/bin/sh
/usr/local/lpcscrypt-2.1.2_57/bin/lpcscrypt "\$@"
END

	msg2 'Instalation of license file'
	install -dm0755 "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
	cp -rv  "${pkgdir}/usr/local/lpcscrypt-2.1.2_57/eula" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
