# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sander Boom <sanderboom@gmail.com>

_pkgname=ansible-lint
pkgname=ansible-lint-git
pkgver=6.10.2.r4.g2f688cc0
pkgrel=1
pkgdesc="Checks playbooks for practices and behaviour that could potentially be improved."
arch=('any')
url="https://github.com/ansible-community/ansible-lint"
license=('MIT')
depends=(python ansible-core yamllint git
	python-{ansible-compat,black,enrich,filelock,jsonschema,pyaml,packaging,rich,ruamel-yaml,wcmatch})
makedepends=(python-{build,installer,setuptools,wheel,setuptools-scm})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
provides=('ansible-lint')
conflicts=('ansible-lint')
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
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="$pkgdir" ${srcdir}/${_pkgname}/dist/*.whl
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 docs/licenses/LICENSE*.* -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
