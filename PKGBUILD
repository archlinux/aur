# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=streamlink-git
pkgver=4.1.0.r32.g752179a7
pkgrel=1
pkgdesc='CLI program that launches streams from various streaming services in a custom video player (livestreamer fork)'
arch=('any')
url='https://streamlink.github.io/'
license=('BSD')
depends=("python-"{pycryptodome,isodate,pycountry,requests,pysocks,websocket-client})
checkdepends=("python-"{freezegun,pytest,requests-mock})
makedepends=("python-"{myst-parser,setuptools,sphinx,shtab,versioningit} 'git')
optdepends=('ffmpeg: Required to play streams that are made up of separate audio and video streams, eg. YouTube 1080p+')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/streamlink/streamlink.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  python setup.py build
  PYTHONPATH=$PWD/src/ make -C docs/ man
  PYTHONPATH=$PWD/build/lib/ bash script/build-shell-completions.sh
}

check() {
  cd "${pkgname%-*}"
  pyver=$(python -c "import sys; print('{}.{}'.format(*sys.version_info[:2]))")
  python setup.py install --root="$PWD/tmp_install" --skip-build
  TZ=UTC PYTHONPATH="$PWD/tmp_install/usr/lib/python$pyver/site-packages" python -m pytest
}

package() {
  cd "${pkgname%-*}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
