# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

_use_pycrypto="no"
_use_pycountry="no"  

pkgname=streamlink-git
pkgver=1.3.0.r0.g9253fc51
pkgrel=1
pkgdesc='CLI program that launches streams from various streaming services in a custom video player (livestreamer fork)'
arch=('any')
url='https://streamlink.github.io/'
license=('BSD')

if [ "$_use_pycrypto" = "yes" ]; then
  depends+=('python-crypto')
  conflicts+=('python-pycryptodome')
else
  depends+=('python-pycryptodome')
fi

if [ "$_use_pycountry" = "yes" ]; then
  depends+=('python-pycountry')
else
  depends+=('python-iso3166' 'python-iso639')
fi

depends+=("python-"{isodate,pysocks,requests,websocket-client} 'rtmpdump')
checkdepends=("python-"{freezegun,mock,pytest,requests-mock})
makedepends=('git' 'python-recommonmark')
optdepends=('ffmpeg: Required to play streams that are made up of separate audio and video streams, eg. YouTube 1080p+')
provides=("${pkgname%-*}")
conflicts+=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/streamlink/streamlink.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  if [ "$_use_pycrypto" = "yes" ]; then
    msg "Using pycrypto..."
    export STREAMLINK_USE_PYCRYPTO="true"
  fi
  if [ "$_use_pycountry" = "yes" ]; then
    msg "Using pycountry..."
    export STREAMLINK_USE_PYCOUNTRY="true"
  fi
  python setup.py build
  python setup.py build_sphinx -b man
}

check() {
  cd "${pkgname%-*}"
  python setup.py test
}

package() {
  cd "${pkgname%-*}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 build/sphinx/man/streamlink.1 \
    "$pkgdir/usr/share/man/man1/streamlink.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
