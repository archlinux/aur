# Maintainer: Hanna Rose <imhxnna@gmail.com>

_pkgname=odin
pkgname=odin-src
pkgrel=2021
pkgver=b014879
pkgdesc="Standalone master build of the Odin programming language."
arch=('x86_64')
url="https://odin-lang.org/"
license=('BSD-2-Clause')
provides=('odin')
makedepends=('git' 'make')
conflicts=('odin' 'odin-bin' 'odin-git')
options=('!strip')

sha256sums=(
  'SKIP'
  '29b07422da4bcea271a88f302e5f84bd34380af137df18e33251b42dd20c26d7'
  '5c418cd5b348ac1348767e76c7e08b7ab39359fadc8cd792133bcff4410aa78b'
)

source=(
  'git+https://github.com/odin-lang/odin'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-20.10.tar.xz'
  '0001-patch-makefile-for-aur.patch'
)

prepare() {
  cd "${_pkgname}"
  patch --forward --strip=1 --input="${srcdir}/0001-patch-makefile-for-aur.patch"
  ln -s "${srcdir}/clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-20.10" "llvm"
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

  install -Dm644 examples "${pkgdir}/usr/share/doc/${_srcname}/examples" 
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_srcname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_srcname}/LICENSE"
}
