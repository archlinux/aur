# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Based on PKGBUILD created by: Alex Sarum <rum.274.4 at gmail dot com>

_pkgname=GhidraVmlinuxLoader
pkgname=ghidra-extension-vmlinux-loader-git
pkgver=r4.g0363685
pkgrel=1
pkgdesc="This extension can be used to load vmlinux kernel images into Ghidra."
arch=('x86_64')
url="https://github.com/idl3r/${_pkgname}"
license=('Apache')
depends=('ghidra')
makedepends=('git' 'gradle' 'unzip' 'ghidra')
source=("${_pkgname}::git+https://github.com/idl3r/${_pkgname}" "9_1.patch::https://github.com/idl3r/${_pkgname}/commit/928d5fc5cca9446da4bf0e1649488f7b2e082b58.patch")
sha512sums=('SKIP' '9d3340fbce665d6654a5172e35ac24dfb898bdf6b9b39454034a708ebcde147937eb5ad52d2474377f63870d69cd016f806641eb55284c591425cd73b379fb1f')

prepare() {
  cd "$srcdir/${_pkgname}"
  patch -p1 < "${srcdir}/9_1.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  count_commits=$(git rev-list --count HEAD)
  commit=$(git rev-parse --short HEAD)
  echo "r${count_commits}.g${commit}"
}

build() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"
  GHIDRA_INSTALL_DIR="$(dirname $(readlink -fe $(which ghidra)))" gradle
}

package() {
  ghidra_dir=$(dirname $(readlink -fe $(which ghidra)))
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  install -d "${pkgdir}/${ghidra_dir}/Ghidra/Extensions"

  # Extract built archive into destination folder
  unzip -u dist/*.zip -d "${pkgdir}/${ghidra_dir}/Ghidra/Extensions/"
}
