# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari'
pkgname="${_name}"
pkgver=0.4.14
pkgrel=2
pkgdesc='Multi-dimensional image viewer for Python.'
arch=('any')
url='https://napari.org'
license=('BSD')
makedepends=(
  'python-setuptools-scm'
  'icoutils'
)
depends=(
  'napari-console'
  'napari-npe2'
  'napari-plugin-engine'
  'napari-svg'
  'python'
  'python-importlib-metadata'
  'python-appdirs'
  'python-cachey'
  'python-dask'
  'python-imageio'
  'python-importlib-metadata'
  'python-jsonschema'
  'python-magicgui'
  'python-numpy'
  'python-numpydoc'
  'python-pandas'
  'python-pillow'
  'python-pint'
  'python-psutil'
  'python-pyaml'
  'python-pydantic'
  'python-qtpy'
  'python-scipy'
  'python-superqt'
  'python-tifffile'
  'python-typing_extensions'
  'python-toolz'
  'python-tqdm'
  'python-vispy'
  'python-wrapt'
  'qt5-python-bindings'
)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
  "${_name}.desktop"
)
sha256sums=(
  '277dd9492bbdfa2cf5ae60f503abe07bcab851fe69f42bfcbf8d601965f3a92b'
  '909cfd907ee6d78ad7f80a6d0aaf23b83d246e31f7e2331860072f6bf7e5edd6')
provides=("${_name}")

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  # for now we need this for pep517
  cat > setup.py <<EOF
from setuptools import setup
setup()
EOF
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"
  install -Dm644 ${_name}.desktop "${pkgdir}/usr/share/applications/${_name}.desktop"

  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  # icons
  icotool -x "${_name}/resources/icon.ico"
  for _size in 16 32 48 64 128 256; do
    install -Dm644 icon_*${_size}x${_size}*.png "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_name}.png"
  done
}

# vim:set ts=2 sw=2 et:<Paste>
