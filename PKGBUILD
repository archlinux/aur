# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Mufeed Ali <fushinari@protonmail.com>
# Contributor: lastweakness <lastweakness@tuta.io>

pkgname=python-cloudscraper
_name=${pkgname#python-}
pkgver=1.2.69
pkgrel=1
pkgdesc="Python module to bypass Cloudflare's anti-bot page"
arch=(any)
url="https://github.com/VeNoMouS/cloudscraper"
license=(MIT)
depends=(
  python-pyparsing
  python-requests
  python-requests-toolbelt
  python-brotli
)
optdepends=(
  'python-js2py: alternative interpreter/solver'
  'nodejs: alternative interpreter/solver'
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-responses
  python-js2py
  nodejs
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('9da8d3d42117768a0a38843448248e3a124c864aaa76d62125d3a1dad8ea4f1921954e6efaa2eb9b40c283d6889c15c0c33378db7008155e46ccb5ae219c11d6')
b2sums=('ea7325353aa9c4bfaca1834a1f9fdb2201cee1946a990d059540500e58322899469a48d847b6d7688b8f671bf4bbe762d1f61ed080587f3a553771ba8e9c2a93')

_archive="${_name}-${pkgver}"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest -k 'not bad_solve_js_challenge1_16_05_202 and not bad_interpreter_js_challenge1_16_05_2020 and not Captcha_challenge_12_12_2019 and not reCaptcha_providers'
}

package() {
  cd "$_archive"

  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
