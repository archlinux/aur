# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='avx-turbo'
pkgver='0.0.1'
_gitver='9cfe8bf3089636b98d9a7eaa97b9fef268004a1b'
pkgrel='2'
pkgdesc='Test the non-AVX, AVX2 and AVX-512 speeds across various active core counts'
arch=('x86_64' 'aarch64')
url="https://github.com/travisdowns/${pkgname}"
license=('MIT')
makedepends=('git' 'gcc' 'make' 'clang' 'nasm')
source=("git+${url}.git#commit=${_gitver}")
sha256sums=('a6ce9639fa99f54c0fbd96488038f4ab4423e2a2566944c4ee78536ac4cb6f77')

prepare() {
  cd "${pkgname}"

  # Use system nasm
  sed --in-place --expression 's|./nasm-2.13.03/nasm|/usr/bin/nasm|g' \
    "config.mk"
  sed --in-place --expression 's|\|\||\&\&|g' \
    "asm-methods.asm"
}

build() {
  cd "${pkgname}"
  make
}

check() {
  cd "${pkgname}"
  ./unit-test
}

package() {
  cd "${pkgname}"
  install -Dm0755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
