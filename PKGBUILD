# Maintainer: envolution
# Contributor: James An <james@jamesan.ca>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=speedtest-cli-git
_pkgname=${pkgname%-git}
pkgver=2.1.3+r299+g22210ca35
pkgrel=1
pkgdesc='Command line interface for testing internet bandwidth using speedtest.net'
arch=('any')
url="https://github.com/sivel/$_pkgname"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' python-wheel python-installer python-build)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/sivel/$_pkgname.git"
  'https://patch-diff.githubusercontent.com/raw/sivel/speedtest-cli/pull/803.patch'
)
md5sums=('SKIP'
         '0795de55ee1d58e03c2f9dcf126b434b')

pkgver() {
  cd "${_pkgname}"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1 | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}
prepare() {
  cd $_pkgname
  patch -Np1 -i ../803.patch

}
build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}
package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
