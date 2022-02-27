## Maintainer:     barfin <barfin@protonmail.com>
## Co-Maintainer:  Jaja <jaja@mailbox.org>
## Co-Maintainer:  floriplum <floriplum@mailbox.org>

## pkginfo
pkgdesc="A fancy custom distribution of Valves Proton with various patches"
pkgname=proton-ge-custom-bin
pkgver=GE_Proton7_1
pkgrel=1
# remove epoch after some time, maybe 3 month or so
# we need to do this since upstream naming has changed :(
epoch=1
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
changelog=changelog.md
provides=('proton' "proton-ge-custom=${pkgver/_/.}")
conflicts=('proton-ge-custom-legacy-bin' 'proton-ge-custom')

## dependencies
makedepends=('patch')
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
source=(${_pkgname}-${_pkgver}_${pkgrel}.tar.gz::"${url}/releases/download/${_pkgver}/${_pkgver}.tar.gz"
        "supplementary.tar.zst")
sha512sums=('e41efb3b1ad9014a6b23a62b9372623e456db4b4546c44966b867d5ce0bbc5367d4c17046ed108179b69d27c2ee8e323a8e57698683e4ca807a23a9a5b16db41'
            'a5cacb0d5a619fbdcf89840ad818185d123dc9627592330435f9bdde45b9ae6b740e6d72e1af1c5267687055fb04c49bef2a940b4d80cae57170ebe692fb8523')

build() {
## patches
install --mode=0755 ${srcdir}/patches/tracked_files ${_srcdir}/proton_ge_tracked_files
sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" ${srcdir}/launchers/proton.sh
sed -i -r 's|"GE-Proton.*"|"Proton-GE"|' ${_srcdir}/compatibilitytool.vdf
## remove artifacts
rm "${_srcdir}"/protonfixes/*.tar.xz
## fixes from namcap inspection
chmod -R a+r "${_srcdir}"/protonfixes/gamefixes
strip --preserve-dates --strip-unneeded "${_srcdir}"/dist/bin/wine*
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
