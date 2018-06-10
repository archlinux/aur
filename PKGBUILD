# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=litex-git
pkgver=3724
pkgrel=1
pkgdesc="Migen based SoC"
arch=(any)
url="https://github.com/enjoy-digital/litex"
license=('MIT')
groups=()
depends=('python' 'migen')
optdepends=('lm32-elf-binutils: lm32 soft core'
			'lm32-eld-gcc: lm32 soft core'
			'riscv64-unknown-elf-binutils: picorv32 and vexriscv soft cores'
			'riscv64-unknown-elf-gcc: picorv32 and vexriscv soft cores')
provides=()
options=(!emptydirs)
install=
source=("git+https://github.com/enjoy-digital/litex" "removed_sections.patch")
sha256sums=('SKIP' '13509ea8953b0e696539e604979e5411dafeaceb8da46acc52d701095e4f5534')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git rev-list --count HEAD
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"
  rm -rf test/__init__.py
  git submodule init
  git submodule update
  patch -Np1 -i "${srcdir}/removed_sections.patch"
}

build() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

