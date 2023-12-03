_pkgname=mpv
pkgname="mingw-w64-${_pkgname}"
pkgver=0.37.0
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 (mingw-w64)"
url="https://mpv.io/"
arch=('any')
license=('GPL')
depends=("mingw-w64-ffmpeg"
         "mingw-w64-lcms2"
         "mingw-w64-libass"
         "mingw-w64-libbluray"
         "mingw-w64-libjpeg-turbo"
         "mingw-w64-shaderc"
         "mingw-w64-libplacebo"
         "mingw-w64-luajit"
         "mingw-w64-uchardet"
         "mingw-w64-spirv-cross")
makedepends=("mingw-w64-gcc"
             "mingw-w64-meson"
             "mingw-w64-cmake"
             "mingw-w64-pkg-config")
options=(staticlibs !strip !buildflags)
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/mpv-player/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('1d2d4adbaf048a2fa6ee134575032c4b2dad9a7efafd5b3e69b88db935afaddf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  for _arch in ${_architectures}; do
    pushd "${_pkgname}-${pkgver}"

    cat > "${_arch}.txt" << EOF
[built-in options]
wrap_mode = 'nodownload'

[binaries]
c           = '${_arch}-gcc'
cpp         = '${_arch}-g++'
ar          = '${_arch}-ar'
cmake       = '${_arch}-cmake'
strip       = '${_arch}-strip'
exe_wrapper = 'wine64'
pkg-config  = '${_arch}-pkg-config'
windres     = '${_arch}-windres'

[host_machine]
system     = 'windows'
cpu_family = 'x86_64'
cpu        = 'x86_64'
endian     = 'little'
EOF

    local _allows="-Wno-error=deprecated -Wno-error=deprecated-declarations -Wno-stringop-overflow"
    local _includes="-I/usr/${_arch}/include/luajit-2.0/ -I/usr/${_arch}/include/uchardet/"

    meson setup --cross-file "${_arch}.txt" build \
      --buildtype debugoptimized --werror -Dc_args="${_allows} ${_includes}" \
      -Dlibmpv=true -Dlua=auto -D{shaderc,spirv-cross,d3d11}=enabled
    popd

    rm -rf "build-${_arch}"
    mv "${_pkgname}-${pkgver}/build" "build-${_arch}"
  done
}

build() {
  cd "${srcdir}/"
  for _arch in ${_architectures}; do
    meson compile -C "build-${_arch}"
  done
}

package() {
  cd "${srcdir}/"
  for _arch in ${_architectures}; do
    pushd build-${_arch}

    mkdir -p "$pkgdir/usr/"
    rm -rf "$pkgdir/usr/${_arch}"

    meson install --destdir="${pkgdir}"
    mv "${pkgdir}/usr/local" "$pkgdir/usr/${_arch}"

    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' -exec ${_arch}-strip -g {} \;

    # Move encoding-profiles.conf to share/doc alongside the example .conf files.
    # mpv doesn't search /etc for configuration on MinGW.
    mv "${pkgdir}/usr/$_arch/etc/mpv/"*.conf "${pkgdir}/usr/$_arch/share/doc/mpv/"

    popd
  done
}
