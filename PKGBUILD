# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="lxst"
pkgname="python-${_pypiname}"
pkgver=0.4.7
pkgrel=1
pkgdesc="Lightweight Extensible Signal Transport for Reticulum"
arch=(
  'aarch64'
  'x86_64'
)
# url="https://git.unsigned.io/markqvist/${_pypiname}"
url="https://pypi.org/project/${_pypiname}"
license=(
  'CC-BY-NC-ND-4.0'
)
depends=(
  'python>=3.13'
  'python-rns>=1.2.0'
  # 'python-lxmf>=0.9.6'
  'python-numpy>=2.3.4'
  'python-pycodec2>=4.1.0'
  'python-audioop-lts>=0.2.1'
  # 'python-cffi>=2.0.0'

  'glibc'
  'i2c-tools'
)
makedepends=(
  'python-installer'
)
optdepends=(
  'python-simpleaudio: for playing AudioSegments (first preference)'
  'python-pyaudio: for playing AudioSegments (second preference)'
  'python-ffpyplayer: for playing AudioSegments (third preference)'
  'python-scipy: SciPy versions of high_pass_filter, low_pass_filter, and band_pass_filter'
  'python-cffi>=2.0.0: filter acceleration'
)
source=(
  "https://files.pythonhosted.org/packages/py3/${_pypiname::1}/${_pypiname}/${_pypiname//-/_}-${pkgver}-py3-none-any.whl"
)
noextract=(
  "${source[@]##*/}"
)
sha256sums=('a582378b56a2762f530eb28308523cfa5d6b6b83227b03d3c0f8c4f9ba084ea6')

package() {
  local python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${_pypiname//-/_}-${pkgver}-py3-none-any.whl"

  cd "${pkgdir}"
  install -vd "usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses/LICENSE" \
    "usr/share/licenses/${pkgname}/LICENSE"

  cd "${site_packages#\/}/LXST"
  find . -maxdepth 1 -type f -name 'filterlib*' -and -not -name "filterlib.cpython-${python_version//.}-${CARCH}-linux-gnu.so" -delete
}
