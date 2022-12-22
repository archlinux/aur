pkgname=python-freqtrade
_pkgname=${pkgname:7}
pkgver=2022.11
pkgrel=1
pkgdesc="Free, open source crypto trading bot"
url="https://github.com/freqtrade/freqtrade"
arch=('any')
license=('GPL3')
checkdepends=(
  python-pytest-random-order
  python-pytest-cov
  python-pytest-asyncio
  python-pytest-mock
  python-time-machine)
makedepends=(python-build python-installer python-wheel rsync)
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
sha256sums=('c70ab1f8cb07c322fb2329d1c85079a2aeb04fa728b55d8e42562705d0b6e77d'
            '1c9a6d78f55fea855a23b4368d391f27dfb9e7f9f9c1d7413809707b005ed270'
            '4b5501985c8872ec2658d6f7a08009efbbe043c32ea38f2b3722b0bb38c81286')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local frequi_dir="${pkgdir}/${site_packages}/freqtrade/rpc/api_server/ui/installed"

  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rf "${pkgdir}/${site_packages}/tests"
  install -dm755 "${frequi_dir}"

  cd ${srcdir}
  install -Dm644 "freqtrade@.service" "${pkgdir}/usr/lib/systemd/system/freqtrade@.service"
  rsync -r assets "${frequi_dir}"
  install -Dm644 favicon.ico index.html "${frequi_dir}"

  echo 'patch and reinstall your ta-lib/PKGBUILD by adding the prepare() function with

sed -i.bak "s|0.00000001|0.000000000000000001 |g" src/ta_func/ta_utility.h

otherwise some test might fails, see
https://github.com/freqtrade/freqtrade/blob/develop/build_helpers/install_ta-lib.sh'
}

check() {
  cd ${_pkgname}-${pkgver}
  bash tests/pytest.sh
}
