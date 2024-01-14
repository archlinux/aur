# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pjsipver=2.10
_zrtpcppver='6b3cd8e6783642292bad0c21e3e5e5ce45ff3e03'
_pkgname=python3-sipsimple
pkgname=python-sipsimple
pkgver=5.3.0
pkgrel=2
pkgdesc='SIP SIMPLE SDK is a Python library for desktop operating'
license=('GPL-3+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-sipsimple"
makedepends=(
  'cython0'
  'python-build'
  'python-installer'
  'python-wheel'
  )
depends=(
  'alsa-lib'
  'ffmpeg'
  'libvpx'
  'opencore-amr'
  'openssl'
  'opus'
  'python-application'
  'python-dateutil'
  'python-dnspython'
  'python-eventlib'
  'python-gevent'
  'python-gnutls'
  'python-lxml'
  'python-msrplib'
  'python-otr'
  'python-twisted'
  'python-xcaplib'
  'sqlite'
  'x264'
  'util-linux-libs'
  'v4l-utils'
  )
optdepends=(
  'avahi'
  )
conflicts=('python3-sipsimple')
provides=('python3-sipsimple')
replaces=('python3-sipsimple')
options=('!makeflags')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/${pkgver}.tar.gz"
  "pjproject-${_pjsipver}.tar.gz::https://github.com/pjsip/pjproject/archive/${_pjsipver}.tar.gz"
  "ZRTPCPP-${_zrtpcppver}.tar.gz::https://github.com/wernerd/ZRTPCPP/archive/${_zrtpcppver}.tar.gz"
  )
sha512sums=(
  '3fa88065c1c14b9d6bc8459a4b21b67acc562b50d8051dedfea5be4b19dd550785e89af5025f8a05e3114758edf8db210aa8175cdec60790e6352998376b7bd0'
  'a67f083df175b536b4e6a7b7fe39e07d3ee805d6917ec64a50694542a7455c33a100889191044ab3fa679b6656774a6be045621aa53510b5f04cdde9ddd59893'
  '37c3e268ac58a8ba6f2feaf09795d568e51d338b022dca1f65153a419b838e06ca5254788bd4fccd5658d716466d79de455fb2a5ba16be10ff3fc539cf101402'
  )

prepare() {
  cd "${srcdir}"
  cp pjproject-${_pjsipver}.tar.gz ${_pkgname}-${pkgver}/deps/${_pjsipver}.tar.gz
  cp ZRTPCPP-${_zrtpcppver} ${_pkgname}-${pkgver}/deps/ZRTPCPP -R

  cd ${_pkgname}-${pkgver}
  ./get_dependencies.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
