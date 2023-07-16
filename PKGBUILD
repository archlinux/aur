# Maintainer: Martin Rodriguez Reboredo <yakoyoku@gmail.com>

pkgname=cef
pkgver=115.3.8
pkgrel=1
pkgdesc='A simple framework for embedding Chromium-based browsers in other applications.'
arch=(x86_64)
url='https://bitbucket.org/chromiumembedded/cef'
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python-protobuf' 'gn' 'ninja' 'clang' 'lld' 'gperf' 'npm' 'pipewire'
             'java-runtime-headless' 'git' 'jq')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'org.freedesktop.secrets: password storage backend')
provides=(cef-minimal)
conflicts=(cef-minimal)
_chromium_ver=115.0.5790.40
_cef_commit=75c3bf048030d8541ff266d87f01303cdc453dfa
_gcc_patchset=2
source=("cef::git+https://bitbucket.org/chromiumembedded/cef#commit=$_cef_commit"
        "chromium-mirror::git+https://github.com/chromium/chromium.git#tag=$_chromium_ver"
        'depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git'
        "https://github.com/stha09/chromium-patches/releases/download/chromium-${pkgver%%.*}-patchset-$_gcc_patchset/chromium-${pkgver%%.*}-patchset-$_gcc_patchset.tar.xz"
        cef-cmake-options.patch
        missing-cef-includes.patch
        missing-typename-interactive_test_internal.patch
        remove-libxml-visibility.patch
        system-fontconfig-cache-version.patch)
_arch_revision=c073b0c20935d7eb452732e0f3b2860a96c3db21
_patches=(REVERT-disable-autoupgrading-debug-info.patch
          random-build-fixes.patch)
for _patch in "${_patches[@]}"; do
  source+=("https://gitlab.archlinux.org/archlinux/packaging/packages/chromium/-/raw/$_arch_revision/$_patch")
done
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '4f91bd10a8ae2aa7b040a8b27e01f38910ad33cbe179e39a1ae550c9c1523384'
            '73d2340473850f6a03ed29f18511af6d430b73b492f9db6ea4185eae923b17d5'
            '1474bf1a2d313541960fd79b9432d977d39458b699f14a4cd7d7dae608c7dbbc'
            'defefd3073c66387ff4db10e54255097e27ee8f697d75106c5451d511840d5be'
            '160ef9ce6ee33a86056fd1b373d5c774eaeaa740bad2e692b1846c807d15f970'
            '22c92d9ff32b25e9d3439710bb455f843d2f55bfeeb4fe1a13d23a1ead5e2227'
            '641f13b170044d25bd5586199f631322634d640bf72920e1487cab7334879679'
            '1b782b0f6d4f645e4e0daa8a4852d63f0c972aa0473319216ff04613a0592a69'
            'fd472e8c2a68b2d13ce6cab1db99818d7043e49cecf807bf0c5fc931f0c036a3')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [brotli]=brotli
  [dav1d]=dav1d
  [ffmpeg]=ffmpeg
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [jsoncpp]=jsoncpp
  #[libaom]=aom      # https://aomedia.googlesource.com/aom/+/706ee36dcc82
  #[libavif]=libavif # https://github.com/AOMediaCodec/libavif/commit/4d2776a3
  [libdrm]=
  [libjpeg]=libjpeg
  [libpng]=libpng
  #[libvpx]=libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [woff2]=woff2
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  "$(printf "%s\n" "${!_system_libs[@]}" | sed 's/^libjpeg$/&_turbo/')"
)
depends+=(${_system_libs[@]})

prepare() {
  ln -sf chromium-mirror src

  export PATH="${PATH}:${srcdir:?}/depot_tools"

  echo "Prepare the environment..."

  echo "solutions = [
  {
    \"name\": \"src\",
    \"url\": \"file://${srcdir}/chromium@${_chromium_ver}\",
    \"managed\": False,
    \"custom_deps\": {},
    \"custom_vars\": {},
  },
  {
    \"name\": \"src/cef\",
    \"url\": \"file://${srcdir}/cef@${_cef_commit}\",
    \"deps_file\": \"DEPS\",
    \"managed\": False,
    \"custom_deps\": {
      \"src\": None,
    },
    \"custom_vars\": {},
  },
]" > .gclient

  python "${srcdir}/depot_tools/gclient.py" sync \
      --with_branch_heads \
      --with_tags \
      --force \
      --delete_unversioned_trees \
      --nohooks

  echo "Running hooks..."
  # python "${srcdir}/depot_tools/gclient.py" runhooks
  src/build/landmines.py
  src/build/util/lastchange.py -o src/build/util/LASTCHANGE
  src/build/util/lastchange.py -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  src/build/util/lastchange.py -s src/third_party/dawn \
    --revision src/gpu/webgpu/DAWN_VERSION
  # Create sysmlink to system clang-format
  ln -sf /usr/bin/clang-format src/buildtools/linux64
  # Test fonts are unavoidable
  src/third_party/depot_tools/download_from_google_storage.py \
    --no_resume --extract --no_auth --bucket chromium-fonts \
    -s src/third_party/test_fonts/test_fonts.tar.gz.sha1
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  src/third_party/depot_tools/download_from_google_storage.py \
    --no_resume --extract --no_auth --bucket chromium-nodejs \
    -s src/third_party/node/node_modules.tar.gz.sha1
  python src/tools/download_optimization_profile.py \
    --newest_state=src/chrome/android/profiles/newest.txt \
    --local_state=src/chrome/android/profiles/local.txt \
    --output_name=src/chrome/android/profiles/afdo.prof \
    --gs_url_base=chromeos-prebuilt/afdo-job/llvm
  mkdir -p src/third_party/jdk/current/bin
  ln -sf /usr/bin/java src/third_party/jdk/current/bin

  # CEF specific hooks
  # python src/cef/tools/gclient_hook.py
  cd src/cef || exit
  python tools/make_version_header.py include/cef_version.h
  python tools/patcher.py
  cd ../..

  echo "Apply Chromium patches..."
  cd src || exit

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc \
    third_party/maldoca/src/maldoca/ole/oss_utils.h

  # Use the --oauth2-client-id= and --oauth2-client-secret= switches for
  # setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
  # runtime -- this allows signing into Chromium without baked-in values
  patch -Np1 -i "${srcdir}/use-oauth2-client-switches-as-default.patch"

  # Upstream fixes

  # Revert addition of compiler flag that needs newer clang
  patch -Rp1 -i "${srcdir}/REVERT-disable-autoupgrading-debug-info.patch"

  # Build fixes
  patch -Np1 -i "${srcdir}/random-build-fixes.patch"
  patch -Np1 -i "${srcdir}/missing-typename-interactive_test_internal.patch"

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i "${srcdir}/patches/chromium-114-ruy-include.patch"
  patch -Np1 -i "${srcdir}/patches/chromium-114-tflite-include.patch"
  patch -Np1 -i "${srcdir}/patches/chromium-114-vk_mem_alloc-include.patch"
  patch -Np1 -i "${srcdir}/patches/chromium-115-skia-include.patch"
  patch -Np1 -i "${srcdir}/patches/chromium-114-maldoca-include.patch"
  patch -Np1 -i "${srcdir}/patches/chromium-115-verify_name_match-include.patch"

  # Use system fontconfig's cache number
  patch -Np1 -i "${srcdir}/system-fontconfig-cache-version.patch"

  # Hacky patching
  sed -e 's/\(enable_distro_version_check =\) true/\1 false/g' -i chrome/installer/linux/BUILD.gn

  # CEF specific patches
  cd cef || exit
  patch -Np1 -i "${srcdir}/cef-cmake-options.patch"
  patch -Np1 -i "${srcdir}/remove-libxml-visibility.patch"
  patch -Np1 -i "${srcdir}/missing-cef-includes.patch"
  rm -f patch/patches/libxml_visibility.patch
  cd ..

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries and
  # preserving their git directories
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
      \! -regex '.*\.\(git.*\|gn\|gni\|isolate\)' \
      -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
  fi

  export PATH="${PATH}:${srcdir:?}/depot_tools"

  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export NM=llvm-nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'blink_symbol_level=0'
    'v8_symbol_level=0'
    'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
    # 'is_cfi=false' # not convenient for the obs-browser plugin
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'use_system_libffi=true'
    'use_custom_libcxx=false'
    'enable_background_mode=false' # recommended by CEF
    'enable_backup_ref_ptr_support=false' # avoids segfaults with libcef initializations
    'enable_hangout_services_extension=true'
    'enable_widevine=true'
    'enable_nacl=false'
    'enable_rust=false'
    'use_partition_alloc_as_malloc=false' # avoids segfaults with libcef initializations
    'use_perfetto_client_library=false' # recommended by CEF
    'use_qt=false'
    'v8_enable_sandbox=false'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  OLDCFLAGS="${CFLAGS}"
  OLDCXXFLAGS="${CXXFLAGS}"

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  # Let Chromium set its own symbol level
  CFLAGS=${CFLAGS/-g }
  CXXFLAGS=${CXXFLAGS/-g }

  # https://github.com/ungoogled-software/ungoogled-chromium-archlinux/issues/123
  CFLAGS=${CFLAGS/-fexceptions}
  CFLAGS=${CFLAGS/-fcf-protection}
  CXXFLAGS=${CXXFLAGS/-fexceptions}
  CXXFLAGS=${CXXFLAGS/-fcf-protection}

  # This appears to cause random segfaults when combined with ThinLTO
  # https://bugs.archlinux.org/task/73518
  CFLAGS=${CFLAGS/-fstack-clash-protection}
  CXXFLAGS=${CXXFLAGS/-fstack-clash-protection}

  # https://crbug.com/957519#c122
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  cd src || exit

  gn gen out/Release_GN_x64 --args="${_flags[*]}"
  ninja -C out/Release_GN_x64 libcef chrome_crashpad_handler chrome_sandbox chromedriver.unstripped

  cd cef || exit

  CFLAGS="${OLDCFLAGS}"
  CXXFLAGS="${OLDCXXFLAGS}"

  python tools/make_cmake.py CMakeLists.txt.in CMakeLists.txt
  python tools/make_cmake.py libcef_dll/CMakeLists.txt.in libcef_dll/CMakeLists.txt
  python tools/make_cmake.py tests/cefclient/CMakeLists.txt.in tests/cefclient/CMakeLists.txt
  python tools/make_cmake.py tests/cefsimple/CMakeLists.txt.in tests/cefsimple/CMakeLists.txt
  python tools/make_cmake.py cmake/FindCEF.cmake.in cmake/FindCEF.cmake
  python tools/make_cmake.py cmake/cef_macros.cmake.in cmake/cef_macros.cmake
  python tools/make_cmake.py cmake/cef_variables.cmake.in cmake/cef_variables.cmake
  sed -i 's/-Werror/#-Werror/g' cmake/cef_variables.cmake

  cp ../out/Release_GN_x64/includes/include/cef_*.h include
  cp ../net/base/net_error_list.h include/base/internal/cef_net_error_list.h

  # We are forced to use GCC as Clang produces malformed binaries that segfault easily.
  cmake . -B build \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_C_COMPILER=/usr/bin/gcc \
    -DCMAKE_CXX_COMPILER=/usr/bin/g++

  make -C build cefclient cefsimple libcef_dll_wrapper
}

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname/"{Resources,Release}

  # Copy necessary release files

  install -Dm755 src/out/Release_GN_x64/chromedriver.unstripped "$pkgdir/usr/bin/cefdriver"
  install -Dm4755 src/out/Release_GN_x64/chrome_sandbox "$pkgdir/usr/lib/$pkgname/Release/chrome-sandbox"

  local resources_files=(
    chrome_100_percent.pak
    chrome_200_percent.pak
    resources.pak
  )

  local release_files=(
    libcef.so

    # Chromium
    chrome_crashpad_handler
    snapshot_blob.bin
    v8_context_snapshot.bin

    # ANGLE
    libEGL.so
    libGLESv2.so

    # SwiftShader ICD
    libvk_swiftshader.so
    libvulkan.so.1
    vk_swiftshader_icd.json
  )

  if [[ -z ${_system_libs[icu]+set} ]]; then
    resources_files+=(icudtl.dat)
  fi

  install -Dm644 "${resources_files[@]/#/src/out/Release_GN_x64/}" "$pkgdir/usr/lib/$pkgname/Resources"
  install -Dm755 "${release_files[@]/#/src/out/Release_GN_x64/}" "$pkgdir/usr/lib/$pkgname/Release"
  cp -r src/cef/include "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 src/cef/CMakeLists.txt "$pkgdir/usr/lib/$pkgname"
  install -Dm644 -t "$pkgdir/usr/lib/$pkgname/build/libcef_dll_wrapper" src/cef/build/libcef_dll_wrapper/libcef_dll_wrapper.a
  install -Dm644 -t "$pkgdir/usr/lib/$pkgname/cmake" src/cef/cmake/*.cmake
  install -Dm644 -t "$pkgdir/usr/lib/$pkgname/include" src/out/Release_GN_x64/includes/include/cef_*.h
  install -Dm644 -t "$pkgdir/usr/lib/$pkgname/Resources/locales" src/out/Release_GN_x64/locales/*.pak

  install -Dm0644 src/cef/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
