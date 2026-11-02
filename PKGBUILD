# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=ambuild
# The last tag, 2.2 (2020), has API 2.2, but SourcePawn needs 2.2.3 or later: the package is built
# from the latest commit, versioned like git describe: <tag>.r<commits since>.g<short commit>.
pkgver=2.2.r82.g01212cb
_commit=01212cb57c96561f664b6dfb2ee10e66de6f81e4
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
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  ldflags.patch)
sha512sums=('cf2872941e93286f75187c07386f30f86bc4fa39366abbfb1461292eebf16548267523812a3bd381889789fb56638ad624c91cab3f0287fb75f39aaeab95403b'
  '6ed24fbd565c0e26cab4beaa05b40a1bb425d6401f4469c935cd8cf2b6d4ffaca959f42fd79cb5042064e1329e0c57a182bcc06220758c664802f171aa692627')
b2sums=('8ef4435967f40711aa3486054eb24497ef0779f84e4d8b92a4889f5f35bff58c5d99936e5d581a7900459caf9a7b8587dfe056207f8f5106fc29f357bac08f38'
  'b2b4fcd0944ff31097c101463dab9c2aa8c72501a8e11222efba78282cd5f7d191301b8cbf46c210c5ca6c4eddaa8c1278d3f0f6deebbfd7ed228ea835fbe3fe')

prepare() {
  cd "$pkgname-$_commit" || exit

  # The compilers take CFLAGS and CXXFLAGS from the environment, the linker LDFLAGS too, so that
  # makepkg's linker flags (RELRO, …) apply
  patch -Np1 -i "$srcdir/ldflags.patch"
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
