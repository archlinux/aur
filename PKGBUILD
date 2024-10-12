# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=ansible-creator
pkgname=ansible-creator-git
pkgver=24.10.0.r0.g71782dc
pkgrel=1
pkgdesc="A CLI tool for scaffolding all your Ansible Content."
arch=('any')
url="https://github.com/ansible/ansible-creator"
license=('MIT')
depends=(python python-{jsonschema,onigurumacffi} ansible-{core,runner} git)
makedepends=(python-{build,installer,pip,setuptools,setuptools-scm,wheel})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
provides=('ansible-creator')
conflicts=('ansible-creator')
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

