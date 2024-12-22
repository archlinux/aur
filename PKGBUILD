# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname='python-pygreat'
_gitpkgname=libgreat
pkgver=2024.0.3
pkgrel=1
pkgdesc='Host-side drivers for communication with embedded devices'
arch=('any')
url='https://github.com/greatscottgadgets/libgreat'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-libusb1'
  'python-pyusb'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pyproject-patcher'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/greatscottgadgets/libgreat/archive/v${pkgver}.tar.gz"
  'github-pr-47.patch'
)

sha512sums=('94b26328625f9c1172d2aad1320a7ea27f218d5d456bbf09df700c32b7ad191919eb6eed0d074ee5f5a444e0b454c91afc1a86b836541f94a23198aa6709437a'
            '38900d94099ac9f156304de0564471036c03a1b05fa6baa91137ddfe3e84c1c91654b90fe52c5d6a84a37e942cec3c8b8a5b2377c6bcbbfaffdec2d816c01cd1')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  # Remove this patch once the upstream author has merged PR #47 and
  # included it in a stable release.
  # See also: https://github.com/greatscottgadgets/libgreat/pull/47
  echo >&2 "Removing references to obsolete 'python-future' package"
  patch -p1 < ../github-pr-47.patch

  echo >&2 'Pinning version number'
  export pkgver
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('host/pyproject.toml') as toml:
    toml.set_project_version_from_env('pkgver')
    toml.tools.setuptools_git_versioning.remove()
EOF
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation host
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" host/dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
