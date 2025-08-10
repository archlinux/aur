# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Sideband"
pkgname="${_Name,,}"
pkgver=1.7.0
pkgrel=2
pkgdesc="Communicate with people or LXMF-compatible systems over Reticulum networks"
arch=('any')
url="https://unsigned.io/software/Sideband.html"
_url="https://github.com/markqvist/${_Name}"
license=('CC-BY-NC-SA-4.0')
depends=(
  'hicolor-icon-theme'
  'python>=3.13'
  'python-audioop-lts>=0.2.1'
  'python-beautifulsoup4'
  'python-cryptography'
  'python-dbus'
  'python-dnspython'
  'python-ffpyplayer'
  'python-kivy>=2.3.0'
  'python-lxmf>=0.8.0'
  'python-lxst>=0.3.0'
  'python-materialyoucolor>=2.0.7'
  'python-mistune>=3.0.2'
  'python-numpy' # <=1.26.4
  'python-pillow>=10.2.0'
  'python-prompt_toolkit'
  'python-pyaudio'
  'python-pycodec2'
  'python-qrcode'
  'python-requests'
  'python-rns>=1.0.0'
  'python-sh'
  'python-typing_extensions'
  'xclip'
  'xsel'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
optdepends=(
  'python-watchdog: auto reload kv or py'
  'python-scipy: SciPy versions of high_pass_filter, low_pass_filter, and band_pass_filter'
  'python-pysocks: proxying of MQTT connection'
  'python-firebase: FireBase data collection'
)
provides=('python-sbapp')
conflicts=('python-sbapp')
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0374f957b3276f1b3dc97ba33706490c4e158968f47f61c8949abb2281abaa30')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  find . -type f -name '*.kv' -exec \
    cp -v "{}" "${pkgdir}/${site_packages}/{}" \;

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/sbapp-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
