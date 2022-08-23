pkgname=python-freqtrade
_pkgname=${pkgname:7}
pkgver=2022.7
pkgrel=3
pkgdesc="Free, open source crypto trading bot"
url="https://github.com/freqtrade/freqtrade"
arch=('any')
license=('GPL3')
testdepends=(
  python-pytest-random-order 
  python-pytest-cov 
  python-pytest-asyncio 
  python-pytest-mock
  python-time-machine)
makedepends=(python-build python-installer python-wheel ${testdepends[@]})
depends=(
  python
  python-numpy
  python-pandas
  python-pandas-ta
  python-ccxt
  python-cryptography
  python-aiohttp
  python-sqlalchemy
  python-telegram-bot
  python-arrow
  python-cachetools
  python-requests
  python-urllib3
  python-jsonschema
  python-ta-lib
  python-technical
  python-tabulate
  python-pycoingecko
  python-jinja
  python-tables
  python-blosc
  python-py-find-1st
  python-rapidjson
  python-sdnotify
  python-fastapi
  uvicorn
  python-pyjwt
  python-aiofiles
  python-psutil
  python-colorama
  python-questionary
  python-prompt_toolkit
  python-dateutil
  python-orjson
  python-schedule

  #hyperopt
  python-scipy 
  python-scikit-learn 
  python-scikit-optimize 
  python-filelock 
  python-joblib 
  python-progressbar 

  #freqai
  python-catboost 
  python-lightgbm

  #plot
  python-plotly
)

source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
  "https://github.com/freqtrade/frequi/releases/download/0.4.4/freqUI.zip"
  "freqtrade@.service")
sha256sums=('19684c3da6b4edba2e8517d961da1ad551ca6ec37e285d475c4b3c03fed3941d'
  '1c9a6d78f55fea855a23b4368d391f27dfb9e7f9f9c1d7413809707b005ed270'
  '4b5501985c8872ec2658d6f7a08009efbbe043c32ea38f2b3722b0bb38c81286')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests 
  install -dm755 "${pkgdir}/usr/lib/python3.10/site-packages/freqtrade/rpc/api_server/ui/installed"

  cd ${srcdir}
  install -Dm644 "freqtrade@.service" "${pkgdir}/usr/lib/systemd/system/freqtrade@.service"
  rsync -r assets "${pkgdir}/usr/lib/python3.10/site-packages/freqtrade/rpc/api_server/ui/installed/"
  install -Dm644 index.html "${pkgdir}/usr/lib/python3.10/site-packages/freqtrade/rpc/api_server/ui/installed/"
  install -Dm644 favicon.ico "${pkgdir}/usr/lib/python3.10/site-packages/freqtrade/rpc/api_server/ui/installed/"
}

check() {
  cd ${_pkgname}-${pkgver}
  bash tests/pytest.sh "/usr/bin"
}
