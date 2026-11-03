# Maintainer: Thomas Ludwig <business at tludwig dot dev>
# Contributor:     Jaja <jaja@mailbox.org>
# Contributor:  floriplum <floriplum@mailbox.org>
# Contributor:  various people submitting to 'chaotic-aur' repo
# Contributor:        barfin (aka RogueGirl) <barfin@protonmail.com>
# Credits:            felipec (thanks for your cleanup gist https://gist.github.com/felipec/86dcbe352d9f01bdc43c89bb5846e1bd)

## pkginfo
pkgdesc='A fancy custom distribution of Valves Proton with various patches'
pkgname=proton-ge-custom-bin
pkgver=GE_Proton11_12
pkgrel=1
epoch=1
arch=('x86_64' 'aarch64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
provides=('proton' "proton-ge-custom=${pkgver/_/.}")
conflicts=('proton-ge-custom' 'proton-ge-bin')

## dependencies
depends=(
  'python'
  'ntsync-autoload'
)

optdepends=(
  'vulkan-icd-loader: dxvk dependency'
  'lib32-vulkan-icd-loader: dxvk dependency for 32bit prefixes'
  'kdialog: KDE splash dialog support'
  'zenity: GNOME splash dialog support'
  'python-kivy: splash dialog support (big picture mode)'
  'steam: use proton with steam like intended'
  'vulkan-driver: driver to be used by dxvk'
  'winetricks: protonfixes backend - highly recommended'
  'wine: support for 32bit prefixes'
  'xboxdrv: gamepad driver service'
  'lapack: Vosk speech recognition support'
  'lib32-lapack: Vosk speech recognition support for 32bit applications'
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
  'pam_limits.conf'
)

source_x86_64=(
  "${_pkgver}_${pkgrel}-x86_64.tar.gz::${url}/releases/download/${_pkgver}/${_pkgver}-x86_64.tar.gz"
)

source_aarch64=(
  "${_pkgver}_${pkgrel}-aarch64.tar.gz::${url}/releases/download/${_pkgver}/${_pkgver}-aarch64.tar.gz"
)

sha512sums=(
  'd7f93fe65eacbab62accfb14755c8131aaf994de286c1a3ce921d75f8451220bf4415d3f323e377e34006fe51db9bc303f4410ebe8df5ef04871cd26ac70a14d'
  '78ede6d50f9c43407da511c8b37dcf60aae2ddbd461c0081f0d0ce3de08ace3a84dee86e9253acbac829b47c5818ef4e1a354ccb05feaa9853ce279dc3f903fd'
  '60bcb1ad899d108fca9c6267321d11871feae96b696e44607ef533becc6decb493e93cbe699382e8163ad83f35cfa003a059499c37278f31afeba4700be6e356'
)

sha512sums_x86_64=(
  '2e37447902529c9fc39138dc0b3f24aed3513b59a190b825e6b4a668e49e2033bdf6b8a7998e8686e067bbb3f61f3a6633e2408f0cc96f6dad983bd18e2db31e'
)

sha512sums_aarch64=(
  'a6b1ce66bf9e1afbaa672c3e6c22cb8ea6e6486924748a9c71c70b1b519199603492760e16c2411cd35498f6120cbe524157b1b8fdcf43190940b280a6069bcc'
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
  ## executables
  mv "${_srcdir}"/* "${pkgdir}/${_protondir}"
  install --mode=0755 "${srcdir}"/launcher.sh "${pkgdir}/${_execfile}"
}
