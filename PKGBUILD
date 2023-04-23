# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-pyhanko-certvalidator
_name=certvalidator
pkgver=0.21.2
pkgrel=1
pkgdesc="Validates X.509 certificates and paths"
url="https://github.com/MatthiasValvekens/certvalidator"
license=(MIT)
arch=(any)
makedepends=(
  python-build
  python-installer
  python-pytest-runner
  python-wheel
)
checkdepends=(
  python-freezegun
  python-pytest
  python-pytest-asyncio
)
depends=(
  python-aiohttp
  python-asn1crypto
  python-cryptography
  python-oscrypto
  python-requests
  python-uritools
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ea3fc94b1b1598f0b35cb0348b8dd4f7eec21b84df2ff48cce89d6a8133235eb')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest \
    -k "\
      not test_revocation_mode_soft \
      and not test_revocation_mode_hard \
      and not test_revocation_mode_hard_async \
      and not test_revocation_mode_hard_aiohttp_autofetch \
      and not test_revocation_mode_hard_requests_autofetch \
    "
}

package() {
  cd "$_archive"

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
