# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=streamlink-git
pkgver=6.3.1.r10.g256800be
pkgrel=1
pkgdesc='CLI program that launches streams from various streaming services in a custom video player (livestreamer fork)'
arch=('any')
url='https://streamlink.github.io/'
license=('BSD')
depends=("python-"{certifi,isodate,pycountry,pycryptodome,pysocks,requests,trio,trio-websocket,typing_extensions,websocket-client})
checkdepends=("python-"{freezegun,pytest,pytest-asyncio,pytest-cov,pytest-trio,requests-mock})
makedepends=("python-"{build,installer,myst-parser,setuptools,sphinx,sphinx_design,shtab,versioningit,wheel} 'git')
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
  python -m build --wheel --no-isolation
  PYTHONPATH=$PWD/src/ make -C docs/ man
  PYTHONPATH=$PWD/build/lib/ bash script/build-shell-completions.sh
}

check() {
  cd "${pkgname%-*}"
  python -m installer --destdir="$PWD/tmp" dist/*.whl
  local pyver=$(python -c 'import sys;print(".".join(map(str,sys.version_info[:2])))')
  TZ=UTC PYTHONPATH="$PWD/tmp/usr/lib/python${pyver}/site-packages:$PYTHONPATH" python -m pytest
}

package() {
  cd "${pkgname%-*}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
