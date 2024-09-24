# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sixelcrop"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.1.8.r0.g3fb9c8e
pkgrel=1
pkgdesc="Crop sixel images in sixel-space"
arch=('any')
url="https://github.com/joouha/${_name}"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-hatchling')
depends=('python>=3.7')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgsrc}" clean -dfx
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver%%.r*}.dist-info/licenses/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
