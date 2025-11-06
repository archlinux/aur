# shellcheck disable=SC2034 # unused var
# shellcheck disable=SC2154 # var referenced but not assigned
# shellcheck disable=SC2164 # cd might fail

# Maintainer: Štěpán Němec <stepnem@smrk.net>
pkgname='tree-sitter-svelte'
pkgver=0.11.0
pkgrel=1
pkgdesc='Svelte grammar for tree-sitter'
arch=('x86_64')
url='https://github.com/Himujjal/tree-sitter-svelte/'
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
provides=("lib$pkgname.so")
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/Himujjal/tree-sitter-svelte/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('65a082849220f8c0623cda88f01f4c0f619cc26e894232d133489c48f081f56c')

_soname=lib$pkgname.so.14.0

build() {
  cd "$pkgname-$pkgver"/src
  # shellcheck disable=SC2086 # quote to prevent globbing and word splitting
  cc $CFLAGS -I. -fPIC $LDFLAGS -shared -Wl,-soname,$_soname -o $_soname ./*.c
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 src/$_soname -t "$pkgdir"/usr/lib
  (cd "$pkgdir"/usr/lib && ln -s $_soname ${_soname%.[0-9]*} &&
    ln -s ${_soname%.[0-9]*} ${_soname%%.[0-9]*})
  install -Dm644 "LICENSE" -t "$pkgdir"/usr/share/licenses/tree-sitter-svelte
}
