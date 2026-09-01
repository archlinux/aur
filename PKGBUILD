# Maintainer: zitro <0 at zitro dot id>
# Contributor: envolution
# Contributor: Chris Brendel <cdbrendel@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_origpkgname=confection
_pkgname=python-"${_origpkgname}"
pkgname="${_pkgname}"-git
pkgver=1.3.3.r1.gb3adaf4
pkgrel=1
pkgdesc="The sweetest config system for Python (git version)"
arch=('any')  # Pure Python
url="https://github.com/explosion/confection"
license=('MIT')

# `typing_extensions` is upstream's only runtime requirement and it is
# conditioned on `python_version < "3.11"`, so on a current Arch it is no
# requirement at all. `pydantic` and `srsly` were dependencies of 0.1.5 and are
# not dependencies of this -- listing them would tie a package to two it no
# longer imports.
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')

provides=("${_pkgname}=${pkgver}-${pkgrel}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}";

  git describe --long --tags | sed -re 's/^release-v//g;s/([^-]*-g)/r\1/;s/-/./g';
}

build() {
  cd "${srcdir}/${_pkgname}";

  # `python setup.py install`, which the AUR package ran, was removed from
  # setuptools. Upstream declares a `setuptools.build_meta` backend, so the
  # ordinary PEP 517 path applies.
  #
  # Isolation is off because every build requirement is a system package, and a
  # sandboxed build would fetch them from PyPI instead.
  python -m build --wheel --no-isolation;
}

check() {
  cd "${srcdir}/${_pkgname}";

  local -- staged;
  staged="$(mktemp -d)";
  trap 'rm -rf "${staged}"' RETURN;

  python -m installer --destdir="${staged}" dist/*.whl;

  local -- sitedir;
  sitedir="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')";

  PYTHONPATH="${staged}${sitedir}" python -c 'import confection;';
}

package() {
  cd "${srcdir}/${_pkgname}";

  python -m installer --destdir="${pkgdir}" dist/*.whl;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";
}
# vim:set ts=2 sw=2 et:
