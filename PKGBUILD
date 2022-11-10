# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Mufeed Ali <fushinari@protonmail.com>
# Contributor: lastweakness <lastweakness@tuta.io>
_base=cloudscraper
pkgname=python-cloudscraper
pkgver=1.2.65
pkgrel=1
pkgdesc="Python module to bypass Cloudflare's anti-bot page"
arch=(any)
url="https://github.com/VeNoMouS/${_base}"
license=(MIT)
depends=(python-pyparsing python-requests python-requests-toolbelt)
optdepends=('python-js2py: alternative interpreter/solver'
  'nodejs: alternative interpreter/solver')
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-responses python-js2py nodejs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('e885e7e0b7e91318da4b6d65165961fbae27951be9b4f05af96e7eeaf1e28e1146af52c10bf0b769f07fc04016998eed9146ec92504a591d81434a101c6d6850')
b2sums=('7b53819ceb3349c9e8bc24cfd3138119b46bd88daa639d1c29b7e7477f0fc2cb323b3e485832236eadf48be76d16a2dde93cadffe594fc7b7d43b24651de45eb')

build() {
  cd ${_base}-${pkgver}

  python -m build --wheel --no-isolation
}

check() {
  cd ${_base}-${pkgver}

  python -m pytest -k 'not bad_solve_js_challenge1_16_05_202 and not bad_interpreter_js_challenge1_16_05_2020 and not Captcha_challenge_12_12_2019 and not reCaptcha_providers'
}

package() {
  cd ${_base}-${pkgver}

  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
