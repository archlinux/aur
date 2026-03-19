# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="rayforge"
pkgver=1.2.1
pkgrel=1
pkgdesc="A software for laser cutters and engravers"
arch=(
  'any'
)
url="https://rayforge.org"
_url="https://github.com/barebaric/${pkgname}"
license=(
  'MIT'
)
depends=(
  'gdk-pixbuf2'
  'glib2'
  'graphene'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'pango'
  'python>=3.10'
  'python-aiohttp>=3.13.3'
  'python-asyncudp>=0.11.0'
  'python-blinker>=1.9.0'
  'python-cairo>=1.28.0'
  'python-ezdxf>=1.3.5'
  'python-gitpython>=3.1.44'
  'python-gobject>=3.50.0'
  'python-numpy>=2.3.4'
  'python-opencv'
  'python-opengl>=3.1.10'
  # 'python-opengl-accelerate>=3.1.10' ???
  'python-platformdirs>=4.3.6'
  'python-pluggy>=1.6.0'
  'python-pyclipper>=1.3.0.post6'
  'python-pypdf>=6.7.0'
  'python-pyserial'
  'python-pyserial-asyncio>=0.6'
  'python-pyvips>=3.0.0'
  'python-scipy>=1.16.3'
  'python-semver>=3.0.2'
  'python-svgelements>=1.9.6'
  'python-vtracer>=0.6.11'
  'python-websockets>=14.2'
  'python-yaml>=6.0.2'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=40.9.0'
  'python-setuptools-git-versioning'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-mock'
)
provides=(
  "python-${pkgname}=${pkgver}"
)
conflicts=(
  "python-${pkgname}"
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=${pkgver}"
)
sha256sums=('c01ee752fe7470a274d68625c07025ac053ba00ef3d241e8a104b25b3d11faa6')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest -k "not test_font_config and not test_pdf"
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/"${pkgname}-${pkgver}"*.whl

  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${pkgname}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
