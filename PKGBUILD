# Maintainer: Thibaut Sautereau (thithib) <thibaut at sautereau dot fr>

pkgname=hardened_malloc
pkgver=8
pkgrel=2
pkgdesc="Hardened allocator designed for modern systems"
arch=('x86_64')
url="https://github.com/GrapheneOS/hardened_malloc"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
checkdepends=('python')
provides=('libhardened_malloc.so')
source=("git+https://github.com/GrapheneOS/$pkgname#tag=$pkgver?signed"
        '0001-Fix-CPPFLAGS-in-test-Makefile.patch')
sha256sums=('SKIP'
            '118692a4096a70401773def95be713f535ae04477e2eb73e59b03169d54ea635')
validpgpkeys=('65EEFE022108E2B708CBFCF7F9E712E59AF5F22A') # Daniel Micay <danielmicay@gmail.com>

prepare() {
  patch --directory="$pkgname" --input="$srcdir/0001-Fix-CPPFLAGS-in-test-Makefile.patch" --strip=1
}

build() {
  cd "$pkgname"
  make
}

check() {
  cd "$pkgname"
  make CONFIG_WERROR=false test
}

package() {
  cd "$pkgname"
  install -Dm755 --target-directory="$pkgdir/usr/lib" libhardened_malloc.so
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
