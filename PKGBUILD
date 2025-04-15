# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

_pkgname=auth
pkgname="$_pkgname-cli"
pkgver=0.2.0
pkgrel=1
pkgdesc='Authenticator CLI, generate totps on the fly'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$_pkgname"
license=('BSD-3-Clause')
source=(
  "$pkgname-$pkgver::git+$url.git#tag=v$pkgver"
  'catch2::git+https://github.com/catchorg/Catch2.git'
  'tomlplusplus::git+https://github.com/marzer/tomlplusplus.git'
)
sha256sums=(
  '3719396f4fda325c9df2321e3034f7cfb18de3d505819d37e208c6d49312609e'
  'SKIP'
  'SKIP'
)
makedepends=('cmake' 'git')
depends=(
  'glibc'
  'gcc-libs'
  'libcrypto.so'
)

prepare() {
  cd "$pkgname-$pkgver"
  for submodule in $(git config --file .gitmodules --get-regexp path | awk '{ print $2 }'); do
    git submodule init "$submodule"
    git config "submodule.$submodule.url" "file://$srcdir/$(basename "$submodule")"
  done
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname-$pkgver"
  make release
}

check() {
  cd "$pkgname-$pkgver"
  ./build/AuthTests
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 'build/Auth' "$pkgdir/usr/bin/$pkgname"
  install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}

# vim: ts=2 sw=2 et:
