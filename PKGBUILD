_pkgname="DiagNG"
pkgname="diagng"
pkgver=0.1.1
pkgrel=1
pkgdesc="Client for mobile baseband Diag interfaces"
arch=(
  'any'
)
url="https://github.com/P1sec/${_pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'python>=3.10'
  'python-gobject>=3.56.2'
  'python-kaitaistruct>=0.11'
  'python-crcmod>=1.7'
  'python-pyudev>=0.24.4'
  'libmm-glib'
  'libadwaita>=1.8'
  'gtksourceview5'
  'polkit'
  'diagmond'
  'wireshark-qt'
  'android-tools'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>=69'
  'python-setuptools-scm>=8'
  'python-pytest'
  'python-kaitaistruct>=0.11'
  'python-crcmod>=1.7'
  'blueprint-compiler'
)
provides=(
  "python-${pkgname}=${pkgver}"
)
conflicts=(
  "python-${pkgname}"
)
options=(
  '!strip'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('ee2a549875d634c65aa7f8b721011ee5a58ec4041bae79ffe2ca8476535537a7')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "src/diagng/ui/assets"
  install -vDm644 "share/dbus-1/interfaces/com.p1security.diagmetad.xml" \
    "${pkgdir}/usr/share/share/dbus-1/interfaces/com.p1security.diagmetad.xml"

  cp -ra share/icons "${pkgdir}/usr/share/"
  cp -ra share/metainfo "${pkgdir}/usr/share/"
  cp -ra share/applications "${pkgdir}/usr/share/"
  cp -ra share/dbus-1/services "${pkgdir}/usr/share/dbus-1/"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
