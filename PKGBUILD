# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-pyhanko-certvalidator
_name=certvalidator
pkgver=0.26.1
pkgrel=1
pkgdesc="Validates X.509 certificates and paths"
url="https://github.com/MatthiasValvekens/certvalidator"
license=(MIT)
arch=(any)
depends=(
  python
  python-aiohttp
  python-asn1crypto
  python-cryptography
  python-oscrypto
  python-requests
  python-uritools
)
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d281588d3ac36672b02b84bc5061e4679197ca682562358b144f595e8e238c6a')

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
      and not test_basic_certificate_validator_tls_aia[icpedu.rnp.br] \
    "
}

package() {
  cd "$_archive"

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
