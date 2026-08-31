## Maintainer:     Shayne Hartford <shaybox@shaybox.com>
## Co-Maintainer:  Jaja <jaja@mailbox.org>
## Co-Maintainer:  floriplum <floriplum@mailbox.org>
## Co-Maintainer:  various people submitting to 'chaotic-aur' repo
## Credits:        barfin (aka RogueGirl) <barfin@protonmail.com>

## Linted using:
##   $ shellcheck PKGBUILD -e SC2034,SC2148,SC2154
## Formated using:
##   $ shfmt -w PKGBUILD

## pkginfo
pkgdesc='Custom Proton build for VRChat livestream support (RTSP/media playback)'
_pkgname=proton-rtsp
pkgname=${_pkgname}-bin
pkgver=11.0_20260609
pkgrel=3
epoch=4
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
provides=('proton' "proton-rtsp=${pkgver/_/.}")
conflicts=('proton-rtsp')

## dependencies
depends=('python'
  'vulkan-icd-loader'
  'lib32-vkd3d'
  # libav support #
  'lib32-libva'
  'lib32-libtheora'
  'lib32-libvdpau'
  # gstreamer support #
  'gst-plugins-bad-libs'
  'libjpeg-turbo'
  'graphene'
  'lib32-libjpeg-turbo'
  'lib32-libgudev'
  # other #
  'lib32-openssl'
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
_srcdir=${_pkgname}-${_pkgver}-${pkgrel}

## paths and files
_protondir=usr/share/steam/compatibilitytools.d/${_pkgname}
_licensedir=usr/share/licenses/${pkgname}
_execfile=usr/bin/proton-rtsp
_protoncfg=${_protondir}/user_settings.py

## user edited files to backup
backup=("$_protoncfg")

## sources
url='https://github.com/SpookySkeletons/proton-rtsp'
source=("${_pkgver}_${pkgrel}.tar.gz::${url}/releases/download/${_pkgname}-${_pkgver}-${pkgrel}/${_pkgname}-${_pkgver}-${pkgrel}.tar.gz"
  'user_settings.py'
  'launcher.sh'
  'proton-rtsp-bin.conf'
  'pam_limits.conf')
sha512sums=('a3fc8ed2da5f6a837f0242901f6b5dd24d923ff0b4a5483385aef0f16761e3dab1a7944704cfebfcf6e2d35339b6207cea52ef5fcfa95d6e496d3f5b656d6136'
            'babe2a461118bef6a777656a10bb89abeee2c8c3ed4285eb1b99f5ba517b779f18372d1d93ed2cce63b0d8111cf0b08e14a0c92435680239f6936783c3e4cbc5'
            '78ede6d50f9c43407da511c8b37dcf60aae2ddbd461c0081f0d0ce3de08ace3a84dee86e9253acbac829b47c5818ef4e1a354ccb05feaa9853ce279dc3f903fd'
            'ac2bd634838ffe6b90f2637e229013f0993fc1013271dbeefd216dc262a8bb79e4a5ce15a75cbfcb0c3b521d32f4ebe1ed25a6b066b99cc327b60bd6d7212e6f'
            'c64898bd41801470925fb0efdcf7d247e5cb476fb4745f83ceeccf12041474e5c309fb1c2ac1483b419d12b4ade7668c046bebded4e3bf4708737ee505b080a1')

build() {
  ## patches
  sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" "${srcdir}"/launcher.sh
  # sed -i -r 's|"GE-Proton.*"|"Proton-GE-RTSP"|' "${_srcdir}"/compatibilitytool.vdf
  ## fixes from namcap inspection
  strip --preserve-dates --strip-unneeded "${_srcdir}"/files/bin/wine*
}

package() {
  ## create paths
  install -d "${pkgdir}/${_protondir}/"
  install -d "${pkgdir}/${_licensedir}/"
  install -d "${pkgdir}/$(dirname "${_execfile}")/"
  install -d "${pkgdir}/etc/security/limits.d/"
  install -d "${pkgdir}/usr/lib/modules-load.d"
  ## licenses
  mv "${_srcdir}/LICENSE" "${pkgdir}/${_licensedir}/license"
  mv "${_srcdir}/LICENSE.OFL" "${pkgdir}/${_licensedir}/license_OFL"
  mv "${_srcdir}/PATENTS.AV1" "${pkgdir}/${_licensedir}/license_AV1"
  ## config files
  install --mode=0775 --group=50 "${srcdir}"/user_settings.py "${pkgdir}/${_protoncfg}"
  install --mode=0644 "${srcdir}"/pam_limits.conf "${pkgdir}"/etc/security/limits.d/12-games.conf
  install --mode=0644 "${srcdir}"/${pkgname}.conf "${pkgdir}"/usr/lib/modules-load.d/${pkgname}.conf
  ## executables
  mv "${_srcdir}"/* "${pkgdir}/${_protondir}"
  install --mode=0755 "${srcdir}"/launcher.sh "${pkgdir}/${_execfile}"
}

