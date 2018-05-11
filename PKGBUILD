# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-meson
pkgver=1
pkgrel=4
arch=('any')
pkgdesc="Meson wrapper for MinGW (mingw-w64)"
depends=('meson' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-wine')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("toolchain-mingw.meson"
        "meson-mingw-wrapper")
sha256sums=('32d9dc088394e17753231e4cc24c53c3d3c0e29130a9aa37c6ca080d865a22e2'
            '955ab09bc5e0f191964e008a54caa695290264c84f16fac7e48c1a2fe0838232')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    if [ ${_arch} = "i686-w64-mingw32" ]; then
      _cpu_family="x86"
    else
      _cpu_family="x86_64"
    fi	
    sed "s|@TRIPLE@|${_arch}|g;s|@PROCESSOR@|${_arch::-12}|g;s|@CPU_FAMILY@|${_cpu_family}|g" toolchain-mingw.meson > toolchain-${_arch}.meson
    sed "s|@TRIPLE@|${_arch}|g;" meson-mingw-wrapper > ${_arch}-meson
  done
}

package() {
  install -d "${pkgdir}"/usr/share/mingw
  for _arch in ${_architectures}; do
    install -Dm 755 "${srcdir}/${_arch}-meson" "$pkgdir/usr/bin/${_arch}-meson"
    install -m 644 toolchain-${_arch}.meson "${pkgdir}"/usr/share/mingw/
  done
}

# vim: ts=2 sw=2 et:
