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
pkgdesc='A fancy custom distribution of Valves Proton with various patches'
pkgname=proton-ge-custom-camera-bin
pkgver=ge_proton10_32_qcap_dshow_fixes
pkgrel=4
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
changelog=changelog.md
provides=('proton' "proton-ge-custom-camera=${pkgver/_/.}")
conflicts=('proton-ge-custom-camera')

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
  'libjpeg-turbo'
  'graphene'
  'lib32-libjpeg-turbo'
  'lib32-libgudev'
  'lib32-mpg123'
  'libsoup'
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
_srcdir=${_pkgver}

## paths and files
_protondir=usr/share/steam/compatibilitytools.d/${_pkgname}
_licensedir=usr/share/licenses/${pkgname}
_execfile=usr/bin/proton-camera
_protoncfg=${_protondir}/user_settings.py

## user edited files to backup
backup=("${_protoncfg}")

## sources
url='https://github.com/LilFishyChan/proton-ge-custom'
_url='https://github.com/P1KaChU337/proton-cachyos-camera-fix-for-vrc/raw'
source=(
  "${_pkgver}_${pkgrel}.tar.gz::${url}/releases/download/${_pkgver}/${_pkgver}.tar.gz"
  'user_settings.py'
  'launcher.sh'
  'pam_limits.conf'
  "${_url}/5cd34b993b1814d9cb3c8c14b03fe67a139d5511/dlls/mf.dll"
  "${_url}/5cd34b993b1814d9cb3c8c14b03fe67a139d5511/dlls/quartz.dll"
  "${_url}/5cd34b993b1814d9cb3c8c14b03fe67a139d5511/dlls/qcap.dll"
  "${_url}/5cd34b993b1814d9cb3c8c14b03fe67a139d5511/dlls/qedit.dll"
  "${_url}/5cd34b993b1814d9cb3c8c14b03fe67a139d5511/dlls/devenum.dll"
  "${_url}/5cd34b993b1814d9cb3c8c14b03fe67a139d5511/dlls/avicap32.dll"
)
sha512sums=(
  'e58c90865927dabd6560af850621f43263680da752f8e6246e7bc1550c04673d2de30c797722988bfa51a5ab6faa25b9e8d04c8d7bd84c087770296189045c91'
  'babe2a461118bef6a777656a10bb89abeee2c8c3ed4285eb1b99f5ba517b779f18372d1d93ed2cce63b0d8111cf0b08e14a0c92435680239f6936783c3e4cbc5'
  '78ede6d50f9c43407da511c8b37dcf60aae2ddbd461c0081f0d0ce3de08ace3a84dee86e9253acbac829b47c5818ef4e1a354ccb05feaa9853ce279dc3f903fd'
  'c64898bd41801470925fb0efdcf7d247e5cb476fb4745f83ceeccf12041474e5c309fb1c2ac1483b419d12b4ade7668c046bebded4e3bf4708737ee505b080a1'
  '14246c8322b948bcfc0c4cf69298860a8f83dfaae05fcddef88c145a67089b8f1279186a7d0d8cd54f3b525d9ae9fcd5b7c7d9b327b10376cafb964644bd3de2'  # mf.dll
  '6e17a053110aea8878a722e9831d4b21b6480d347c47c30293640e3201d4f768476c5af92cb27c6ba747855bc0bf5ed8ceb7246dd96d0e484d0ccd338b597100'  # quartz.dll
  '296c832f28828b9a29d6366063c0d23cdc5feb53eed16870472c013cf394308cf61218f00417d4094ba77ed6235ba9ce5ff2b491244b2d89cba51c763e762912'  # qcap.dll
  '310b80360b67fbcadd209c4e5856f9e26a15926751a9918dc9f5d36fa5a01f0c6dc72708020d294db00f273562d6a9bd767e3a62ce81bf70d1b8e5a084e7514c'  # qedit.dll
  '748bbd18096cb976fbba1ebb05bba78abd098192f83812d81cad40d23d4f8a5a761f0c1673a14e14f3dc4b8acf53621a6166b5fc8a4213eeba6505f5ac8a00d3'  # devenum.dll
  '498afea0fa106a01cdc9484f33426f871f0b5bd5a3d189a92f73b6554d77ce20ba0dbe21b6f94d4da81304687130b51ab1bc98396881d5b765c0ffb5e1057e71'  # avicap32.dll
)

build() {
  ## patches
  sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" "${srcdir}"/launcher.sh
  sed -i -r 's|"GE-Proton.*"|"Proton-GE-Camera"|' "${_srcdir}"/compatibilitytool.vdf
  ## fixes from namcap inspection
  strip --preserve-dates --strip-unneeded "${_srcdir}"/files/bin/wine*
}

package() {
  ## create paths
  install -d "${pkgdir}/${_protondir}/"
  install -d "${pkgdir}/${_licensedir}/"
  install -d "${pkgdir}/$(dirname ${_execfile})/"
  install -d "${pkgdir}/etc/security/limits.d/"

  # Create system32 and syswow64 directories if they don't exist
  install -d "${pkgdir}/${_protondir}/system32"
  install -d "${pkgdir}/${_protondir}/syswow64"

  ## licenses
  mv "${_srcdir}/LICENSE" "${pkgdir}/${_licensedir}/license"
  mv "${_srcdir}/LICENSE.OFL" "${pkgdir}/${_licensedir}/license_OFL"
  mv "${_srcdir}/PATENTS.AV1" "${pkgdir}/${_licensedir}/license_AV1"

  ## config files
  install --mode=0775 --group=50 "${srcdir}"/user_settings.py "${pkgdir}/${_protoncfg}"
  install --mode=0644 "${srcdir}"/pam_limits.conf "${pkgdir}"/etc/security/limits.d/12-games.conf

  ## executables
  mv "${_srcdir}"/* "${pkgdir}/${_protondir}"

  # Install camera fix DLLs to both system32 and syswow64 directories
  install --mode=0755 "${srcdir}"/mf.dll "${pkgdir}/${_protondir}/system32/"
  install --mode=0755 "${srcdir}"/quartz.dll "${pkgdir}/${_protondir}/system32/"
  install --mode=0755 "${srcdir}"/qcap.dll "${pkgdir}/${_protondir}/system32/"
  install --mode=0755 "${srcdir}"/qedit.dll "${pkgdir}/${_protondir}/system32/"
  install --mode=0755 "${srcdir}"/devenum.dll "${pkgdir}/${_protondir}/system32/"
  install --mode=0755 "${srcdir}"/avicap32.dll "${pkgdir}/${_protondir}/system32/"

  # Also copy to syswow64 for 32-bit compatibility
  install --mode=0755 "${srcdir}"/mf.dll "${pkgdir}/${_protondir}/syswow64/"
  install --mode=0755 "${srcdir}"/quartz.dll "${pkgdir}/${_protondir}/syswow64/"
  install --mode=0755 "${srcdir}"/qcap.dll "${pkgdir}/${_protondir}/syswow64/"
  install --mode=0755 "${srcdir}"/qedit.dll "${pkgdir}/${_protondir}/syswow64/"
  install --mode=0755 "${srcdir}"/devenum.dll "${pkgdir}/${_protondir}/syswow64/"
  install --mode=0755 "${srcdir}"/avicap32.dll "${pkgdir}/${_protondir}/syswow64/"

  # Install launcher script
  install --mode=0755 "${srcdir}"/launcher.sh "${pkgdir}/${_execfile}"
}
