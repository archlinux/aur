# Maintainer: keemcophoff
pkgname=apm-git
pkgver=0.33.0.r0.g18c4c43c9
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
            '694e0c8ee3f19d828d13216af53daf9cdebf4caae589bc1e3684660b521a0923')

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
