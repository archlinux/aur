# Maintainer: Thomas Ludwig <business at tludwig dot dev>
# Contributor:     Jaja <jaja@mailbox.org>
# Contributor:  floriplum <floriplum@mailbox.org>
# Contributor:  various people submitting to 'chaotic-aur' repo
# Contributor:        barfin (aka RogueGirl) <barfin@protonmail.com>

## pkginfo
pkgdesc='A fancy custom distribution of Valves Proton with various patches'
pkgname=proton-ge-custom-bin
pkgver=GE_Proton11_5
pkgrel=1
epoch=1
arch=('x86_64' 'aarch64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
changelog=changelog.md
provides=('proton' "proton-ge-custom=${pkgver/_/.}")
conflicts=('proton-ge-custom' 'proton-ge-bin')

## dependencies
depends=('python')
optdepends=(
  'vulkan-icd-loader'
  'lib32-openal'
  'lib32-vkd3d'
  'lib32-vulkan-icd-loader: dxvk dependency for 32bit prefixes'
  # libav support #
  'lib32-libva'
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
  # other libs #
  'lib32-openssl'
  'lib32-libusb'
  # other #
  'kdialog: KDE splash dialog support'
  'zenity: GNOME splash dialog support'
  'python-kivy: splash dialog support (big picture mode)'
  'steam: use proton with steam like intended'
  'vulkan-driver: driver to be used by dxvk'
  'winetricks: protonfixes backend - highly recommended'
  'wine: support for 32bit prefixes'
  'xboxdrv: gamepad driver service'
)

## makepkg options
options=(!strip emptydirs)
install=pleasenote.install

## fix naming conventions, matching upstream
_pkgname=${pkgname//-bin/}
_pkgver=${pkgver//_/-}
_srcdir="${_pkgver}-${CARCH}"

## paths and files
_protondir=usr/share/steam/compatibilitytools.d/${_pkgname}
_licensedir=usr/share/licenses/${pkgname}
_execfile=usr/bin/proton-ge
_protoncfg=${_protondir}/user_settings.py

## user edited files to backup
backup=("$_protoncfg")

## sources
url='https://github.com/GloriousEggroll/proton-ge-custom'
source=(
  'user_settings.py'
  'launcher.sh'
  'proton-ge-custom-bin.conf'
  'pam_limits.conf'
)

source_x86_64=(
  "${_pkgver}_${pkgrel}-x86_64.tar.gz::${url}/releases/download/${_pkgver}/${_pkgver}-x86_64.tar.gz"
)

source_aarch64=(
  "${_pkgver}_${pkgrel}-aarch64.tar.gz::${url}/releases/download/${_pkgver}/${_pkgver}-aarch64.tar.gz"
)

sha512sums=(
  '5d1a841d3f8f65f9e62742f84eeccfb198a0292a97ba9109f377a550a4de0e2913d1e17b3d90ecd37ac09411dc67e54662dc1be301554ce05fd128d842252deb'
  '78ede6d50f9c43407da511c8b37dcf60aae2ddbd461c0081f0d0ce3de08ace3a84dee86e9253acbac829b47c5818ef4e1a354ccb05feaa9853ce279dc3f903fd'
  'ac2bd634838ffe6b90f2637e229013f0993fc1013271dbeefd216dc262a8bb79e4a5ce15a75cbfcb0c3b521d32f4ebe1ed25a6b066b99cc327b60bd6d7212e6f'
  '60bcb1ad899d108fca9c6267321d11871feae96b696e44607ef533becc6decb493e93cbe699382e8163ad83f35cfa003a059499c37278f31afeba4700be6e356'
)

sha512sums_x86_64=(
  '8fb1f3ae65a8dc22efd8099ff489075f0eebddf01c445b423244589f6f0a1e19c01de5d1e722b97fc1ebaf6390c813052ed55290058f8d21f1353a36146f4a2c'
)

sha512sums_aarch64=(
  'fa3048f55a70e4090a38e23d4182bcf4100c6cfbdb1a9b1b21aa01dfd2ba68ef6cc70f00242171c0f836d1e4753dfca146453baba6042f2d61ebef47d4f3cd84'
)

build() {
  ## patches
  sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" "${srcdir}"/launcher.sh
  sed -i -r 's|"GE-Proton.*"|"Proton-GE"|' "${_srcdir}"/compatibilitytool.vdf
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
  install --mode=0644 "${srcdir}"/pam_limits.conf "${pkgdir}"/etc/security/limits.d/10-games.conf
  install --mode=0644 "${srcdir}"/${pkgname}.conf "${pkgdir}"/usr/lib/modules-load.d/${pkgname}.conf
  ## executables
  mv "${_srcdir}"/* "${pkgdir}/${_protondir}"
  install --mode=0755 "${srcdir}"/launcher.sh "${pkgdir}/${_execfile}"
}
