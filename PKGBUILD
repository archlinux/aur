## Maintainer:     barfin <barfin@protonmail.com>
## Co-Maintainer:  Jaja <jaja@mailbox.org>
## Co-Maintainer:  floriplum <floriplum@mailbox.org>

## pkginfo
pkgdesc="A fancy custom distribution of Valves Proton with various patches"
pkgname=proton-ge-custom-bin
pkgver=GE_Proton7_3
pkgrel=1
epoch=1
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
changelog=changelog.md
provides=('proton' "proton-ge-custom=${pkgver/_/.}")
conflicts=('proton-ge-custom-legacy-bin' 'proton-ge-custom')

## dependencies
depends=('python'
         'vulkan-icd-loader'
         'lib32-libusb'
         'lib32-openal'
         'lib32-sdl2'
         'lib32-v4l-utils'
         'lib32-jack'
         'lib32-libva'
         'ffmpeg4.4'
         'lib32-speex'
         'lib32-libtheora'
         'gst-plugins-bad-libs'
         'lib32-gst-plugins-base-libs'
         'libjpeg6-turbo'
         'lib32-libjpeg6-turbo'
         'lib32-libgudev'
         'lib32-flac'
         'lib32-mpg123')
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
options=('!strip')

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
source=(${_pkgver}_${pkgrel}.tar.gz::"${url}/releases/download/${_pkgver}/${_pkgver}.tar.gz"
        "supplementary.tar.zst")
sha512sums=('d3d43785bfdc7fd9af1c47d1dc109c77c0abeb4f552f764a0ce6ebf8e127701fd0a32ce3cc2ed1cae350622883760bf94e93d815669155896de44a5825e6904d'
            '6a0edd52bbbe0bc724bcb92a3fe05b22393d4e7e40869c3eb978c6a997ac2ace2af76809fa7587513848c86ab29285665cdcd2e1ddb7a1de5fd0cf950e889383')

build() {
## patches
install --mode=0755 ${srcdir}/patches/tracked_files ${_srcdir}/proton_ge_tracked_files
sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" ${srcdir}/launchers/proton.sh
sed -i -r 's|"GE-Proton.*"|"Proton-GE"|' ${_srcdir}/compatibilitytool.vdf
## remove artifacts
rm "${_srcdir}"/protonfixes/*.tar.xz
## fixes from namcap inspection
strip --preserve-dates --strip-unneeded "${_srcdir}"/files/bin/wine*
}

package() {
## create paths
install -d ${pkgdir}/${_protondir}/
install -d ${pkgdir}/${_licensedir}/
install -d ${pkgdir}/$(dirname ${_execfile})/
## licenses
mv ${_srcdir}/LICENSE ${pkgdir}/${_licensedir}/license
mv ${_srcdir}/LICENSE.OFL ${pkgdir}/${_licensedir}/license_OFL
mv ${_srcdir}/PATENTS.AV1 ${pkgdir}/${_licensedir}/license_AV1
mv ${_srcdir}/protonfixes/LICENSE ${pkgdir}/${_licensedir}/license_protonfixes
## config files
install --mode=0775 --group=50 ${srcdir}/configs/user_settings.py ${pkgdir}/${_protoncfg}
## executables
mv ${_srcdir}/* ${pkgdir}/${_protondir}
install --mode=0755 ${srcdir}/launchers/proton.sh ${pkgdir}/${_execfile}
}
