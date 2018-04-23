# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-meson
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Meson wrapper for MinGW (mingw-w64)"
depends=('meson' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
optdepends=('wine: runtime support')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("toolchain-mingw.meson")
sha256sums=('c8392670b99692b6221efa7c553745f14e1824e0ae5081ad36bf003e83192b8c')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    if [ ${_arch} = "i686-w64-mingw32" ]; then
      _cpu_family="x86"
    else
      _cpu_family="x86_64"
    fi	
    sed "s|@TRIPLE@|${_arch}|g;s|@PROCESSOR@|${_arch::-12}|g;s|@CPU_FAMILY@|${_cpu_family}|g" toolchain-mingw.meson > toolchain-${_arch}.meson
  done
}

package() {
  install -d "${pkgdir}"/usr/share/mingw
  for _arch in ${_architectures}; do
    install -m 644 toolchain-${_arch}.meson "${pkgdir}"/usr/share/mingw/
  done
}

# vim: ts=2 sw=2 et:
