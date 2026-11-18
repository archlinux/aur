# Maintainer: Petr Mrázek <peterix@gmail.com>
pkgname=seendiff-git
_pkgname=seendiff
pkgver=0.1.0.r39.g20b4dc0
pkgrel=1
pkgdesc="Local code diff viewer for large diffs that tracks which blocks you have reviewed"
arch=('any')
url="https://seendiff.com/"
license=('MIT')
depends=('python' 'git' 'python-fastapi' 'uvicorn' 'python-unidiff' 'python-pygments')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-httpx2')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("git+https://github.com/acme-dot-bot/seendiff.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local _ver
  _ver=$(sed -n 's/^version = "\(.*\)"/\1/p' pyproject.toml)
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  # Upstream pins an exact Pygments version; follow the system one instead.
  sed -i 's/"pygments==[^"]*"/"pygments"/' pyproject.toml
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"
  PYTHONPATH="$PWD" python -m pytest -q tests
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 seendiff/static/fonts/LICENSE-JetBrainsMono.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-JetBrainsMono.txt"
  install -Dm644 seendiff/static/fonts/LICENCE-UbuntuSansMono.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENCE-UbuntuSansMono.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # Agent skill for walkthrough mode; seendiff-git.install tells users how to copy it.
  install -Dm644 skills/seendiff/SKILL.md "$pkgdir/usr/share/$_pkgname/skills/seendiff/SKILL.md"
}
