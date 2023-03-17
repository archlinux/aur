# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Mufeed Ali <fushinari@protonmail.com>
# Contributor: lastweakness <lastweakness@tuta.io>

pkgname=python-cloudscraper
_name=${pkgname#python-}
pkgver=1.2.68
pkgrel=1
pkgdesc="Python module to bypass Cloudflare's anti-bot page"
arch=(any)
url="https://github.com/VeNoMouS/cloudscraper"
license=(MIT)
depends=(python-pyparsing python-requests python-requests-toolbelt)
optdepends=('python-js2py: alternative interpreter/solver'
  'nodejs: alternative interpreter/solver')
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-responses python-js2py nodejs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('42fa90127c6348c52a8327728683719966ae69c7b945cb9b485907e89e3b29b8053d31cd9cd4326e71ffd4c33e0fce20dd3d0e046fab62d89110eb4510535ad9')
b2sums=('69e896ad704ce776594fb89714bb75316ebff1b03387cba8575be6d60b496d18556690cfad109c2fa55c72ce3d91dcd21a21467a2d9820c579fea7482b688800')

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
