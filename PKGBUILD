# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gitlint
pkgver=0.19.1
pkgrel=2
pkgdesc="Git commit message linter"
arch=(any)
url="https://github.com/jorisroovers/gitlint"
license=(MIT)
depends=(
  python
  python-arrow
  python-click
  python-sh
)
makedepends=(
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  git
  python-pytest
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('60de0fe764bd8fc86eb38990fb6704c5c4649a1fee574407b87b3c1471e12bd0')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive/gitlint-core"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  # Completions
  export PYTHONPATH="$PWD/tmp_install/$_site_packages:$PYTHONPATH"
  _gitlint_cmd="$PWD/tmp_install/usr/bin/gitlint"
  _GITLINT_COMPLETE=bash_source $_gitlint_cmd > gitlint.bash
  _GITLINT_COMPLETE=fish_source $_gitlint_cmd > gitlint.fish
  _GITLINT_COMPLETE=zsh_source $_gitlint_cmd > gitlint.zsh
}

check() {
  cd "$_archive/gitlint-core"

  pytest
}

package() {
  cd "$_archive/gitlint-core"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 gitlint.bash "$pkgdir/usr/share/bash-completion/completions/gitlint"
  install -Dm644 gitlint.fish "$pkgdir/usr/share/fish/vendor_completions.d/gitlint.fish"
  install -Dm644 gitlint.zsh "$pkgdir/usr/share/zsh/site-functions/_gitlint"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
