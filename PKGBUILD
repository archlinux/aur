# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sherlock Holo <sherlockya@gmail.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: NeoTheFox <soniczerops@gmail.com>

pkgname=python-telegram-bot
pkgver=13.15
pkgrel=1
pkgdesc="A pure Python interface for the Telegram Bot API"
url="https://github.com/${pkgname}/${pkgname}"
license=(GPL3 LGPL)
arch=(any)
depends=(python-apscheduler python-cachetools python-urllib3 python-pytz python-tornado)
makedepends=(python-setuptools)
# checkdepends=(python-beautifulsoup4 python-flaky python-pytest-timeout)
optdepends=('python-cryptography: for support cryptography library'
  'python-httpx: for support SOCKS server')
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz) # {,.asc}
# validpgpkeys=('655BB4F56CDB0E0E4500CF572E9E0E127EF3F283') # Hinrich Mahler <hinrich.mahler@freenet.de>
sha512sums=('15103f7fa9638941a6f18e934a05d553ab1ad7eb43dcb346617f2aba1876410f44e1e0880370aac00167c73841ad72f1bb38d1a90536689eebc1dd5947cae0e5')

prepare() {
  cd ${pkgname}-${pkgver}
  rm -r telegram/vendor

  # Use system cert store
  sed -i '/certifi/d' telegram/__main__.py requirements.txt
  sed -e '/import certifi/d' \
    -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
    -i telegram/utils/request.py # tests/test_official.py

  # Fixes for testing with system urllib3
  # sed -i 's/from telegram.vendor.ptb_urllib3 import urllib3/import urllib3/' tests/test_official.py
  # sed -i 's/from telegram.vendor.ptb_urllib3.urllib3/from urllib3/' tests/test_bot.py
  sed -e '/telegram.utils.deprecate.TelegramDeprecationWarning/i \    ignore:python-telegram-bot is using upstream urllib3. This is allowed but not supported by python-telegram-bot maintainers.:UserWarning' \
    -i setup.cfg
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build --with-upstream-urllib3
}

# check() {
#   cd ${pkgname}-${pkgver}
#   test_run_monthly: fails on upstream ci too
#   test_get_updates_bailout_err: seems to be a test error TODO
#   test_deprecation_warnings_start_webhook: fails due to DeprecationWarning
#   test_clean_deprecation_warning_polling: fails due to DeprecationWarning

#   python -m pytest \
#     --deselect tests/test_jobqueue.py::TestJobQueue::test_run_monthly \
#     --deselect tests/test_updater.py::TestUpdater::test_get_updates_bailout_err \
#     --deselect tests/test_updater.py::TestUpdater::test_deprecation_warnings_start_webhook \
#     --deselect tests/test_updater.py::TestUpdater::test_clean_deprecation_warning_polling
# }

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build --with-upstream-urllib3
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
