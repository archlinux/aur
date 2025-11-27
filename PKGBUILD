# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="lxst"
pkgname="python-${_name}"
pkgver=0.4.5
pkgrel=1
pkgdesc="Lightweight Extensible Signal Transport for Reticulum"
arch=(
  'aarch64'
  'x86_64'
)
# url="https://git.unsigned.io/markqvist/${_name}"
url="https://pypi.org/project/${_name}"
license=(
  'CC-BY-NC-ND-4.0'
)
depends=(
  'glibc'
  'i2c-tools'
  'python>=3.13'
  'python-audioop-lts>=0.2.1'
  'python-numpy>=2.3.4'
  'python-pycodec2>=4.1.0'
  'python-rns>=1.0.4'
  'python-soundcard>=0.4.5'
)
makedepends=(
  'python-installer'
)
optdepends=(
  'python-simpleaudio: for playing AudioSegments (first preference)'
  'python-pyaudio: for playing AudioSegments (second preference)'
  'python-ffpyplayer: for playing AudioSegments (third preference)'
  'python-scipy: SciPy versions of high_pass_filter, low_pass_filter, and band_pass_filter'
  'python-cffi: filter acceleration'
)
source=(
  "https://files.pythonhosted.org/packages/py3/${_name::1}/${_name}/${_name//-/_}-${pkgver}-py3-none-any.whl"
)
noextract=(
  "${source[@]##*/}"
)
sha256sums=('24b39ce21db538b168b80567ecc8d7dbf002e5a86c328aa8571304126d57c79a')

package() {
  local python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${_name//-/_}-${pkgver}-py3-none-any.whl"

  cd "${pkgdir}"
  install -vd "usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_name}-${pkgver}.dist-info/licenses/LICENSE" \
    "usr/share/licenses/${pkgname}/LICENSE"

  cd "${site_packages#\/}/LXST"
  find . -maxdepth 1 -type f -name 'filterlib*' -and -not -name "filterlib.cpython-${python_version//.}-${CARCH}-linux-gnu.so" -delete
}
