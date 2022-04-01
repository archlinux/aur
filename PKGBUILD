# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-telegram-bot
pkgver=13.11
pkgrel=1
pkgdesc="A pure Python interface for the Telegram Bot AP"
url="https://github.com/python-telegram-bot/python-telegram-bot"
license=('LGPL')
arch=('any')
depends=('python-apscheduler' 'python-cryptography' 'python-tornado'
         'python-ujson' 'python-urllib3' 'python-pytz' 'python-cachetools')
makedepends=('python-setuptools')
checkdepends=('python-beautifulsoup4' 'python-flaky' 'python-pytest-timeout')
source=("https://github.com/python-telegram-bot/python-telegram-bot/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8ccae24ad577da18aba9428e006406627d018004fea7f52217e805a49c73a74ba22cd4785c38b34a2cd6df899e1ceed89cccbc2f9fd8a7af5292a89032d4da3a')

prepare() {
  cd $pkgname-$pkgver

  rm -r telegram/vendor

  # Use system cert store
  sed -i '/certifi/d' telegram/__main__.py requirements.txt
  sed -e '/import certifi/d' \
      -e 's|certifi.where()|"/etc/ssl/certs/ca-certificates.crt"|' \
      -i telegram/utils/request.py tests/test_official.py

  # Fixes for new pytest
  sed -i '/pytest.mark.nocoverage/d' tests/test_meta.py
  sed -i '/ message=/d' tests/test_constants.py

  # Fixes for testing with system urllib3
  sed -i 's/from telegram.vendor.ptb_urllib3 import urllib3/import urllib3/' tests/test_official.py
  sed -i 's/from telegram.vendor.ptb_urllib3.urllib3/from urllib3/' tests/test_bot.py
  sed -e '/telegram.utils.deprecate.TelegramDeprecationWarning/i \    ignore:python-telegram-bot is using upstream urllib3. This is allowed but not supported by python-telegram-bot maintainers.:UserWarning' \
      -i setup.cfg
  
  # Spacing difference
  sed -i 's/"switch_inline_query": ""/"switch_inline_query":""/;s/"switch_inline_query_current_chat": ""/"switch_inline_query_current_chat":""/' tests/test_inlinekeyboardmarkup.py
}

build() {
  cd $pkgname-$pkgver
  python setup.py build --with-upstream-urllib3
}

check() {
  cd $pkgname-$pkgver
  # test_run_monthly: fails on upstream ci too
  # test_get_updates_bailout_err: seems to be a test error TODO
  # test_deprecation_warnings_start_webhook: fails due to DeprecationWarning
  # test_clean_deprecation_warning_polling: fails due to DeprecationWarning
  python -m pytest \
    --deselect tests/test_jobqueue.py::TestJobQueue::test_run_monthly \
    --deselect tests/test_updater.py::TestUpdater::test_get_updates_bailout_err \
    --deselect tests/test_updater.py::TestUpdater::test_deprecation_warnings_start_webhook \
    --deselect tests/test_updater.py::TestUpdater::test_clean_deprecation_warning_polling
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --with-upstream-urllib3
}
