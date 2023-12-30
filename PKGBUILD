# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-meson
pkgver=1
pkgrel=25
arch=('any')
pkgdesc="Meson wrapper for MinGW (mingw-w64)"
depends=('meson' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
makedepends=('mingw-w64-environment')
optdepends=('mingw-w64-wine: Set NEED_WINE env variable in your PKGBUILD to use wine support in meson')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("toolchain_generator.py"
        "meson-mingw-wrapper")
sha256sums=('b24aaa1392d34a6ae73ee26b094e887a820e885b0f417eb38be4a8351e385458'
            '2defbbb1f43e13815b2a8a8327bd14aad175219eb4ff9935d5bf9d46b9f8728a')
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
