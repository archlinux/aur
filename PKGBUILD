## Maintainer:     Jaja <jaja@mailbox.org>
## Co-Maintainer:  floriplum <floriplum@mailbox.org>
## Co-Maintainer:  various people submitting to 'chaotic-aur' repo
## Credits:        barfin <barfin@protonmail.com>

## Linted using:
##   $ shellcheck PKGBUILD -e SC2034,SC2148,SC2154
## Formated using:
##   $ shfmt -w PKGBUILD

## pkginfo
pkgdesc='A fancy custom distribution of Valves Proton with various patches'
pkgname=proton-ge-custom-bin
pkgver=GE_Proton7_35
pkgrel=1
epoch=1
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
changelog=changelog.md
provides=('proton' "proton-ge-custom=${pkgver/_/.}")
conflicts=('proton-ge-custom')

## dependencies
depends=('python'
	'vulkan-icd-loader'
	'lib32-openal'
	'lib32-vkd3d'
	# libav support #
	'lib32-libva'
	'ffmpeg4.4'
	'lib32-speex'
	'lib32-libtheora'
	'lib32-libvdpau'
	# gstreamer support #
	'gst-plugins-bad-libs'
	'lib32-gst-plugins-base-libs'
	'libjpeg6-turbo'
	'graphene'
	'lib32-libjpeg6-turbo'
	'lib32-libgudev'
	'lib32-mpg123'
	'lib32-libusb')
optdepends=('kdialog: KDE splash dialog support'
	'zenity: GNOME splash dialog support'
	'python-kivy: splash dialog support (big picture mode)'
	'steam: use proton with steam like intended'
	'lib32-vulkan-icd-loader: dxvk dependency for 32bit prefixes'
	'vulkan-driver: driver to be used by dxvk'
	'winetricks: protonfixes backend - highly recommended'
	'wine: support for 32bit prefixes'
	'xboxdrv: gamepad driver service')

## makepkg options
options=(!strip emptydirs)
install=pleasenote.install

## fix naming conventions, matching upstream
_pkgname=${pkgname//-bin/}
_pkgver=${pkgver//_/-}
_srcdir=${_pkgver}

## paths and files
_protondir=usr/share/steam/compatibilitytools.d/${_pkgname}
_licensedir=usr/share/licenses/${pkgname}
_execfile=usr/bin/proton
_protoncfg=${_protondir}/user_settings.py

## user edited files to backup
backup=("${_protoncfg}")

## sources
url='https://github.com/GloriousEggroll/proton-ge-custom'
source=("${_pkgver}_${pkgrel}.tar.gz::${url}/releases/download/${_pkgver}/${_pkgver}.tar.gz"
	'user_settings.py'
	'launcher.sh'
	'pam_limits.conf')
sha512sums=('ce6d1dcba3a458f154b7f80414e2201443cdc3c1a84ac3bf1ddb2fb6d9c8bf752c93714e7b0a2056daf566d302f0ca3fb8e224caf8bfd8c1bd695a7dc81e4fcf'
            '0b5b5786f93aee16303ab77f89ad2df146b7cd4950ccf80025d3a79be6cfdf6bc4771b0dc5063350b724ea8bd64b8f4a19a976efd974631c967f9ab2aa9c731c'
            '739f0c2dbb5dd171c16039eab2dc08c7f1cc7f161c5611e0e696c89c39dddb46baa67c6e9925675f878b8d3839042d81b26d3edfed678a6dac0ad8baa081f7cb'
            'c64898bd41801470925fb0efdcf7d247e5cb476fb4745f83ceeccf12041474e5c309fb1c2ac1483b419d12b4ade7668c046bebded4e3bf4708737ee505b080a1')

build() {
	## patches
	sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" "${srcdir}"/launcher.sh
	sed -i -r 's|"GE-Proton.*"|"Proton-GE"|' "${_srcdir}"/compatibilitytool.vdf
	## remove artifacts
	rm "${_srcdir}"/protonfixes/*.tar.xz
	rm -rf "${_srcdir}"/protonfixes/.git*
	## fixes from namcap inspection
	strip --preserve-dates --strip-unneeded "${_srcdir}"/files/bin/wine*
}

package() {
	## create paths
	install -d "${pkgdir}/${_protondir}/"
	install -d "${pkgdir}/${_licensedir}/"
	install -d "${pkgdir}/$(dirname ${_execfile})/"
	install -d "${pkgdir}/etc/security/limits.d/"
	## licenses
	mv "${_srcdir}/LICENSE" "${pkgdir}/${_licensedir}/license"
	mv "${_srcdir}/LICENSE.OFL" "${pkgdir}/${_licensedir}/license_OFL"
	mv "${_srcdir}/PATENTS.AV1" "${pkgdir}/${_licensedir}/license_AV1"
	mv "${_srcdir}/protonfixes/LICENSE" "${pkgdir}/${_licensedir}/license_protonfixes"
	## config files
	install --mode=0775 --group=50 "${srcdir}"/user_settings.py "${pkgdir}/${_protoncfg}"
	install --mode=0644 "${srcdir}"/pam_limits.conf "${pkgdir}"/etc/security/limits.d/10-games.conf
	## executables
	mv "${_srcdir}"/* "${pkgdir}/${_protondir}"
	install --mode=0755 "${srcdir}"/launcher.sh "${pkgdir}/${_execfile}"
}
