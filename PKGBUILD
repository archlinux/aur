# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pjsipver=2.12
_zrtpcppver='6b3cd8e6783642292bad0c21e3e5e5ce45ff3e03'
_pkgname=python3-sipsimple
pkgname=python-sipsimple
pkgver=5.3.3
pkgrel=1
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
# patch to fix cstdint inclusion in ZRTPCPP EmojiBase32.cpp
  "fix_zrtpcpp_cstdint.patch"
# patch to fix ffmpeg video codec definitions
  "fix_ffmpeg_vid_codecs.patch"
# patch to switch the ALSA logging/error paths to stream->af->devs[...].info.name, matching the current alsa_dev_info structure and unblocking the pjmedia build.
  "fix_alsa_dev_name.patch"
  )
sha512sums=(
  '0059dc42f5c05d64919500cb9483b7430c83e707d1cc6babacfbba8312b0290fe25a8e9dd3de1b3ca7e95f6b139615505b1b3794f86799f6e3653c97ebec9626'
  '866039e9a2bfb8ace171db3dbc75e6a0d19102e90ba2077b32c89439ebf6b65bcf5c81b7b6b91b9bee3df458cfa949207e7ed40d23d9294b876b6e6bdb49494c'
  '37c3e268ac58a8ba6f2feaf09795d568e51d338b022dca1f65153a419b838e06ca5254788bd4fccd5658d716466d79de455fb2a5ba16be10ff3fc539cf101402'
  '72eea352bd1d32ce18e0a8841796925e9a167133168a926a8138db1e2ff71ab8ea41c793bbb1a870cc84df4385ffc55fb939658006b5d2953283194f4368ce5a'
  '01b3e2414db0e5ae59ff34ebac1b3cfed1f9f1d586a2efccb7c78633356cec6f9c2264202425e5a8b1b0b39a18f1f3ee92420f0689fd5bfd053d0dadcb84af4a'
  'ca14a392d04717f215beb76f500d4f442ef4135eaf4d2f957cff1930972a16567c1fc1b7983a32c614605f4ab00bfe78c5d70445fa93fcd1434ac006288f69c4'
  )

prepare() {
  cd "${srcdir}"
  cp pjproject-${_pjsipver}.tar.gz ${_pkgname}-${pkgver}/deps/${_pjsipver}.tar.gz
  rm -rf ${_pkgname}-${pkgver}/deps/ZRTPCPP || true
  cp ZRTPCPP-${_zrtpcppver} ${_pkgname}-${pkgver}/deps/ZRTPCPP -R
  cd ${_pkgname}-${pkgver}
  chmod +x ./get_dependencies.sh
  ./get_dependencies.sh
  patch -p1 < ../fix_zrtpcpp_cstdint.patch
  patch -p1 < ../fix_ffmpeg_vid_codecs.patch
  patch -p1 < ../fix_alsa_dev_name.patch
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
