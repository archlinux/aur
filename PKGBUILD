# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=PyFxA
pkgname=python-fxa
pkgver=0.7.8
pkgrel=1
pkgdesc='Python library for interacting with the Firefox Accounts ecosystem'
arch=('any')
url='https://github.com/mozilla/PyFxA'
license=('MPL-2.0')
depends=('python-browserid' 'python-cryptography' 'python-hawkauthlib' 'python-pyjwt' 'python-requests' 'python-six')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-grequests' 'python-pyotp' 'python-pytest' 'python-responses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mozilla/$_pkgname/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('458d46274c0c7992472a4309f186a28ad970c6240f2caf6a31d7c3655ff5d62e')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  # https://github.com/mozilla/PyFxA/issues/102
  local pytest_skip=(
    --deselect fxa/tests/test_core.py::TestCoreClient::test_account_creation
    --deselect fxa/tests/test_core.py::TestCoreClient::test_account_creation_with_key_fetch
    --deselect fxa/tests/test_core.py::TestCoreClient::test_account_login
    --deselect fxa/tests/test_core.py::TestCoreClient::test_email_code_verification
    --deselect fxa/tests/test_core.py::TestCoreClient::test_forgot_password_flow
    --deselect fxa/tests/test_core.py::TestCoreClient::test_get_random_bytes
    --deselect fxa/tests/test_core.py::TestCoreClient::test_resend_verify_code
    --deselect fxa/tests/test_core.py::TestCoreClient::test_send_unblock_code
    --deselect fxa/tests/test_core.py::TestCoreClientSession::test_change_password
    --deselect fxa/tests/test_core.py::TestCoreClientSession::test_email_status
    --deselect fxa/tests/test_core.py::TestCoreClientSession::test_get_identity_assertion
    --deselect fxa/tests/test_core.py::TestCoreClientSession::test_get_identity_assertion_accepts_service
    --deselect fxa/tests/test_core.py::TestCoreClientSession::test_get_identity_assertion_handles_duration
    --deselect fxa/tests/test_core.py::TestCoreClientSession::test_get_random_bytes
    --deselect fxa/tests/test_core.py::TestCoreClientSession::test_session_status
    --deselect fxa/tests/test_core.py::TestCoreClientSession::test_sign_certificate
    --deselect fxa/tests/test_core.py::TestCoreClientSession::test_sign_certificate_handles_duration
    --deselect fxa/tests/test_core.py::TestCoreClientSession::test_totp
  )

  # override pytest options to skip pytest-cov/pytest-flake8 requirements
  pytest -o addopts='' "${pytest_skip[@]}"
}

package() {
  cd $_pkgname-$pkgver 
  python -m installer --destdir="$pkgdir" dist/*.whl
}
