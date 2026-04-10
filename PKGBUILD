# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="rayforge"
pkgver=1.5.1
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
  'python>=3.10'
  'python-aiohttp>=3.13.5'
  'python-asyncudp>=0.11.0'
  'python-blinker>=1.9.0'
  'python-ezdxf>=1.4.2'
  'python-gitpython>=3.1.44'
  'python-numpy>=2.3.4'
  'python-opencv'
  'python-platformdirs>=4.3.6'
  'python-pluggy>=1.6.0'
  'python-cairo>=1.28.0'
  'python-pyclipper>=1.3.0.post6'
  'python-gobject>=3.50.0'
  'python-pymupdf>=1.27.2.2'
  'python-opengl>=3.1.10'
  # 'python-opengl-accelerate>=3.1.10' ???
  'python-pypdf>=6.9.2'
  'python-pyserial-asyncio>=0.6'
  'python-pyvips>=3.0.0'
  'python-yaml>=6.0.2'
  'python-scipy>=1.16.3'
  'python-semver>=3.0.2'
  'python-svgelements>=1.9.6'
  'python-trimesh>=4.6.8'
  'python-vtracer>=0.6.11'
  'python-websockets>=14.2'

  'gdk-pixbuf2'
  'glib2'
  'graphene'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'librsvg'
  'pango'
  'python-pyserial'
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
sha256sums=('528687bde40390278416b2d612e54b58b85427c66e2cb2f527ed26489f3ba025')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest
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
