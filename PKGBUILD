# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium
pkgver=139.0.7258.66
pkgrel=3
_launcher_ver=8
_manual_clone=0
_system_clang=1
_use_chromium_src=1  # Use official chromium source checkout
_chromium_upstream_src="$HOME/omarchy-chromium-src"  # Path to chromium checkout (change to your path)
_skip_build=0  # Set to 1 to skip build (for packaging pre-built binaries)
pkgdesc="A web browser built for speed, simplicity, and security, with patches for Omarchy"
arch=('x86_64')
url="https://www.chromium.org/Home"
license=('BSD-3-Clause')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python' 'gn' 'ninja' 'clang' 'lld' 'gperf' 'nodejs' 'pipewire'
             'rust' 'rust-bindgen' 'qt6-base' 'java-runtime-headless'
             'git')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'upower: Battery Status API support')
options=('!lto') # Chromium adds its own flags for ThinLTO

# NEW: Conditional source handling
if (( _use_chromium_src )); then
  # Only need launcher when using existing chromium source
  source=(https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz)
  sha256sums=('213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a')
else
  source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver-lite.tar.xz
          https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz
          chromium-138-nodejs-version-check.patch
          compiler-rt-adjust-paths.patch
          increase-fortify-level.patch
          use-oauth2-client-switches-as-default.patch)
  sha256sums=('8cd37b224dba4fc5e3c8ac98cc278d17a713a3b5a2f1dbb241ad94caca83d630'
              '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a'
              '11a96ffa21448ec4c63dd5c8d6795a1998d8e5cd5a689d91aea4d2bdd13fb06e'
              'a6507371588ed4d87d6501220249264abfbcd814771cc1ba351e0ac6cc987400'
              'd634d2ce1fc63da7ac41f432b1e84c59b7cceabf19d510848a7cff40c8025342'
              'e6da901e4d0860058dc2f90c6bbcdc38a0cf4b0a69122000f62204f24fa7e374')
fi

if (( _manual_clone )); then
  source[0]=fetch-chromium-release
  makedepends+=('python-httplib2' 'python-pyparsing' 'python-six' 'npm' 'rsync')
fi

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [brotli]=brotli
  #[dav1d]=dav1d
  #[ffmpeg]=ffmpeg    # YouTube playback stopped working in Chromium 120
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  #[icu]=icu
  #[jsoncpp]=jsoncpp  # needs libstdc++
  #[libaom]=aom
  #[libavif]=libavif  # needs -DAVIF_ENABLE_EXPERIMENTAL_GAIN_MAP=ON
  [libjpeg]=libjpeg-turbo
  [libpng]=libpng
  #[libvpx]=libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  #[re2]=re2          # needs libstdc++
  #[snappy]=snappy    # needs libstdc++
  #[woff2]=woff2      # needs libstdc++
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
#
# Starting with Chromium 89 (2021-03-02) the OAuth2 credentials have been left
# out: https://archlinux.org/news/chromium-losing-sync-support-in-early-march/
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  # Handle official chromium source checkout
  if (( _use_chromium_src )); then
    echo "Using official Chromium source checkout at $_chromium_upstream_src"
    
    # Skip prepare if we're just packaging pre-built binaries
    if (( _skip_build )); then
      echo "Skipping source preparation (using pre-built binaries)"
      # Create symlink for compatibility with package()
      ln -sf "$_chromium_upstream_src/src" "$srcdir/chromium-$pkgver"
      return 0
    fi
    
    # Setup depot_tools if not already in PATH
    if ! command -v fetch &> /dev/null; then
      if [[ ! -d "$HOME/depot_tools" ]]; then
        echo "Cloning depot_tools..."
        git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git "$HOME/depot_tools"
      fi
      export PATH="$HOME/depot_tools:$PATH"
    fi
    
    # Check if checkout exists
    if [[ -d "$_chromium_upstream_src/src" ]]; then
      echo "Chromium checkout already exists at $_chromium_upstream_src/src, keeping it untouched"
      cd "$_chromium_upstream_src"
      
      # Update .gclient to include PGO profiles
      echo "Updating .gclient to include PGO profiles..."
      cat > .gclient <<EOF
solutions = [
  {
    "name": "src",
    "url": "https://chromium.googlesource.com/chromium/src.git",
    "managed": False,
    "custom_deps": {},
    "custom_vars": {
      "checkout_pgo_profiles": True,
    },
  },
]
EOF
      
      cd src
      
      # Optimize git for massive repos
      echo "Optimizing git for large repository..."
      git config core.deltaBaseCacheLimit 2g
      git config pack.windowMemory 2g
      git config pack.packSizeLimit 2g
      git config http.postBuffer 1048576000
      git config core.bigFileThreshold 512m
      git config core.compression 0
      git config core.looseCompression 0
      git config pack.compression 0
      git config pack.threads 0
      git config index.threads true
      git config fetch.unpackLimit 1
      git config fetch.writeCommitGraph false
      git config receive.unpackLimit 1
      git config feature.manyFiles true
      
      # Simple checkout - already have the tag
      echo "Checking out version $pkgver..."
      git checkout -f "$pkgver"
      
      # Only sync dependencies, not the main src repo
      echo "Syncing dependencies..."
      cd "$_chromium_upstream_src"
      gclient sync --nohooks --no-history --shallow --delete_unversioned_trees
      
      cd src
      echo "Running gclient runhooks..."
      gclient runhooks
      
    else
      # Fresh checkout needed
      echo "Creating new Chromium checkout at $_chromium_upstream_src"
      mkdir -p "$_chromium_upstream_src"
      cd "$_chromium_upstream_src"
      
      echo "Fetching chromium (this will take a while)..."
      fetch --nohooks chromium
      
      # Update .gclient to include PGO profiles
      echo "Updating .gclient to include PGO profiles..."
      cat > .gclient <<EOF
solutions = [
  {
    "name": "src",
    "url": "https://chromium.googlesource.com/chromium/src.git",
    "managed": False,
    "custom_deps": {},
    "custom_vars": {
      "checkout_pgo_profiles": True,
    },
  },
]
EOF
      
      cd src
      
      # Optimize git for massive repos
      echo "Optimizing git for large repository..."
      git config core.deltaBaseCacheLimit 2g
      git config pack.windowMemory 2g
      git config pack.packSizeLimit 2g
      git config http.postBuffer 1048576000
      git config core.bigFileThreshold 512m
      git config core.compression 0
      git config core.looseCompression 0
      git config pack.compression 0
      git config pack.threads 0
      git config index.threads true
      git config fetch.unpackLimit 1
      git config fetch.writeCommitGraph false
      git config receive.unpackLimit 1
      git config feature.manyFiles true
      
      # Checkout the specific version
      echo "Checking out version $pkgver..."
      git checkout -f "$pkgver"
      
      # Sync dependencies
      echo "Syncing dependencies..."
      cd "$_chromium_upstream_src"
      gclient sync --nohooks --no-history --shallow --delete_unversioned_trees
      
      cd src
      echo "Running gclient runhooks..."
      gclient runhooks
    fi
    
    # Fix partition_alloc include path issue
    echo "Creating partition_alloc symlink..."
    ln -sf base/allocator/partition_allocator/src/partition_alloc partition_alloc
    
    # Generate build files if not already present
    if [[ ! -d "out/Release" ]]; then
      echo "Generating build configuration..."
      mkdir -p out/Release
      
      # Copy over the args.gn file
      if [[ -f "$srcdir/../chromium.args.gn" ]]; then
        cp "$srcdir/../chromium.args.gn" out/Release/args.gn
      else
        echo "ERROR: chromium.args.gn not found in package directory"
        exit 1
      fi
      
      gn gen out/Release
    fi
    
    # Apply patches to the upstream source
    echo "Applying patches..."
    for patch in "$srcdir"/../*.patch; do
      if [[ -f "$patch" ]]; then
        # Skip patches that are incompatible with bundled toolchain
        case "$(basename "$patch")" in
          "compiler-rt-adjust-paths.patch")
            echo "Skipping $(basename "$patch") (incompatible with bundled toolchain)"
            continue
            ;;
          "chromium-138-nodejs-version-check.patch")
            echo "Skipping $(basename "$patch") (bundled Node.js doesn't need version check)"
            continue
            ;;
          "increase-fortify-level.patch")
            echo "Skipping $(basename "$patch") (causes FORTIFY_SOURCE conflicts with bundled build)"
            continue
            ;;
        esac
        echo "Applying $(basename "$patch")..."
        patch -Np1 -i "$patch" || true  # Continue even if patch fails (might be already applied)
      fi
    done
    
    # Create symlink for compatibility with rest of PKGBUILD
    ln -sf "$_chromium_upstream_src/src" "$srcdir/chromium-$pkgver"
    return 0
  fi

  if (( _manual_clone )); then
    ./fetch-chromium-release $pkgver
  fi
  cd chromium-$pkgver

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
         -e '1i #include <cstdlib>' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc

  # Use the --oauth2-client-id= and --oauth2-client-secret= switches for
  # setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
  # runtime -- this allows signing into Chromium without baked-in values
  patch -Np1 -i ../use-oauth2-client-switches-as-default.patch

  # Upstream fixes

  # Fixes from Gentoo
  patch -Np1 -i ../chromium-138-nodejs-version-check.patch

  # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
  patch -Np1 -i ../compiler-rt-adjust-paths.patch

  # Increase _FORTIFY_SOURCE level to match Arch's default flags
  patch -Np1 -i ../increase-fortify-level.patch

  # Add theme command-line switches support
  patch -Np1 -i ../omarchy-theme-switcher.patch

  # Fixes for building with libstdc++ instead of libc++

  # Link to system tools required by the build
  if (( ! _manual_clone )); then
    mkdir third_party/node/linux/node-linux-x64/bin
    ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  fi
  ln -s /usr/bin/java third_party/jdk/current/bin/

  if (( !_system_clang )); then
    # Use prebuilt rust as system rust cannot be used due to the error:
    #   error: the option `Z` is only accepted on the nightly compiler
    ./tools/rust/update_rust.py

    # To link to rust libraries we need to compile with prebuilt clang
    ./tools/clang/scripts/update.py
  fi

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  # Handle official chromium source build
  if (( _use_chromium_src )); then
    if (( _skip_build )); then
      echo "Skipping Chromium build (using pre-built binaries from $_chromium_upstream_src/src)"
    else
      echo "Building from official Chromium source at $_chromium_upstream_src/src"
      
      # Setup depot_tools if not already in PATH
      if ! command -v autoninja &> /dev/null; then
        export PATH="$HOME/depot_tools:$PATH"
      fi
      
      cd "$_chromium_upstream_src/src"
      
      # Build with ninja
      echo "Building Chromium (this will take a while)..."
      export NINJA_STATUS="[%f/%t (%p%%) %o/s %es] " 
      autoninja -C out/Release chrome chrome_sandbox chromedriver.unstripped
    fi
    
    # Always build the launcher
    cd "$srcdir"
    make -C chromium-launcher-$_launcher_ver
    return 0
  fi

  make -C chromium-launcher-$_launcher_ver

  cd chromium-$pkgver

  if (( _system_clang )); then
    export CC=clang
    export CXX=clang++
    export AR=ar
    export NM=nm
  else
    local _clang_path="$PWD/third_party/llvm-build/Release+Asserts/bin"
    export CC=$_clang_path/clang
    export CXX=$_clang_path/clang++
    export AR=$_clang_path/llvm-ar
    export NM=$_clang_path/llvm-nm
  fi

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'treat_warnings_as_errors=false'
    'fatal_linker_warnings=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=true' # https://github.com/llvm/llvm-project/issues/61705
    'use_sysroot=false'
    'use_system_libffi=true'
    'enable_hangout_services_extension=true'
    'enable_widevine=true'
    'enable_nacl=false'
    'use_qt5=false'
    'use_qt6=true'
    'moc_qt6_path="/usr/lib/qt6"'
    "google_api_key=\"$_google_api_key\""
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  if (( _system_clang )); then
     local _clang_version=$(
       clang --version | grep -m1 version | sed 's/.* \([0-9]\+\).*/\1/')

    _flags+=(
      'clang_base_path="/usr"'
      'clang_use_chrome_plugins=false'
      "clang_version=\"$_clang_version\""
      #'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
    )

    # Allow the use of nightly features with stable Rust compiler
    # https://github.com/ungoogled-software/ungoogled-chromium/pull/2696#issuecomment-1918173198
    export RUSTC_BOOTSTRAP=1

    _flags+=(
      'rust_sysroot_absolute="/usr"'
      'rust_bindgen_root="/usr"'
      "rustc_version=\"$(rustc --version)\""
    )
  fi

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

  gn gen out/Release --args="${_flags[*]}"
  ninja -C out/Release chrome chrome_sandbox chromedriver.unstripped
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  # Handle different source locations
  if (( _use_chromium_src )); then
    cd "$_chromium_upstream_src/src"
  else
    cd ../chromium-$pkgver
  fi

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -D out/Release/chromedriver.unstripped "$pkgdir/usr/bin/chromedriver"
  install -Dm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/chromium/chrome-sandbox"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/chromium.desktop"
  install -Dm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/chromium.1"
  sed -i \
    -e 's/@@MENUNAME@@/Chromium/g' \
    -e 's/@@PACKAGE@@/chromium/g' \
    -e 's/@@USR_BIN_SYMLINK_NAME@@/chromium/g' \
    "$pkgdir/usr/share/applications/chromium.desktop" \
    "$pkgdir/usr/share/man/man1/chromium.1"

  # Fill in common Chrome/Chromium AppData template with Chromium info
  (
    tmpl_file=chrome/installer/linux/common/appdata.xml.template
    info_file=chrome/installer/linux/common/chromium-browser.info
    . $info_file; PACKAGE=chromium
    export $(grep -o '^[A-Z_]*' $info_file)
    sed -E -e 's/@@([A-Z_]*)@@/\${\1}/g' -e '/<update_contact>/d' $tmpl_file | envsubst
  ) \
  | install -Dm644 /dev/stdin "$pkgdir/usr/share/metainfo/chromium.appdata.xml"

  local toplevel_files=(
    chrome_100_percent.pak
    chrome_200_percent.pak
    chrome_crashpad_handler
    libqt6_shim.so
    resources.pak
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
    toplevel_files+=(icudtl.dat)
  fi

  cp "${toplevel_files[@]/#/out/Release/}" "$pkgdir/usr/lib/chromium/"
  install -Dm644 -t "$pkgdir/usr/lib/chromium/locales" out/Release/locales/*.pak

  for size in 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
