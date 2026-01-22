# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=python-curl-cffi
pkgver=0.14.0
_curl_version=curl-8_15_0
_curl_impersonate_version=1.2.5
pkgrel=2
pkgdesc="Python FFI binding for curl-impersonate"
arch=(x86_64)
url="https://github.com/lexiforest/curl_cffi"
license=(MIT)
depends=(
  glibc
  gcc-libs
  "curl-impersonate=${_curl_impersonate_version}"
  python
  python-certifi
  python-cffi
  python-eventlet
  python-gevent
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-python-multipart
  unzip
)
optdepends=(
  'python-orjson: speed and memory optimized JSON parsing'
  'python-markdownify'
  'python-lxml-html-clean'
  'python-readability-lxml'
)
provides=(python-curl_cffi)
conflicts=(python-curl_cffi)
options=(!debug)
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  "${_curl_version}.tar.gz::https://github.com/curl/curl/archive/${_curl_version}.tar.gz"
  "curl-impersonate::git+https://github.com/lexiforest/curl-impersonate#tag=v${_curl_impersonate_version}"
  use-system-curl-impersonate.patch
  no-download.patch
)
sha512sums=('0cc2e0917973bddf24c72db5c9775fe4433601257f4ff333ccc3cec625fc043e713118cd52d9ed550285adce4dd263c64f6eccf113f01bd99e7a8f88421b2183'
            'd4a560e225d0110133f44ed57cf5394c1710530c5fec395d02baafaac9ea2186dd543047ae27fd7542894b8744070760516ae611602105b1b40605abbf84e684'
            '73e7eb60ec24e813f11812a25c8b216f1748b32e8f49272744803b8f3b91ae5f6b707058c2721b730b22b7939853186b79adbbb15fc7b606d2b275908742ca6f'
            'eba414bc7fa9428e4ec99623bc181e172611b5cd8acbf4f4ea9dce895c77bf24d00f54672a034c25db1bb2340a705cc3e3e1021c12a4ce66b55564e26447921e'
            'bec73973ec2aff8605a56a6d7761a0f4232a7c94f46c7a1dfe33c8007352cf956958f25469260aac2e9bd4c468de406c3350117c35916687bf0b239e5a261533')
b2sums=('a190f12d669557b304a6c8c4b38da392f803aa7c821fef6a4522c7551e697db07db9153ef762327205dd8abf5d1e3fec21e8eb08bcd4551c88fb67ed163c8b6a'
        '5f2d2e5f498495744e3b28ea375596f3e4213f32b5eb45ea9942c0339ad1541d0d98b1d4a774bfa4ce431fe23d81f860f4c150f325610d61286f2aea0a93f770'
        '9e94a73dce0113caa6b5eaa1a4664563032b6499b2fbc2048e6a636a4ad1551f1e97e3a7d09d97d590083d86219c1b1691734cf6925901673fabfab1ce6ef832'
        'bd30143ea34bfac9a20c66726b0f27ff8191933ef59c7b038ce2c78f8f2dd37e60febb9f53ea2c03fa5208b411318dcd5a4c290dace3608e1888465936a0444a'
        'b99ecb48a74c9b1da2815ebb437e2b50d20a12da6c92398fa8165a453aaa212a215bc54877fb185bb765d9cafd90471db441a9ead4a68b28587ab4e9921c259a')

prepare() {
  cd "$pkgname"
  # use system curl-impersonate
  patch -p1 -i "$srcdir/use-system-curl-impersonate.patch"

  # shuffle around dependencies to match folder structure expected in Makefile
  mv "$srcdir/curl-${_curl_version}" "${_curl_version}"
  mv "$srcdir/curl-impersonate" "curl-impersonate-${_curl_impersonate_version}"

  # patch Makefile for file verification
  patch -p1 -i "$srcdir/no-download.patch"
  sed \
    -e "s/@CURL_IMPERSONATE_VERSION@/${_curl_impersonate_version}/" \
    -e "s/@CURL_VERSION@/${_curl_version}/" \
    -i Makefile

  make preprocess
}

build() {
  cd "$pkgname"
  
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

}
