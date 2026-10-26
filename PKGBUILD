# Maintainer: Faruq Zhao <zhao at faruq dot top>
# Contributor: Thibaut Sautereau (thithib) <thibaut at sautereau dot fr>

pkgname=hardened_malloc
pkgver=14
pkgrel=1
pkgdesc="Hardened allocator designed for modern systems"
arch=('x86_64')
url="https://github.com/GrapheneOS/hardened_malloc"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
checkdepends=('python')
provides=('libhardened_malloc.so' 'libhardened_malloc-light.so')
source=("git+https://github.com/GrapheneOS/$pkgname#tag=$pkgver"
        "$pkgname-gcc16.patch")
sha256sums=('02f883d1924df3ab05304b46abea0c6108f90252e04afcf9909d16a1ed19911a'
            'f0dbeb7aea7738eb4f240e15da3ebccd419a777022db010337eaffaecfbc3a06')

prepare() {
  cd "$pkgname"
  patch -Np1 -i ../hardened_malloc-gcc16.patch
}

build() {
  cd "$pkgname"
  make VARIANT=default
  make VARIANT=light
}

check() {
  make -C "$pkgname" test
}

package() {
  cd "$pkgname"
  install -vDm755 -t "$pkgdir/usr/lib" out/libhardened_malloc.so out-light/libhardened_malloc-light.so
  install -vDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sts=2 sw=2 et:
