# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sander Boom <sanderboom@gmail.com>

_pkgname=ansible-lint
pkgname=ansible-lint-git
pkgver=6.1.0.r1.g53e398a5
pkgrel=1
pkgdesc="Checks playbooks for practices and behaviour that could potentially be improved."
arch=('any')
url="https://github.com/ansible-community/ansible-lint"
license=('MIT')
depends=('python' 'python-ruamel-yaml' 'python-pyaml' 'python-rich' 'python-packaging' 'python-jsonschema'
          'python-wcmatch' 'python-enrich' 'ansible-core' 'yamllint' 'python-ansible-compat' 'python-filelock')
makedepends=('git' 'python-pip' 'python-setuptools' 'python-setuptools-scm' 'python-toml')
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
  python -c "from setuptools import setup; setup();" build
}

package() {
  cd "${srcdir}/${_pkgname}"
  PYTHONHASHSEED=0 python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 docs/licenses/LICENSE*.* -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
