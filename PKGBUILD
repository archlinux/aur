# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="matlab-proxy"
pkgver=0.31.0
pkgrel=1
pkgdesc="Open a MATLAB® desktop in a web browser tab"
arch=(
  'any'
)
url="https://github.com/mathworks/${pkgname}"
license=(
  'custom:MATHWORKS CLOUD REFERENCE ARCHITECTURE LICENSE'
)
depends=(
  'matlab-release>=R2020b'

  'python>=3.10'
  'python-aiohttp-session'
  'python-aiohttp>=3.7.4'
  'python-psutil'
  'python-requests'
  'python-rich'
  'python-watchdog'

  'python-cryptography'
  'python-urllib3' # listed in test depends
)
# checkdepends=(
#   'python-pytest'
#   # 'python-pytest-env'
#   # 'python-pytest-cov'
#   # 'python-pytest-timeout'
#   'python-pytest-mock'
#   # 'python-pytest-aiohttp'
#   # 'python-pytest-playwright'
#   # 'python-pytest-asyncio'
# )
makedepends=(
  'npm>=11.6'
  'python-build'
  'python-installer'
  'python-hatchling>=1.27'
)
optdepends=(
  'xorg-server-xvfb'
  'fluxbox'
)
provides=(
  "python-${pkgname}=${pkgver}"
)
conflicts=(
  "python-${pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "${pkgname}_python3.14_event_loop.patch::${url}/pull/83.patch?full_index=1"
)
sha256sums=('ff4b98b637dff0a8d69344c3cc574b58512a8fae2325f3dc94d5bb24397f570e'
            '2aa24bda0a46e4b14d5f39fa1b8fa6abbb41d6871b786a358d707f25386054b4')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_python3.14_event_loop.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest
# }

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
