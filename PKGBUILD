# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Conributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=bazarr-git
_pkgname=${pkgname/-git/}
pkgver=1.4.5.r50.gd6b74c908
pkgrel=1
pkgdesc="Subtitle management and download automation for Sonarr and Radarr."
arch=('any')
url="https://www.bazarr.media"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'ffmpeg'
  'gdk-pixbuf2'
  'python'
  'python-gevent'
  'python-gevent-websocket'
  'python-lxml'
  'python-numpy'
  'python-pillow'
  'python-webrtcvad'
  'sqlite'
  'unrar'
  'python-platformdirs'
  'python-ujson'
  'python-greenlet'
  'python-setuptools'
  'python-tomli'
)
makedepends=('git')
provides=('bazarr')
conflicts=('bazarr')
options=('!debug')
source=(
  'git+https://github.com/morpheus65535/bazarr'
  'bazarr.service'
  'bazarr.sysusers'
  'bazarr.tmpfiles'
  imghdr.py
)
sha256sums=('SKIP'
            '2782e250117f7a85110d62472b834316fadcf32ca1874ad01541e7dd9a54215c'
            '73a60121fd2b7b8f5bad75ec4b0f92552fcae0e29a4b9e6aaf15f86a825a88a3'
            'e7055260d0f3554e8b628d9560d8e12a40f720d76542048df0dfc838db88357b'
            'ff4b65f15e63c66747d6ede9b9dd3d1fe3c9216e33ecfe5c6889c0a5f3e87165')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  local _pyver="$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')"
  local _pdir="${pkgdir}/usr/lib/python${_pyver}/site-packages/${pkgname}"

  install -dm755 "${_pdir}"
  cp -dpr --no-preserve=ownership "${srcdir}/${_pkgname}/"* "${_pdir}"
  install -Dm644 "${srcdir}/imghdr.py" "${_pdir}/custom_libs/imghdr.py"
  python -m compileall "${pkgdir}"

  # License
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${_pdir}/LICENSE"

  rm "${_pdir}/"{*.hbs,*.md,*.txt}

  install -D -m 644 "${srcdir}/bazarr.service" "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -D -m 644 "${srcdir}/bazarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/bazarr.conf"
  install -D -m 644 "${srcdir}/bazarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bazarr.conf"
}
