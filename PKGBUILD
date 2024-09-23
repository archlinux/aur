# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=ansible-dev-environment
pkgname=ansible-dev-environment-git
pkgver=24.9.0.r1.g4638116
pkgrel=1
pkgdesc="A pip-like install for ansible collections."
arch=('any')
url="https://github.com/ansible/ansible-dev-environment"
license=('GPLv3')
depends=(python python-{jsonschema,onigurumacffi} ansible-{core,runner} git)
makedepends=(python-{build,installer,setuptools,wheel,setuptools-scm})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
provides=('ansible-dev-environment')
conflicts=('ansible-dev-environment')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -eq 0 ] || \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="$pkgdir" ${srcdir}/${_pkgname}/dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

