# Maintainer: Marin M <https://github.com/marin-m>

pkgname=pbtk-git
_pkgname=pbtk
pkgver=r150.ebcb2c4
pkgrel=1
pkgdesc='A toolset for reverse engineering and fuzzing Protobuf-based apps'
url='https://github.com/marin-m/pbtk'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pyside6' 'python-protobuf' 'python-requests' 'python-websocket-client' 'qt6-webengine' 'chromium' 'jre8-openjdk')
makedepends=(
  'git'
  'findutils'
  'python-build'
  'python-installer'
  'python-setuptools>=69'
  'python-setuptools-scm>=8'
)
provides=(
  "python-${_pkgname}=${pkgver}"
)
conflicts=(
  "python-${_pkgname}"
)
options=(
  '!strip'
)
source=("${_pkgname}::git+https://github.com/marin-m/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}" || exit 1

  find . -regex '.*\(\.bat\|\.exe\|_osx\)' -type f -delete
  chmod -R 755 src/pbtk/extractors src/pbtk/utils/external
}

build() {
  cd "${_pkgname}" || exit 1

  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${_pkgname}" || exit 1
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "packaging/assets"
  install -vDm644 "re.fossplant.pbtk.desktop" \
    "${pkgdir}/usr/share/applications/re.fossplant.pbtk.desktop"
  install -vDm644 "re.fossplant.pbtk.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/re.fossplant.pbtk.metainfo.xml"
  install -vDm644 "re.fossplant.pbtk.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/re.fossplant.pbtk.svg"

  install -vd "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -vsf "${site_packages}/${_pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
