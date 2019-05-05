# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-meson
pkgver=1
pkgrel=10
arch=('any')
pkgdesc="Meson wrapper for MinGW (mingw-w64)"
depends=('meson' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
optdepends=('mingw-w64-wine: Set NEED_WINE env variable in your PKGBUILD to use wine support in meson')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("toolchain-mingw.meson"
        "meson-mingw-wrapper")
sha256sums=('8d8fac754547bf7095058ef65bf3df05c35bbc65c69b7008f1169433717da42b'
            '85777b094e7dbc6623f6fdef035bf65eb60e827e1dde7dfe4b40177bdaf75a5e')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    if [ ${_arch} = "i686-w64-mingw32" ]; then
      _cpu_family="x86"
    else
      _cpu_family="x86_64"
    fi	
    sed "s|@TRIPLE@|${_arch}|g;s|@PROCESSOR@|${_arch::-12}|g;s|@CPU_FAMILY@|${_cpu_family}|g" toolchain-mingw.meson > toolchain-${_arch}.meson
    sed "s|@TRIPLE@|${_arch}|g;s|@PROCESSOR@|${_arch::-12}|g;s|@CPU_FAMILY@|${_cpu_family}|g" toolchain-mingw.meson > toolchain-${_arch}-wine.meson
    sed -i '/^exe_wrapper/ d' toolchain-${_arch}.meson
    sed "s|@TRIPLE@|${_arch}|g;" meson-mingw-wrapper > ${_arch}-meson
  done
}

package() {
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/mingw
  for _arch in ${_architectures}; do
    install -m 755 "${srcdir}/${_arch}-meson" "$pkgdir/usr/bin/${_arch}-meson"
    install -m 644 toolchain-${_arch}.meson "${pkgdir}"/usr/share/mingw/
    install -m 644 toolchain-${_arch}-wine.meson "${pkgdir}"/usr/share/mingw/
  done
}

# vim: ts=2 sw=2 et:
