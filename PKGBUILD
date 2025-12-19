# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Pieter Goetschalckx <3.14.e.ter@gmail.com>

pkgname=bazarr-beta
_pkgname=${pkgname/-beta/}
pkgver=1.5.4_beta.37
pkgrel=1
pkgdesc='Subtitle management and download automation for Sonarr and Radarr'
arch=(any)
url='https://www.bazarr.media'
license=('GPL-3.0-or-later')
depends=(
  bash
  ffmpeg
  gdk-pixbuf2
  python
  python-gevent
  python-gevent-websocket
  python-greenlet
  python-lxml
  python-magic
  python-numpy
  python-pillow
  python-platformdirs
  python-setuptools
  python-sqlalchemy
  python-tomli
  python-typing_extensions
  python-ujson
  python-webrtcvad
  sqlite
  unrar
)
makedepends=(unzip)
provides=(bazarr)
conflicts=(bazarr)
options=('!debug')
source=(
  "${pkgname}-${pkgver//_/-}.zip::https://github.com/morpheus65535/bazarr/releases/download/v${pkgver//_/-}/bazarr.zip"
  bazarr.service
  bazarr.sysusers
  bazarr.tmpfiles
  imghdr.py
)
noextract=("${pkgname}-${pkgver//_/-}.zip")
sha256sums=('6661affc2ff2e8b6e9b5e6c14283de7038ecf4b60eb56a001a1ad85305ba8a6a'
            '5921db5ff3d3501cc8ff4a137d161b525fb91cce02369d5cc39ef6eb7b3a79fc'
            '73a60121fd2b7b8f5bad75ec4b0f92552fcae0e29a4b9e6aaf15f86a825a88a3'
            'e7055260d0f3554e8b628d9560d8e12a40f720d76542048df0dfc838db88357b'
            'ff4b65f15e63c66747d6ede9b9dd3d1fe3c9216e33ecfe5c6889c0a5f3e87165')

prepare() {
  unzip -qq -o -d "${pkgname}-${pkgver//_/-}" "${pkgname}-${pkgver//_/-}.zip"
}

package() {
  local _pyver="$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')"
  # local _pdir="${pkgdir}/usr/lib/python${_pyver}/site-packages/${_pkgname}"
  local _pdir="${pkgdir}/opt/${_pkgname}"

  install -dm755 "${_pdir}"
  cp -dpr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver//_/-}/"* "${_pdir}"

  install -Dm644 "${srcdir}/imghdr.py" "${_pdir}/custom_libs/imghdr.py"

  rm -rf "${_pdir}/libs/sqlalchemy"
  rm -rf "${_pdir}/libs/SQLAlchemy-*.dist-info"
  rm -rf "${_pdir}/libs/typing_extensions.py"
  rm -rf "${_pdir}/libs/typing_extensions-*.dist-info"

  python -m compileall "${pkgdir}"

  install -Dm644 "${srcdir}/bazarr.service" "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -Dm644 "${srcdir}/bazarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/bazarr.conf"
  install -Dm644 "${srcdir}/bazarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bazarr.conf"
}
