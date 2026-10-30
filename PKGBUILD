# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>

pkgname=libpdfium
pkgver=156.0.8078.79
pkgrel=1
pkgdesc='PDF rendering/manipulation library from Chromium'
arch=(x86_64)
url='https://pdfium.googlesource.com/pdfium/'
depends=(
  glibc
  libbrotlidec.so=1-64
  libfreetype.so=6-64
  libgcc_s.so=1-64
  libharfbuzz.so=0-64
  libharfbuzz-subset.so=0-64
  libicuuc.so=78-64
  liblcms2.so=2-64
  libjpeg.so=8-64
  libz.so=1-64
  openjpeg2
)
makedepends=(
  clang
  compiler-rt
  fast_float
  gn
  lld
  llvm
  ninja
  pkgconf
  python
  rust
)
provides=(${pkgname}.so)
options=('!lto')
source=("https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}-lite.tar.xz"
        'compiler-rt-adjust-paths.patch'
        'increase-fortify-level.patch'
        'chromium-153-hermetic-python.patch'
        'chromium-156-revert-gn-check-includes.patch')
sha256sums=('d9e8b637dbdd3a1cccb4966e81a66e3f3c4c29f5ce9732a70f5a4f949cd03923'
            'ec8e49b7114e2fa2d359155c9ef722ff1ba5fe2c518fa48e30863d71d3b82863'
            'd634d2ce1fc63da7ac41f432b1e84c59b7cceabf19d510848a7cff40c8025342'
            'ebf74154266d0b6d6cc957c413f845052c5fcfce7745befb8821595cdf3f7d49'
            'c666f9b009d3a2c737501d714689677e6d474982695966651fe7cdbcbc6e5815')

# Chromium unbundle shims relevant to pdfium's dependency closure
# (see build/linux/unbundle/replace_gn_files.py; abseil is deliberately absent).
_system_libs=(
  brotli
  freetype
  harfbuzz
  icu
  libjpeg
  zlib
)

# JavaScript (V8) support. 1 = on (default), 0 = off.
# On: V8 is compiled from the Chromium tree with a custom libc++, build time
# grows a lot and libpdfium.so gets much bigger. See the V8 flags in build().
# Off gives a much smaller library with no V8/libc++ statically linked.
_enable_js=1
if (( _enable_js )); then
  _is_jitless=1
  license=('Apache-2.0 AND MIT AND BSD-3-Clause AND (Apache-2.0 WITH LLVM-exception AND (MIT OR NCSA))')
  makedepends+=(
    highway
  )
  _system_libs+=(
    highway
  )
else
  license=('Apache-2.0 AND MIT')
  depends+=(
    libstdc++.so=6-64
  )
fi

prepare() {
  cd "chromium-${pkgver}"

  # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
  patch -Np1 -i ../compiler-rt-adjust-paths.patch

  # Increase _FORTIFY_SOURCE level to match Arch's default flags
  patch -Np1 -i ../increase-fortify-level.patch

  # Use system python3 instead of the hermetic cpython3 interpreter
  # https://github.com/ungoogled-software/ungoogled-chromium/pull/3946
  patch -Np1 -i ../chromium-153-hermetic-python.patch

  patch -Np1 -i ../chromium-156-revert-gn-check-includes.patch

  # Unbundle fast_float
  mkdir -p pdfium/third_party/fast_float/src/include
  ln -sf /usr/include/fast_float pdfium/third_party/fast_float/src/include/fast_float

  mkdir -p third_party/rust-toolchain/bin
  ln -sf /usr/bin/rustc third_party/rust-toolchain/bin/

  # Upstream only defines component("pdfium") (static/source_set unless
  # is_component_build=true, which would also split abseil, icu, ... into
  # separate .so files). Add a plain shared_library on top of it, and define
  # COMPONENT_BUILD for pdfium sources so FPDF_EXPORT expands to
  # visibility("default") (see public/fpdfview.h); otherwise Chromium's
  # -fvisibility=hidden hides the whole C API.
  python - <<'EOF'
p = 'third_party/pdfium/BUILD.gn'
s = open(p).read()
anchor = 'config("pdfium_public_config") {\n  defines = []\n'
assert anchor in s, 'pdfium_public_config layout changed; adjust prepare()'
assert 'component("pdfium")' in s, 'component("pdfium") not found'
if 'shared_library("pdfium_shared")' in s:
    raise SystemExit(0)  # already patched (prepare() re-run)
s = s.replace(anchor, anchor + '  defines += [ "COMPONENT_BUILD" ]\n', 1)
s += '''
shared_library("pdfium_shared") {
  output_name = "pdfium"
  deps = [ ":pdfium" ]
}
'''
open(p, 'w').write(s)
EOF

  # Swap bundled GN files for the system-library shims.
  python build/linux/unbundle/replace_gn_files.py --system-libraries "${_system_libs[@]}"
}

build() {
  cd "chromium-${pkgver}"

  export CC=clang CXX=clang++ AR=ar NM=nm
  # Shared object: everything must be PIC. The unbundle toolchain reads these.
  CFLAGS+=' -fPIC -Wno-unknown-warning-option'
  CXXFLAGS+=' -fPIC -Wno-unknown-warning-option'

  local _clang_version
  _clang_version=$(clang --version | head -n1 | sed 's/.*version \([0-9]\+\).*/\1/')

  local _flags=(
    # --- Toolchain -----------------------------------------------------
    # Use the system clang/lld through Chromium's "unbundle" toolchain
    # instead of the downloaded one; no Chromium sysroot, link against
    # the system glibc.
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'    # Chromium's custom clang plugins are not in system clang
    "clang_version=\"${_clang_version}\""
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'is_clang=true'
    'use_lld=true'
    'use_sysroot=false'

    # --- C++ standard library ------------------------------------------
    # Only the V8 build needs Chromium's libc++ (statically linked);
    # without JS the library uses the system libstdc++.
    "use_custom_libcxx=$( (( _enable_js )) && echo true || echo false )"

    # --- Build type / optimization -------------------------------------
    'dcheck_always_on=false'
    'is_component_build=false'          # one libpdfium.so, not one .so per component
    'is_debug=false'
    'is_official_build=false'           # avoids official-only requirements (PGO profiles, etc.)
    'symbol_level=0'
    'treat_warnings_as_errors=false'    # system clang is newer than what upstream tests
    'use_thin_lto=false'                # matches options=('!lto')

    # --- gn gen workarounds --------------------------------------------
    # gn evaluates every target in each BUILD.gn it loads, even unused ones.
    # Don't load abseil's test targets (and with them //base/test).
    'absl_build_tests=false'

    # Rust is only needed so `gn gen` can *evaluate* the tree: //base,
    # //third_party/googletest, //testing, ... define Rust targets with no
    # enable_rust guard and assert on load. Nothing Rust is built for
    # pdfium_shared (rust png/bmp/jpeg decoders, fontations and the Rust
    # harfbuzz are all off/system). rustc is never invoked.
    'enable_rust=true'
    'rust_bindgen_root="/usr"'
    "rust_sysroot_absolute=\"$(rustc --print sysroot)\""
    "rustc_version=\"$(rustc --version)\""

    # --- Memory allocator ----------------------------------------------
    # This is a library loaded into foreign processes: it must never
    # replace malloc/free of the host application.
    'pdf_use_partition_alloc=false'
    'use_allocator_shim=false'
    'use_partition_alloc=false'
    'use_partition_alloc_as_malloc=false'

    # --- PDFium features -----------------------------------------------
    'pdf_enable_fontations=false'       # Rust font backend
    'pdf_enable_rust_bmp=false'         # Rust image decoders: not built (see Rust note above)
    'pdf_enable_rust_jpeg=false'
    'pdf_enable_rust_png=false'
    "pdf_enable_v8=$( (( _enable_js )) && echo true || echo false )"
    'pdf_enable_xfa=false'              # XFA forms are deprecated and need extra deps
    'pdf_use_skia=false'                # use the AGG renderer

    # --- System libraries ----------------------------------------------
    # Complements the _system_libs unbundle shims applied in prepare().
    'use_system_lcms2=true'
    'use_system_libopenjpeg2=true'
    'use_system_libpng=true'
    'use_system_zlib=true'
  )

  if (( _enable_js )); then
    _flags+=(
      # --- V8: linking / embedding ---------------------------------------
      'v8_monolithic=true'                    # single V8 archive instead of many targets
      'v8_monolithic_for_shared_library=true' # PIC + visibility suitable for linking into a .so
      'v8_use_external_startup_data=false'    # embed the snapshot; a library can't ship loose .bin files

      # --- V8: ICU / i18n ------------------------------------------------
      # V8's own Intl is not needed for PDF JavaScript. (The system ICU in
      # _system_libs is for pdfium itself.)
      'v8_depend_on_icu_data_file=false'
      'v8_enable_i18n_support=false'

      # --- V8: disabled features -----------------------------------------
      'v8_enable_sandbox=false'               # PDFium's upstream configuration disables it
      'v8_enable_test_features=false'

      # Temporal is a Rust crate that really is compiled; PDF JavaScript
      # has no use for it, and we never build Rust.
      'v8_enable_temporal_support=false'
      'v8_enable_webassembly=false'           # PDF JavaScript does not require WebAssembly
      'v8_use_metagen_instance_types=false'

      # --- V8: tracing / profiling ---------------------------------------
      'v8_use_perfetto=false'                 # V8's Perfetto integration
    )
    # Jitless: interpreter only. No writable+executable pages, which suits a
    # library loaded into arbitrary host processes, and PDF scripts are tiny.
    if (( _is_jitless )); then
      _flags+=(
        'v8_enable_maglev=false'
        'v8_enable_sparkplug=false'
        'v8_enable_turbofan=false'
        'v8_jitless=true'
      )
    fi
  fi

  gn gen out/Release \
    --root-target=//third_party/pdfium \
    --args="${_flags[*]}"

  ninja -C out/Release third_party/pdfium:pdfium_shared
}

check() {
  cd "chromium-${pkgver}/out/Release"

  # The C API must be exported (FPDF_EXPORT visibility) ...
  nm -D --defined-only libpdfium.so | grep -q ' T FPDF_InitLibraryWithConfig$'
  nm -D --defined-only libpdfium.so | grep -q ' T FPDF_LoadMemDocument$'

  # ... and, in the default configuration, nothing JS-related may be linked in.
  if (( ! _enable_js )) && readelf -d libpdfium.so | grep -qi 'v8'; then
    echo 'libpdfium.so unexpectedly links V8' >&2
    return 1
  fi
}

package() {
  cd "chromium-${pkgver}"

  install -Dm755 out/Release/libpdfium.so \
    -t "${pkgdir}/usr/lib"

  # Public headers use both "fpdfview.h" and "public/fpdfview.h" styles, so
  # install them under public/ and expose both include roots via pkg-config.
  install -dm755 "${pkgdir}/usr/include/${pkgname}/public/cpp"
  install -Dm644 third_party/pdfium/public/*.h \
    -t "${pkgdir}/usr/include/${pkgname}/public/"
  install -Dm644 third_party/pdfium/public/cpp/*.h \
    -t "${pkgdir}/usr/include/${pkgname}/public/cpp/"

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/pkgconfig/${pkgname}.pc" <<EOF
prefix=/usr
libdir=\${prefix}/lib
includedir=\${prefix}/include/${pkgname}

Name: ${pkgname}
Description: PDF rendering library
Version: ${pkgver}
Libs: -L\${libdir} -lpdfium
Cflags: -I\${includedir} -I\${includedir}/public
EOF

  install -Dm644 third_party/pdfium/third_party/agg23/copying \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/agg23"

  if (( _enable_js )); then
    install -Dm644 v8/LICENSE.v8 \
      -t "${pkgdir}/usr/share/licenses/${pkgname}/v8"

    # Original, unmodified
    install -Dm644 third_party/libc++/src/LICENSE.TXT \
      -t "${pkgdir}/usr/share/licenses/${pkgname}/libc++"

    # Apache-2.0 with LLVM exceptions: between the 2nd and 3rd "=====" rules
    awk '/^=+$/ { n++; if (n == 3) exit; next } n >= 2' \
      third_party/libc++/src/LICENSE.TXT \
      > "${srcdir}/LICENSE.Apache-2.0-with-LLVM-exception"

    # University of Illinois/NCSA: from its title up to the next "=====" rule
    awk '/^University of Illinois\/NCSA$/ { p = 1 } p && /^=+$/ { exit } p' \
      third_party/libc++/src/LICENSE.TXT \
      > "${srcdir}/LICENSE.NCSA"

    # MIT: from its copyright line to end of file
    awk '/^Copyright \(c\) 2009-2014 by the contributors/ { p = 1 } p' \
      third_party/libc++/src/LICENSE.TXT \
      > "${srcdir}/LICENSE.MIT"

    install -Dm644 "${srcdir}/LICENSE.Apache-2.0-with-LLVM-exception" \
      -t "${pkgdir}/usr/share/licenses/${pkgname}/libc++"
    install -Dm644 "${srcdir}/LICENSE.NCSA" \
      -t "${pkgdir}/usr/share/licenses/${pkgname}/libc++"
    install -Dm644 "${srcdir}/LICENSE.MIT" \
      -t "${pkgdir}/usr/share/licenses/${pkgname}/libc++"
  fi
}
