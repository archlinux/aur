# Maintainer: Hanna Rose <imhxnna@gmail.com>

_pkgname=odin
pkgname=odin-src
pkgver=r4301.fe2ad54f
pkgrel=1
epoch=2
pkgdesc="Standalone master build of the Odin programming language."
arch=('x86_64')
url="https://odin-lang.org/"
license=(BSD)
makedepends=(git clang+llvm-binaries)
provides=('odin')
conflicts=('odin')
options=('!strip')
source=("git+https://github.com/odin-lang/odin.git"
        '0001-patch-makefile-for-aur.patch')
sha256sums=('SKIP'
            '5c418cd5b348ac1348767e76c7e08b7ab39359fadc8cd792133bcff4410aa78b')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  patch --forward --strip=1 --input="${srcdir}/0001-patch-makefile-for-aur.patch"
  ln -s "/opt/clang+llvm11" "llvm"
}

build() {
  cd "${_pkgname}"
  make release
}

package() {
  cd "${_pkgname}"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_pkgname}"

  cp odin "${pkgdir}/usr/lib/${_pkgname}/odin"
  cp -r core "${pkgdir}/usr/lib/${_pkgname}/core"
  ln -s "/usr/lib/${_pkgname}/odin" "${pkgdir}/usr/bin/odin"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  cp -r examples "${pkgdir}/usr/share/doc/${_pkgname}/"
}
