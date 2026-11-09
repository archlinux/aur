# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=ambuild
# The last tag, 2.2 (2020), has API 2.2, but SourcePawn needs 2.2.3 or later: the package is built
# from the latest commit, versioned like git describe: <tag>.r<commits since>.g<short commit>.
pkgver=2.2.r84.g5b0aa72
_commit=5b0aa725beef33c9cf6a1b00659a010c3d9120d3
pkgrel=1
# Where ./aur-packages commits reads _commit from: the commit pkgver names
_commit_lookup() {
  curl -fsSL "https://api.github.com/repos/alliedmodders/ambuild/commits/${pkgver##*.g}" | jq -r .sha
}
pkgdesc="AlliedModders' build system, used by SourceMod, SourcePawn and Metamod:Source"
arch=(any)
url="https://github.com/alliedmodders/ambuild"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=(
  'gcc: C/C++ compiler'
  'clang: C/C++ compiler'
)
conflicts=(ambuild-git)
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('6ccae658f03312b18665792508f976e10267e72b85c997d3cc46cc50d3c8f9849cc30b893ac1af7c456a3b6b1544e1150fb507d92655556048cb883704dc10e0')
b2sums=('2dad47ac99175bba4dfd2f193c723368738b77af23d8231d597e947ec47c716ec0cd81ebdc0a1a96d0d409b5e9e0e2e81a29bef6ff45f1287a9047140a8ad481')

build() {
  cd "$pkgname-$_commit" || exit

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$_commit" || exit

  python -m unittest discover ambuild2 "*_test.py"
}

package() {
  cd "$pkgname-$_commit" || exit

  python -m installer --destdir "$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
