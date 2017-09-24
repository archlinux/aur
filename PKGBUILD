# Maintainer: dreieck

_pkgname=vuescan
pkgname="${_pkgname}"
# Package Version: See "${url}". There is written something like "Version 9.5.86. Updated September 24, 2017. Built with 64-bit Ubuntu 10.10 or click here to download other versions".
_pkgver_p1=9
_pkgver_p2=5
_pkgver_p3=86
_pkgver="${_pkgver_p1}.${_pkgver_p2}.${_pkgver_p3}"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="An integrated scanning UI, providing it's own scanner drivers, also for older scanners."
url='http://www.hamrick.com/'
license=('custom:shareware')
arch=('i686' 'x86_64')
depends=(
  'libsm'
  'gcc-libs'
  'libusb-compat'
  'gtk2'
)
makedepends=()
checkdepends=()
optdepends=()
provides=("${_pkgname}-doc=${pkgver}")
replaces=("${_pkgname}-doc<=${pkgver}")
conflicts=("${_pkgname}-doc")

case "${CARCH}" in
  'i686')
    _bit=32
    _source_binary_sha256='9a4cd973c7cfd81f719ef8b2002a6ddb10b822de8db7c13d5475392ceeffa8db'
  ;;
  'x86_64')
    _bit=64
    _source_binary_sha256='13f166e91507be780d4a445ea52ee012ff8ccf359c55116f192565b7ecb923b5'
  ;;
  *)
    msg "Architecture ${CARCH} not supported."
    exit 1
  ;;
esac

_source_binary="http://www.hamrick.com/files/vuex${_bit}${_pkgver_p1}${_pkgver_p2}.tgz"

source=(
  "${_source_binary}"
  "vuescan.pdf::http://www.hamrick.com/vuescan/vuescan.pdf"
  "quicknotes.html::http://www.hamrick.com/vuescan/vuescan.htm"
  "license.html::http://www.hamrick.com/reg.html"
  "website.url"
  "supported-scanners.url"
  "usersguide_html.url"
  "license.url"
  "shareware-dummy.txt"
)

sha256sums=(
  "${_source_binary_sha256}"
  "SKIP"
  "SKIP"
  "SKIP"
  'd7d05142fa9e1245b0ef6b1ccb49a41378b99d4cfa0ecd57d67dc0b1ce4c8776'
  '191e2556d73af8c79f7044b3a85cf43443fe462e211af5ccea1befbf2bea1b73'
  'dd1978295df20be26d44ababcc1c99434b23b00033917b3ba46652ef4ba29f72'
  '6e8e6ee047947d000626c6730858cb421a10d8a5d42c793cd4261f528b905ea1'
  '14f557c10f419d2d1d234952eb6e239446bd1d27b81da7d6c475915caf12b438'
)

package() {

  # Definition of target directories.
  _installdir_base="/opt/${_pkgname}"
  _installdir="${pkgdir}/${_installdir_base}"
  _bindir="${pkgdir}/usr/bin"
  _icondir="${pkgdir}/usr/share/icons/"
  _docdir="${pkgdir}/usr/share/doc/${_pkgname}"
  _licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
  
  # Main software.
  install -d -m 755 -v "${_installdir}"
  cp -av "${srcdir}/VueScan"/* "${_installdir}"
  chmod 755 "${_installdir}/vuescan"
  chmod 644 "${_installdir}"/{vuescan.8ba,vuescan.ds,vuescan.svg}
  
  # Icon.
  install -d -m 755 -v "${_icondir}"
  cd "${_icondir}"
  ln -sv "${_installdir_base}/vuescan.svg" 'vuescan.svg'
  
  # Executable in ${PATH}.
  install -d -m 755 -v "${_bindir}"
  cd "${_bindir}"
  ln -sv "${_installdir_base}/vuescan" 'vuescan'
  
  # Documentation.
  install -D -m 644 -v "${srcdir}/vuescan.pdf" "${_docdir}/vuescan.pdf"
  install -D -m 644 -v "${srcdir}/website.url" "${_docdir}/website.url"
  install -D -m 644 -v "${srcdir}/usersguide_html.url" "${_docdir}/usersguide_html.url"
  install -D -m 644 -v "${srcdir}/license.url" "${_docdir}/license.url"
  
  # License information.
  install -D -m 644 -v "${srcdir}/license.url" "${_licensedir}/license.url"
  install -D -m 644 -v "${srcdir}/license.html" "${_licensedir}/license.html"
  install -D -m 644 -v "${srcdir}/shareware-dummy.txt" "${_licensedir}/shareware-dummy.txt"
}
