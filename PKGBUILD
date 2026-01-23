# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Sideband"
pkgname="${_Name,,}"
pkgver=1.8.2
pkgrel=1
pkgdesc="Communicate with people or LXMF-compatible systems over Reticulum networks"
arch=(
  'any'
)
url="https://unsigned.io/software/Sideband.html"
_url="https://github.com/markqvist/${_Name}"
license=(
  'CC-BY-NC-SA-4.0'
)
depends=(
  'hicolor-icon-theme'
  'python>=3.13'
  'python-audioop-lts>=0.2.1'
  # 'python-beautifulsoup4'
  'python-cryptography'
  'python-dbus'
  'python-dnspython'
  'python-kivy>=2.3.0'
  'python-lxmf>=0.9.3'
  'python-lxst>=0.4.5'
  # 'python-materialyoucolor>=2.0.7'
  'python-mistune>=3.0.2'
  'python-numpy>=2.0.0'
  'python-pillow>=10.2.0'
  'python-prompt_toolkit'
  # 'python-pyaudio'
  'python-pycodec2>=4.1.0'
  'python-qrcode'
  'python-requests'
  'python-rns>=1.0.4'
  'python-sh'
  'python-typing_extensions'
  'xclip'
  'xorg-xrandr'
  'xsel'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
optdepends=(
  'python-watchdog: auto reload kv or py'
  'python-pysocks: proxying of MQTT connection'
  'python-firebase: FireBase data collection'
)
provides=(
  "python-sbapp=${pkgver}"
)
conflicts=(
  'python-sbapp'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('c6ef0adeb15794b7219cb8f9f915b7d34bed1421e86f3bf6538f12a34e97fdb7')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  find "sbapp" -type f -name '*.kv' -exec \
    cp -v "{}" "${pkgdir}/${site_packages}/{}" \;

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/sbapp-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
