# Maintainer:  TEL.RED LLC <ask_at_tel_d0t_red>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: stef312 <stef312_at_gmail_dot_com>
# Contributor: Gaspar de Elías <caspercba_at_hotmail_dot_com>
# Contributor: Artem Sheremet <dot_doom_at_gmail_dot_com>
pkgname=sky
pkgver=2.1.6513_4
pkgrel=1
pkgdesc="Lync and Skype for Business client on Linux"

arch=(
	'x86_64'
)
if [[ $CARCH == 'x86_64' ]]; then
	_arch=64
fi

url="http://tel.red"

license=('custom: Copyright © 2015-2016 TEL.RED LLC')
options=('!strip')
install="${pkgname}.install"

depends=(
	'ffmpeg2.8'
	'libcurl-compat>=7.38'
	'libjpeg6-turbo'
	'libxss'
	'libxrandr'
	'qt5-base>=5.6'
	'qt5-base<5.8.0'
)
makedepends=(
	'binutils'
	'tar'
	'xz'
)

source_x86_64=("https://tel.red/repos/debian/pool/non-free/sky_${pkgver//_/-}debian+jessie_amd64.deb")
sha256sums_x86_64=('a9e6f234670a7a386008045fc4100083f03b73eff497548802a394d3b273b5a4')

package() {
	local _sky_libdir="/usr/lib/sky/lib64"
	local _sky_bindir="/usr/lib/sky"
	local _sky_datadir=( "${_sky_bindir}/sounds" )

	cd "${srcdir}"
	ar x "sky_${pkgver//_/-}debian+jessie_amd64.deb" >/dev/null
	tar -Jxf data.tar.xz

	install -dm 0755 "${srcdir}${_sky_libdir}" "${pkgdir}${_sky_libdir}"
	find "${srcdir}${_sky_libdir}" -maxdepth 1 \( -type f -o -type l \) -a \( ! -name 'libQt5*' \) -exec install -m 0755 {} "${pkgdir}${_sky_libdir}/" \;
	ln -s "/usr/lib64/libcurl.so.3" "${pkgdir}${_sky_libdir}/libcurl.so.4"

	install -dm 0755 "${srcdir}${_sky_bindir}" "${pkgdir}${_sky_libdir}"
	find "${srcdir}${_sky_bindir}" -maxdepth 1 -type f -perm /0111 -exec install -m 0755 {} "${pkgdir}${_sky_bindir}/" \;
	install -dm 0755 "${pkgdir}/usr/bin"
	ln -s "../..${_sky_bindir}/sky" "${pkgdir}/usr/bin/sky"

	for dd in ${_sky_datadir[@]} ; do
		install -dm 0755 "${srcdir}${dd}" "${pkgdir}${dd}"
		cp -arT "${srcdir}${dd}" "${pkgdir}${dd}"
	done

	install -Dm 0644 ${srcdir}/usr/share/doc/sky/copyright ${pkgdir}/usr/share/licenses/sky/LICENSE
	install -Dm 0644 ${srcdir}/usr/share/applications/sky.desktop ${pkgdir}/usr/share/applications/sky.desktop
	for icon in 'sky.png' 'sky.svg'; do
		install -Dm 0644 ${srcdir}/usr/share/pixmaps/${icon} ${pkgdir}/usr/share/pixmaps/${icon}
	done
}

# vim: set ts=2 sw=2 ft=sh noet:
