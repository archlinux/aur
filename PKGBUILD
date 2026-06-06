# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="matlab-proxy"
pkgver=0.33.0
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
#   'python-pytest-asyncio'
# )
makedepends=(
  'npm>=11.6'
  'python-build'
  'python-installer'
  'python-hatchling>=1.27'
)
optdepends=(
  'xorg-server-xvfb: support graphical abilities like plots and figures in the MATLAB desktop'
  'fluxbox: support Simulink Online'
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
)
sha256sums=('6846a7e724595a7dd011554a23779b145d1a1bc6ac007232b3bf227a66feb6dd')

_source() {
  export NPM_CONFIG_CACHE="${srcdir}/.npm"
}

prepare() {
  _source

  cd "${srcdir}/${_pkgsrc}/gui"
  npm install
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   _source

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
