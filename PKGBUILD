# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>

pkgname=libpdfium
pkgver=158.0.8127.88
pkgrel=1
pkgdesc='PDF rendering and manipulation library'
arch=(x86_64)
url='https://pdfium.googlesource.com/pdfium/'
license=(Apache-2.0)
depends=(
  glibc
  highway
  libfreetype.so
  libgcc_s.so
  libharfbuzz-subset.so
  libharfbuzz.so
  libicuuc.so
  libjpeg.so
  liblcms2.so
  libstdc++.so
  libz.so
  openjpeg2
)
makedepends=(
  clang
  compiler-rt
  fast_float
  git
  gn
  ninja
  patchelf
  pkgconf
  python
)
provides=(${pkgname}.so)
options=(!lto)

# PDFium revision pinned by the current Chromium release
_pdfium_commit=b23fee3ac22360878efaa8aa533dac892fe777ab

# Pinned by PDFium's DEPS at the revision above
_build_commit=ebdaeefa62db7c40f27cacb0eb034db3a5cdb849
_buildtools_commit=64e87f9fbdaf6f53f6cff8f15e4b06f17cead514
_abseil_commit=a00d74bb55b38f213a3c6110b4bcab5bb565bd56
_dragonbox_commit=beeeef91cf6fef89a4d4ba5e95d47ca64ccb3a44
_fast_float_commit=b0ab987b3dfdde13fa1915f65ef2a5c068d9208c

source=(
  "pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=${_pdfium_commit}"
  "build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=${_build_commit}"
  "buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=${_buildtools_commit}"
  "abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=${_abseil_commit}"
  "dragonbox::git+https://chromium.googlesource.com/external/github.com/jk-jeon/dragonbox.git#commit=${_dragonbox_commit}"
  "generate_shim_headers.py::https://github.com/chromium/chromium/raw/refs/tags/${pkgver}/tools/generate_shim_headers/generate_shim_headers.py"
  'compiler-rt-adjust-paths.patch'
  'hermetic-python.patch'
  'increase-fortify-level.patch'
  'pdfium-installed-headers.patch'
  'pdfium-shared-library.patch'
  'pdfium-system-lcms2.patch'
)
sha256sums=('a3982bf9e230682b29e74db47167fcbdc80d8e1021d3a307f0a94e39dd83ee84'
            '1a26b007c9afd9f065843509a8535063dee92f43c3852dffceecf1358f44f3fc'
            '042464a0dbe2060f40fe678d3bfb6a7307497fcd0f89c952ce844e0a8da17a0f'
            '81139ae7644b634486ea9cf144360e317adeb67e25f57aa03caac9e56610e829'
            '36401f4a3f1928af41d6954b17b1a48db7d1b91787bfc3fbb2687c040a1af4f3'
            '21df5ac8b9e5d3831f97cc168f484164a6717c52023214ef203cc4a34c484724'
            '4ada493a28e95a64d0ed2f47b924ae75930a16c93dcba34ccfb43ecb721d107b'
            'fe919a63c45a8fad706c89a18f508ea697e4c17460cbe814755978a963ef54fd'
            '05b1f881807e404c22ffbfa6837bea1a50d85ad09d5c4b5744c5e287d360b54d'
            'c7d18dd353bc282cada28848fb2d3fb016ea1885ee9e2ebc57b38419522a704b'
            'c58c25728cfe5df22e421000f8913dccec82dd14324a15c5e65743a360ba8f30'
            '357e6a267dc5cada6c985c683d4fa702c82d81cee2e91ed656c422f88a7b1aa0')

prepare() {
  cd pdfium

  ln -sfn "${srcdir}/build" build
  ln -sfn "${srcdir}/buildtools" buildtools
  ln -sfn "${srcdir}/abseil-cpp" third_party/abseil-cpp
  ln -sfn "${srcdir}/dragonbox" third_party/dragonbox/src

  mkdir -p third_party/fast_float/src/include
  ln -sfn /usr/include/fast_float third_party/fast_float/src/include/fast_float

  cat > build/config/gclient_args.gni <<'EOF'
build_with_chromium = false
EOF

  # Copy from the matching Chromium release
  install -Dm755 "${srcdir}/generate_shim_headers.py" \
    -t tools/generate_shim_headers

  patch -Np1 -i "${srcdir}/hermetic-python.patch"

  patch -Np1 -i "${srcdir}/pdfium-installed-headers.patch"
  patch -Np1 -i "${srcdir}/pdfium-shared-library.patch"
  patch -Np1 -i "${srcdir}/pdfium-system-lcms2.patch"

  install -Dm644 build/linux/unbundle/icu.gn third_party/icu/BUILD.gn

  # Use the system Highway. Chromium's unbundle shim generates forwarding
  # headers from a Highway source checkout, which this package does not use;
  # expose the installed headers at the path PDFium includes them from.
  cat > third_party/highway/BUILD.gn <<'EOF'
import("//build/config/linux/pkg_config.gni")

pkg_config("libhwy_external_config") {
  packages = [ "libhwy" ]
}

source_set("libhwy") {
  public_configs = [ ":libhwy_external_config" ]
}
EOF
  mkdir -p third_party/highway/src
  ln -sfn /usr/include/hwy third_party/highway/src/hwy

  # core/fxcodec depends on the libjpeg_turbo header target even when the
  # library itself is provided by the system.
  mkdir -p third_party/libjpeg_turbo
  cat > third_party/libjpeg_turbo/BUILD.gn <<'EOF'
config("libjpeg_headers_config") {
  include_dirs = [ "/usr/include" ]
}

group("libjpeg_headers") {
  public_configs = [ ":libjpeg_headers_config" ]
}
EOF

  cd "${srcdir}/build"

  patch -Np1 -i "${srcdir}/compiler-rt-adjust-paths.patch"
  patch -Np1 -i "${srcdir}/increase-fortify-level.patch"
}

build() {
  cd pdfium

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm
  CFLAGS+=' -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  local _clang_version
  _clang_version=$(clang --version | sed -n '1s/.*clang version \([0-9][0-9]*\).*/\1/p')

  local _args=(
    'is_debug=false'
    'is_official_build=false'
    'is_component_build=false'
    'symbol_level=0'
    'treat_warnings_as_errors=false'
    'fatal_linker_warnings=false'

    'is_clang=true'
    'clang_base_path="/usr"'
    "clang_version=\"${_clang_version}\""
    'clang_use_chrome_plugins=false'
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'use_sysroot=false'
    'use_custom_libcxx=false'
    'use_lld=false'
    'use_siso=false'
    'enable_rust=false'

    'pdf_is_standalone=false'
    'pdf_is_complete_lib=false'
    'pdf_enable_v8=false'
    'pdf_enable_xfa=false'
    'pdf_use_skia=false'
    'pdf_use_agg=true'
    'pdf_enable_freetype=true'
    'pdf_bundle_freetype=false'
    'use_system_freetype=true'
    'pdf_enable_brotli=false'
    'pdf_use_libyuv=false'
    'pdf_use_partition_alloc=false'
    'pdf_enable_fontations=false'

    'use_system_libjpeg=true'
    'use_system_libpng=true'
    'use_system_lcms2=true'
    'use_system_libopenjpeg2=true'
    'use_system_zlib=true'
    'use_system_harfbuzz=true'
  )

  gn \
    --root-pattern='//:pdfium'\
    --args="${_args[*]}" \
    gen out/Release
  ninja -C out/Release pdfium

  patchelf --set-soname ${pkgname}.so.${pkgver} out/Release/${pkgname}.so
}

package() {
  cd pdfium

  install -Dm755 out/Release/${pkgname}.so \
    "${pkgdir}/usr/lib/${pkgname}.so.${pkgver}"
  ln -s ${pkgname}.so.${pkgver} "${pkgdir}/usr/lib/${pkgname}.so"

  install -Dm644 public/*.h \
    -t "${pkgdir}/usr/include/pdfium"
  install -Dm644 public/cpp/*.h \
    -t "${pkgdir}/usr/include/pdfium/cpp"

  install -dm755 "${pkgdir}/usr/lib/pkgconfig"
  cat > "${pkgdir}/usr/lib/pkgconfig/${pkgname}.pc" <<EOF
prefix=/usr
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include/pdfium

Name: ${pkgname}
Description: PDF rendering and manipulation library
Version: ${pkgver}
Libs: -L\${libdir} -lpdfium
Cflags: -I\${includedir}
EOF

  # Install licenses not provided by ArchLinux
  install -Dm644 third_party/agg23/copying \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.agg23"
  install -Dm644 "${srcdir}/dragonbox/LICENSE-Apache2-LLVM" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.Apache-2.0-with-LLVM-exception.dragonbox"
}
