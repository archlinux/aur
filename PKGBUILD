# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gitlint
pkgver=0.17.0
pkgrel=8
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
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  git
  python-pytest
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "0001-Unset-EDITOR-env-var-in-test_run_hook_edit.patch"
)
sha256sums=(
  '1c1e895aea22b1ded131a9dc81dd1f37fb064a9f3af7421debd1606ca646196a'
  'ec117041e4ba8a3a46d27e169982129dd08e455501de676d873fce91b1d934cd'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/0001-Unset-EDITOR-env-var-in-test_run_hook_edit.patch"
}

build() {
  cd $_archive
  cd gitlint-core

  python -m build --wheel --no-isolation

  # Completions
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH"
  local gitlint_cmd="$PWD/tmp_install/usr/bin/gitlint"
  _GITLINT_COMPLETE=bash_source $gitlint_cmd > gitlint.bash
  _GITLINT_COMPLETE=fish_source $gitlint_cmd > gitlint.fish
  _GITLINT_COMPLETE=zsh_source $gitlint_cmd > gitlint.zsh
  rm -r tmp_install
}

check() {
  cd "$_archive"
  cd gitlint-core

  python -m pytest
}

package() {
  cd "$_archive"
  cd gitlint-core

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 gitlint.bash "$pkgdir/usr/share/bash-completion/completions/gitlint"
  install -Dm644 gitlint.fish "$pkgdir/usr/share/fish/vendor_completions.d/gitlint.fish"
  install -Dm644 gitlint.zsh "$pkgdir/usr/share/zsh/site-functions/_gitlint"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
