## Maintainer:     barfin <barfin@protonmail.com>
## Co-Maintainer:  Jaja <jaja@mailbox.org>
## Co-Maintainer:  floriplum <floriplum@mailbox.org>

## Linted using:
##   $ shellcheck PKGBUILD -e SC2034,SC2148,SC2154
## Formated using:
##   $ shfmt -w PKGBUILD

## pkginfo
pkgdesc='A fancy custom distribution of Valves Proton with various patches'
pkgname=proton-ge-custom-bin
pkgver=GE_Proton7_14
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
	'lib32-libjpeg6-turbo'
	'lib32-libgudev'
	'lib32-flac'
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
	'supplementary.tar.zst')
sha512sums=('3cbe99a2659dab1871cef0b50deb8cab4f101cc4d0531ed3d2cd7cf89dcee6aa08357b3d485e4260ab7a46af13bf6349daed16deb382cbadd5b2831ba7ad5503'
            '78f4874746b45151890edede89acc5fef6c6143d93d63db27b592a17f9a3eaa7bcfd25049807f9600794ba1244b121636ebf58ea51a5079e7c7ceef36d0c56a0')

build() {
	## patches
	sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" "${srcdir}"/launchers/proton.sh
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
	install --mode=0775 --group=50 "${srcdir}"/configs/user_settings.py "${pkgdir}/${_protoncfg}"
	install --mode=0644 "${srcdir}"/configs/limits.conf "${pkgdir}"/etc/security/limits.d/10-games.conf
	## executables
	mv "${_srcdir}"/* "${pkgdir}/${_protondir}"
	install --mode=0755 "${srcdir}"/launchers/proton.sh "${pkgdir}/${_execfile}"
}
