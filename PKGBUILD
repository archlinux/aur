## Maintainer:     Jaja <jaja@mailbox.org>
## Co-Maintainer:  floriplum <floriplum@mailbox.org>
## Co-Maintainer:  various people submitting to 'chaotic-aur' repo
## Credits:        barfin (aka RogueGirl) <barfin@protonmail.com>

## Linted using:
##   $ shellcheck PKGBUILD -e SC2034,SC2148,SC2154
## Formated using:
##   $ shfmt -w PKGBUILD

## pkginfo
pkgdesc='Proton-GE兼容层，附带额外补丁：ntsync。Proton-GE with additional patches: ntsync.'
pkgname=proton-xiv-bin
pkgver=XIV_Proton10_8
pkgrel=1
epoch=1
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
changelog=changelog.md
provides=('proton-xiv' "xiv-proton=${pkgver/_/.}")

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
  'libsoup'
  # other #
  'lib32-openssl-1.1'
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
_srcdir=${_pkgver}-ntsync

## paths and files
_protondir=usr/share/steam/compatibilitytools.d/${_pkgname}
_licensedir=usr/share/licenses/${pkgname}
_execfile=usr/bin/proton-xiv
_protoncfg=${_protondir}/user_settings.py

## user edited files to backup
backup=("${_protoncfg}")

## sources
url='https://github.com/rankynbass/proton-xiv/'
source=("${_pkgver}_${pkgrel}-ntsync.tar.xz::${url}/releases/download/${_pkgver}/${_pkgver}-ntsync.tar.xz"
  'user_settings.py'
  'launcher.sh'
  'pam_limits.conf')
sha512sums=('7e7af92e1f08c9c37d44854da1f9301d0128f3e80cfa5a91f0494fa1a723bbe1fe92e77d62bbb2e1ab0e8e3b7060250611737fa653ecc5d4caec9664761c8307'
            '7c1a535d6dc33dbcd9de5605d4ec5b3cd38096d0d09de31c46037b3cbbbac8d4d64c24709b487ba3bd343eddae2b53d4f7b83559193381c09bc5961b9d7d75c2'
            '78ede6d50f9c43407da511c8b37dcf60aae2ddbd461c0081f0d0ce3de08ace3a84dee86e9253acbac829b47c5818ef4e1a354ccb05feaa9853ce279dc3f903fd'
            '60bcb1ad899d108fca9c6267321d11871feae96b696e44607ef533becc6decb493e93cbe699382e8163ad83f35cfa003a059499c37278f31afeba4700be6e356')

build() {
  ## patches
  sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" "${srcdir}"/launcher.sh
  sed -i -r 's|"XIV_Proton.*"|"Proton-XIV"|' "${_srcdir}"/compatibilitytool.vdf
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
  ## config files
  install --mode=0775 --group=50 "${srcdir}"/user_settings.py "${pkgdir}/${_protoncfg}"
  install --mode=0644 "${srcdir}"/pam_limits.conf "${pkgdir}"/etc/security/limits.d/20-games.conf
  ## executables
  mv "${_srcdir}"/* "${pkgdir}/${_protondir}"
  install --mode=0755 "${srcdir}"/launcher.sh "${pkgdir}/${_execfile}"
}
