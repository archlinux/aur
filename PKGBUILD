## Maintainer:     barfin <barfin@protonmail.com>
## Co-Maintainer:  Jaja <jaja@mailbox.org>
## Co-Maintainer:  floriplum <floriplum@mailbox.org>

## pkginfo
pkgdesc="A fancy custom distribution of Valves Proton with various patches"
pkgname=proton-ge-custom-bin
pkgver=7.3_GE_1
pkgrel=2
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
changelog=changelog
provides=('proton' "proton-ge-custom=${pkgver/_/.}")
conflicts=('proton-ge-custom-legacy-bin' 'proton-ge-custom')

## dependencies
makedepends=('patch')
depends=('python'
         'vulkan-icd-loader'
         'lib32-v4l-utils'
         'lib32-flac'
         'lib32-speex'
         'lib32-gst-plugins-base-libs'
         'lib32-jack2'
         'lib32-libgudev'
         'lib32-mpg123'
         'lib32-libtheora'
         'ffmpeg4.4'
         'lib32-sdl2'
         'lib32-openal'
         'lib32-libva'
         'lib32-libjpeg6-turbo'
         'libjpeg6-turbo'
         'gst-plugins-bad-libs')
optdepends=('kdialog: KDE splash dialog support'
            'zenity: GNOME splash dialog support'
            'python-kivy: splash dialog support (big picture mode)'
            'steam: use proton with steam like intended'
            'lib32-vulkan-icd-loader: dxvk dependency for 32bit prefixes'
            'vulkan-driver: actually have a vulkan driver installed'
            'winetricks: protonfixes backend - highly recommended'
            'wine: support for 32bit prefixes'
            'xboxdrv: gamepad driver service'
            'lib32-libusb: wine usb support')

## makepkg options
options=('!strip')

## fix naming conventions, matching upstream
_pkgname=${pkgname//-bin/}
_pkgver=${pkgver//_/-}
_srcdir=Proton-${_pkgver}

## paths and files
_protondir=usr/share/steam/compatibilitytools.d/${_pkgname}
_licensedir=usr/share/licenses/${_pkgname}
_execfile=usr/bin/proton
_protoncfg=${_protondir}/user_settings.py

## user edited files to backup
backup=("${_protoncfg}")

## sources
url='https://github.com/GloriousEggroll/proton-ge-custom'
source=(${_pkgname}-${_pkgver}_${pkgrel}.tar.gz::"${url}/releases/download/${_pkgver}/${_srcdir}.tar.gz"
        "supplementary.tar.zst")
sha512sums=('a6cff92e0182ee3ce410be8958507e47758f6028c392343150b00a8f57c447e3011b1a3739f31233bb0aa83515982f4dd45c2dc53d33eb739868b2d0ce6e6893'
            '403f011e4299e3b2f7dc18b5c61729d500d07052aa9974d541fb5bce40dc59f8cd341fc77551668fc416d24f71de42b3ad39040f277cba7529b5361b548de051')

build() {
## remove unused: dist_lock, cleanup_legacy_dist(), need_tarball_extraction(), extract_tarball()
patch "${_srcdir}"/proton patches/distlock-extract-defaultpfx.patch
## use newest dist
rm -rf "${_srcdir}/dist"/*
bsdtar -xf "${_srcdir}"/proton_dist.tar.gz -C "${_srcdir}"/dist
## remove artifacts
rm "${_srcdir}"/proton_dist.tar.gz
rm "${_srcdir}"/protonfixes/*.tar.xz
## setup paths
sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" ${srcdir}/launchers/proton.sh
## setup naming that appears in steam compat tool list
sed -i -r 's|"Proton-.*"|"Proton-GE"|' ${srcdir}/Proton-${_pkgver}/compatibilitytool.vdf
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
## patches
# Setup replacement tracked_files. If used without steam, we never get this file? Used by launcher script.
# Update from your ~/.steam/steam/steamapps/compatdata/0/tracked_files please. It gets created as soon as you start steam.
# Check first ~/.steam/steam/steamapps/compatdata/0/version if it is the correct version of GE, though!
install --mode=0755 ${srcdir}/patches/tracked_files ${pkgdir}/${_protondir}/proton_ge_tracked_files
}
