# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=ambuild
# The last tag, 2.2 (2020), has API 2.2, but SourcePawn needs 2.2.3 or later: the package is built
# from the latest commit, versioned like git describe: <tag>.r<commits since>.g<short commit>.
pkgver=2.2.r83.g4b8b3d3
_commit=4b8b3d34179a2f667799446f549e2ab0b492aa0c
pkgrel=2
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
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  ambuild-raw-string-escapes.patch)
sha512sums=('bec5e84a5250ba72e8b815e274238b62dfd38b92982610d45d056f4f08a009b6e8761b91d0d410a059f32f74ad1371d0e30d320a43a9890b9cf0241b44aa08dd'
  'a1143f1789e982ffb15826dc509878accc510b85e8279decd0a0fb6f36c6fb13453b7154bb84695171700cd5b4fb3357bcb96b80bca2a7e2c197ffb8938798f0')
b2sums=('78dc3606029af6124efefbd3384ddf23036788d09d928e81b3c6401ba1488e7457fc1883ff3f4b22831f736d9ab83f446f772e400d5e0802115a90f2b915cd76'
  'e66ccb052bd161145cd5db6cac5dc8769a6bf8cf0c93801a010f47e2450932a493d6355b231b14a3f8cc66a2aee0d207e1c3950009de2c3d8399890d899d0e18')

prepare() {
  cd "$pkgname-$_commit" || exit
  # Raw strings for the regular expressions and MSBuild paths with invalid escape sequences, which
  # Python warns about on every compile and a future version rejects
  # (https://github.com/alliedmodders/ambuild/pull/195)
  patch -Np1 -i "$srcdir/ambuild-raw-string-escapes.patch"
}

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
