# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pjsipver=2.10
_zrtpcppver='6b3cd8e6783642292bad0c21e3e5e5ce45ff3e03'
_pkgname=python3-sipsimple
_commit=2511d6b6536f5ccb22916a9ee552ff6ab33b904d
pkgname=python-sipsimple
pkgver=5.3.3.r16.g2511d6b
pkgrel=1
pkgdesc='SIP SIMPLE SDK is a Python library for desktop operating'
license=('GPL-3+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-sipsimple"
makedepends=(
  'cython'
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
  "${pkgname}-${_commit}.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/${_commit}.tar.gz"
  "pjproject-${_pjsipver}.tar.gz::https://github.com/pjsip/pjproject/archive/${_pjsipver}.tar.gz"
  "ZRTPCPP-${_zrtpcppver}.tar.gz::https://github.com/wernerd/ZRTPCPP/archive/${_zrtpcppver}.tar.gz"
# patch to fix cstdint inclusion in ZRTPCPP EmojiBase32.cpp
  "fix_zrtpcpp_cstdint.patch"
  )
sha512sums=(
  '995a8872f1ff8c3f649546fe15a74cf4784d3345c2ac91b2e67c2430d5822549237a18aef0e22bf6eb4468698668facd7f7b91196d9fff2b3cdf83fcdc58f242'
  'a67f083df175b536b4e6a7b7fe39e07d3ee805d6917ec64a50694542a7455c33a100889191044ab3fa679b6656774a6be045621aa53510b5f04cdde9ddd59893'
  '37c3e268ac58a8ba6f2feaf09795d568e51d338b022dca1f65153a419b838e06ca5254788bd4fccd5658d716466d79de455fb2a5ba16be10ff3fc539cf101402'
  '72eea352bd1d32ce18e0a8841796925e9a167133168a926a8138db1e2ff71ab8ea41c793bbb1a870cc84df4385ffc55fb939658006b5d2953283194f4368ce5a'
  )

prepare() {
  cd "${srcdir}"
  cp pjproject-${_pjsipver}.tar.gz ${_pkgname}-${_commit}/deps/${_pjsipver}.tar.gz
  rm -rf ${_pkgname}-${_commit}/deps/ZRTPCPP || true
  cp ZRTPCPP-${_zrtpcppver} ${_pkgname}-${_commit}/deps/ZRTPCPP -R
  cd ${_pkgname}-${_commit}
  chmod +x ./get_dependencies.sh
  ./get_dependencies.sh
  patch -p1 < ../fix_zrtpcpp_cstdint.patch
  # Apply additional ffmpeg fixes for pjsip 2.12 (internal patch 005_fix_ffmpeg.patch handles most ffmpeg compatibility)
  local ffmpeg_file="deps/pjsip/pjmedia/src/pjmedia-codec/ffmpeg_vid_codecs.c"
  # Add compatibility macros after the existing AVCODEC_HAS_DECODE line (around line 938 after internal patches)
  sed -i '/^#define AVCODEC_HAS_DECODE/a\\n/* Frame key detection compatibility */\n#if defined(AV_FRAME_FLAG_KEY)\n#define PJ_FFMPEG_FRAME_IS_KEY(frame_ptr) \\\n    ((frame_ptr) ? (((frame_ptr)->flags \& AV_FRAME_FLAG_KEY) != 0) : PJ_FALSE)\n#else\n#define PJ_FFMPEG_FRAME_IS_KEY(frame_ptr) \\\n    ((frame_ptr) ? ((frame_ptr)->key_frame != 0) : PJ_FALSE)\n#endif\n\n/* avcodec_close compatibility */\n#if LIBAVCODEC_VER_AT_LEAST(58, 10)\n#  define AVCODEC_CLOSE(ctx) avcodec_free_context(\&ctx)\n#else\n#  define AVCODEC_CLOSE(ctx) avcodec_close(ctx)\n#endif' "$ffmpeg_file"
  # Replace avcodec_close calls with AVCODEC_CLOSE macro (these aren't fixed by internal patch)
  sed -i 's/avcodec_close(ff->enc_ctx)/AVCODEC_CLOSE(ff->enc_ctx)/g' "$ffmpeg_file"
  sed -i 's/avcodec_close(ff->dec_ctx)/AVCODEC_CLOSE(ff->dec_ctx)/g' "$ffmpeg_file"
  # Replace avframe.key_frame with PJ_FFMPEG_FRAME_IS_KEY macro (not fixed by internal patch)
  sed -i 's/avframe\.key_frame)/PJ_FFMPEG_FRAME_IS_KEY(\&avframe))/g' "$ffmpeg_file"
}

build() {
  cd "${srcdir}/${_pkgname}-${_commit}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${_commit}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
