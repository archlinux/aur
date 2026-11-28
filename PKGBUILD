# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=evofuzz-git
pkgver=0.2.0.r9.g0e4b8f5
pkgrel=1
pkgdesc="LLM-steerable evolutionary fuzzing with reproducible counterexamples"
arch=('any')
url="https://github.com/TheDarkLightX/EvoFuzz"
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd EvoFuzz
  # Upstream publishes no tags or releases, so the version combines the declared
  # release number with the commit position and hash.
  local _upstream_version
  _upstream_version=$(sed -n 's/^version = "\(.*\)"$/\1/p' pyproject.toml | head -1)
  printf '%s.r%s.g%s' "$_upstream_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd EvoFuzz
  rm -rf build dist ./*.egg-info
}

build() {
  cd EvoFuzz
  python -m build --wheel --no-isolation
}

check() {
  cd EvoFuzz
  python -m unittest discover -v
}

package() {
  cd EvoFuzz
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
