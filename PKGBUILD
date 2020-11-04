# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-meson
pkgver=1
pkgrel=20
arch=('any')
pkgdesc="Meson wrapper for MinGW (mingw-w64)"
depends=('meson' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
makedepends=('mingw-w64-environment')
optdepends=('mingw-w64-wine: Set NEED_WINE env variable in your PKGBUILD to use wine support in meson'
  'mingw-w64-cmake')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("toolchain_generator.py"
        "meson-mingw-wrapper")
sha256sums=('20b0c2add1182f2b8cdf53dea7c6fd870989a39abd7713acbce924cde716a85b'
            'c91f2bbcafad7b742f13c6bd46324a03b70066b348621ce6a20f4a05005985ef')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset CPPFLAGS
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    source mingw-env ${_arch}
    python toolchain_generator.py --arch ${_arch} --output-file toolchain-${_arch}.meson 
    python toolchain_generator.py --arch ${_arch} --output-file toolchain-${_arch}-wine.meson --need-exe-wrapper 
    sed "s|@TRIPLE@|${_arch}|g;" meson-mingw-wrapper > ${_arch}-meson
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/mingw
  install -m 755 "${srcdir}/toolchain_generator.py" "$pkgdir/usr/bin/meson-cross-file-generator"
  for _arch in ${_architectures}; do
    install -m 755 "${srcdir}/${_arch}-meson" "$pkgdir/usr/bin/${_arch}-meson"
    install -m 644 toolchain-${_arch}.meson "${pkgdir}"/usr/share/mingw/
    install -m 644 toolchain-${_arch}-wine.meson "${pkgdir}"/usr/share/mingw/
  done
}

# vim: ts=2 sw=2 et:
