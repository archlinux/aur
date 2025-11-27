# Maintainer: Andreas Hemmerle <andreas.hemmerle@gmail.com>
pkgname=adbfileexplorer-git
pkgver=git
pkgrel=3
pkgdesc='Simple File Explorer for adb devices'
arch=(any)
license=('GPL-3.0-only')
url='https://github.com/Aldeshov/ADBFileExplorer'
depends=(
  'android-tools'
  'python>=3.8'
  'python-cffi'
  'python-cryptography'
  'python-pyasn1'
  'python-pycparser'
  'python-pyqt5'
  'python-pyqt5-sip'
  'python-pyqt5-stubs'
  'python-rsa'
  'python-setuptools'
)
makedepends=('gendesk' 'git')
# optdepends=(
#   'python-adb-shell: Python implementation of ADB'
#   'python-libusb1: Only needed if you choose the Python implementation of ADB'
# )
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Aldeshov/ADBFileExplorer/archive/refs/tags/v${pkgver}.tar.gz")
# sha512sums=('2d423ec6ceced3220d5252e3b8973247a71b02ce642d01bde61e1bbeb0678585ed34d0fe3e8cf9c1f9865829ae61873a549d9fe3a5172711ccb5cfa1870967f4')
source=(
  "${pkgname}::git+https://github.com/Aldeshov/ADBFileExplorer.git"
  'startup.patch'
)
sha256sums=('SKIP'
            '234e8e8689347675781fb232161f28c60762860c184f91c60fd3e556efa5c5cc')
_realname='ADBFileExplorer'


pkgver() {
  cd "${srcdir}/${pkgname}" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare () {
  cd "${srcdir}/${pkgname}" || exit 1

  #startup changes
  patch "run.sh" --input='../startup.patch'

  # desktop icon
  gendesk -q -n -f --pkgname "${_realname,,}" --pkgdesc "$pkgdesc" --name "$_realname" --exec "$_realname" --icon "${_realname,,}" --categories 'Utility' --startupnotify 'true'
  sed -i '/Version/d' "${_realname,,}.desktop"
}


package () {
  _instDir="$pkgdir/opt/$_realname"
  mkdir -p "$_instDir"

  cp -dr --no-preserve=ownership "${srcdir}/${pkgname}"/{src,LICENSE,README.*} "$_instDir/"

  install -Dm755 "${srcdir}/${pkgname}/run.sh" "${_instDir}/run.sh"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${_realname}/run.sh" "${pkgdir}/usr/bin/${_realname}"

  install -Dm644 "$srcdir/$pkgname/src/resources/icons/logo.svg" "$pkgdir/usr/share/pixmaps/${_realname,,}.svg"
  install -Dm644 "$srcdir/$pkgname/${_realname,,}.desktop" "$pkgdir/usr/share/applications/${_realname,,}.desktop"
}
