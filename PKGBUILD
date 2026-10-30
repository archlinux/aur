# Maintainer: keemcophoff
pkgname=apm-git
pkgver=0.35.0.r1.g292004325
pkgrel=1
pkgdesc='Agent Package Manager (microsoft/apm) built from git with a placement perf patch'
arch=('any')
url='https://github.com/microsoft/apm'
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-colorama'
  'python-yaml'
  'python-requests'
  'python-urllib3'
  'python-certifi'
  'python-truststore'
  'python-frontmatter'
  'python-tomli'
  'python-toml'
  'python-tomlkit'
  'python-rich'
  'python-rich-click'
  'python-watchdog'
  'python-gitpython'
  'python-ruamel-yaml'
  'python-filelock'
  'python-websockets'
  'git'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('apm')
conflicts=('apm')
source=("$pkgname::git+$url.git"
        '0001-perf-compile-placement.patch')
sha256sums=('SKIP'
            '1ed40cd75fc05f8256bfc2adf8b73d04fbd96099e579e9bee002f2bf1417b00d')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --match 'v*' | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$pkgname"
  git checkout -- .
  patch -Np1 -i "$srcdir/0001-perf-compile-placement.patch"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
