# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=soundshed-guitar
pkgname=${_name,,}
pkgver=r904.f219ebb
pkgrel=1
pkgdesc="A guitar/bass effects app and plugin."
arch=(x86_64 aarch64)
url="https://github.com/webprofusion/${_name}"
license=(AGPL-3.0)
depends=(webkit2gtk-4.1)
makedepends=("cmake" "git" "npm")
options=()
provides=("${_name}")
conflicts=("${_name}-bin")
source=(
  "git+${url}.git"
  "$_name.desktop"
)
sha256sums=('SKIP'
            '841f9d304c6bce88380d30c86c8badc89c985548d9b5ad31e0c6c19cb7ca26a9')

prepare() {
  cd "${_name}"
  git submodule update --init --recursive
}

pkgver() {
  cd "${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_name}"
  _arch=${CARCH/86_/}
  _arch=${_arch/arch/rm}
  bash ./build_linux.sh --arch ${_arch} --lv2
}

package() {
  _arch=${CARCH/86_/}
  _arch=${_arch/arch/rm}
  cp -a ${_name}/linux-dist-${_arch}/{opt,usr} $pkgdir/
  install -Dm644 $srcdir/${_name}.desktop -t "$pkgdir/usr/share/applications"
}
