# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>
# Contributor: Nagisa <simonas@kazlauskas.me>
# Contributor: Misc <andreas.reis@gmail.com>
# Contributor: Jeagoss <jgoliver@jeago.com>
# Contributor: Saikrishna Arcot <saiarcot895@gmail.com> and Steven Newbury <steve@snewbury.org.uk> (Authors of VAAPI patch)

#########################
## -- Build options -- ##
#########################

_use_clang=1     # Use clang compiler (downloaded binaries from google). Results in faster build and smaller chromium.
_use_ccache=0    # Use ccache when build.
_debug_mode=0    # Build in debug mode.
_enable_vaapi=0  # Patch for VAAPI HW acceleration NOTE: don't work in some graphic cards, for example, NVIDIA

##############################################
## -- Package and components information -- ##
##############################################
pkgname=chromium-dev
pkgver=61.0.3135.4
_launcher_ver=3
pkgrel=1
pkgdesc="The open-source project behind Google Chrome (Dev Channel)"
arch=('i686' 'x86_64')
url='http://www.chromium.org'
license=('BSD')
depends=(
#          'libsrtp'
         'libxslt'
         'libxss'
         'minizip'
         'perl-file-basedir'
         'nss'
         'pciutils'
         're2'
         'snappy'
         'xdg-utils'
         'libcups'
         'harfbuzz-icu'
#          'protobuf'
#          'libevent'
         'ffmpeg'
#          'icu'    # https://crbug.com/678661
         'gtk3'
         'openh264'
         )
makedepends=('libexif'
             'gperf'
             'ninja'
             'python2-beautifulsoup4'
             'python2-html5lib'
             'python2-simplejson'
             'python2-six'
             'subversion'
             'yasm'
             'git'
             'imagemagick'
             'hwids'
             'nodejs'
             'wget'
             'sandbox'
             )
optdepends=('libva-vdpau-driver-chromium: HW video acceleration for NVIDIA users'
            'libva-mesa-driver: HW video acceleration for Nouveau, R600 and RadeonSI users'
            'libva-intel-driver: HW video acceleration for Intel users'
            #
            'pepper-flash: PPAPI Flash Player'
            'chromium-widevine-dev: Widevine plugin (eg: Netflix) (Dev Channel)'
            #
            'kdialog: Needed for file dialogs in KF5'
            'kwalletmanager: Needed for storing passwords in KWallet'
            #
            'ttf-font: For some typography'
            #
            'libappindicator-gtk3: Needed for show systray icon in the panel'
            )
source=( #"https://gsdview.appspot.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
        "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
        "git+https://github.com/foutrelis/chromium-launcher.git#tag=v${_launcher_ver}"
        'git+https://github.com/mattn/go-shellwords.git'
        'chromium-dev.svg'
        'BUILD.gn'
        # Patch form Gentoo
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-FORTIFY_SOURCE-r2.patch'
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-gn-bootstrap-r10.patch'
        # Misc Patches
        'minizip.patch'
        'vaapi_patch_r2.patch'
        # Patch from crbug (chromium bugtracker)
        'chromium-widevine-r1.patch'
        )
sha256sums=( #"$(curl -sL https://gsdview.appspot.com/chromium-browser-official/chromium-55.0.2873.0.tar.xz.hashes | grep sha256 | cut -d ' ' -f3)"
            "$(curl -sL https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz.hashes | grep sha256 | cut -d ' ' -f3)"
            'SKIP'
            'SKIP'
            'dd2b5c4191e468972b5ea8ddb4fa2e2fa3c2c94c79fc06645d0efc0e63ce7ee1'
            '07df380530299b0450045edd655f924f0e0442abccb05c2336ed2aea9d5ee044'
            # Patch form Gentoo
            'fa3f703d599051135c5be24b81dfcb23190bb282db73121337ac76bc9638e8a5'
            '648dae208ef1968ae686d42a2ad51909df21e6080e508c8b357410642cbbf35f'
            # Misc Patches
            '95ba939b9372e533ecbcc9ca034f3e9fc6621d3bddabb57c4d092ea69fa6c840'
            '4ec8b2df4859b9d26b8ea4afc205f563f59844c54a6659bb279776b93163a0ce'
            # Patch from crbug (chromium bugtracker)
            '0d537830944814fe0854f834b5dc41dc5fc2428f77b2ad61d4a5e76b0fe99880'
            )
options=('!strip')
install=chromium-dev.install

################################################
## -- Don't touch anything below this line -- ##
################################################

# Build Debug mode?.
if [ "${_debug_mode}" = "1" ]; then
  _debug_flag="symbol_level=1"
  _strip=false
elif [ "${_debug_mode}" = "0" ]; then
  _strip=true
fi

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# NOTE: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key="AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM"
_google_default_client_id="413772536636.apps.googleusercontent.com"
_google_default_client_secret="0ZChLK6AxeA3Isu96MkwqDR4"

# Build NaCL?. disabled if detect 32bit system
if [ "${CARCH}" = "i686" ]; then
  _build_nacl=0
  _nacl="false"
elif [ "${CARCH}" = "x86_64" ]; then
  _build_nacl=1
  _nacl="true"
  makedepends+=('ncurses5-compat-libs')
fi

# Need you use ccache?.
if [ "${_use_ccache}" = "1" ]; then
  makedepends+=('ccache')
  export CCACHE_CPP2=yes
  export CCACHE_SLOPPINESS=time_macros
  _ccache='ccache'
fi

# Are you use gnome-keyring/gnome?.
_gnome_keyring=false
if [ -e /usr/lib/libgnome-keyring.so.0 ]; then
  depends+=('libgnome-keyring')
  _gnome_keyring=true
fi

# List of third-party components needed for build chromium. The rest is remove by remove_bundled_libraries srcipt in prepare().
_keeplibs=(
  'base/third_party/dmg_fp'
  'base/third_party/dynamic_annotations'
  'base/third_party/icu'
  'base/third_party/nspr'
  'base/third_party/superfasthash'
  'base/third_party/symbolize'
  'base/third_party/valgrind'
  'base/third_party/xdg_mime'
  'base/third_party/xdg_user_dirs'
  'breakpad/src/third_party/curl'
  'chrome/third_party/mozilla_security_manager'
  'courgette/third_party'
  'native_client/src/third_party/dlmalloc'
  'native_client_sdk/src/libraries/third_party/newlib-extras'
  'net/third_party/mozilla_security_manager'
  'net/third_party/nss'
  'third_party/WebKit'
  'third_party/analytics'
  'third_party/angle'
  'third_party/angle/src/common/third_party/base'
  'third_party/angle/src/common/third_party/murmurhash'
  'third_party/angle/src/third_party/compiler'
  'third_party/angle/src/third_party/libXNVCtrl'
  'third_party/angle/src/third_party/trace_event'
  'third_party/boringssl'
  'third_party/brotli'
  'third_party/cacheinvalidation'
  'third_party/catapult'
  'third_party/catapult/third_party/polymer'
  'third_party/catapult/third_party/py_vulcanize'
  'third_party/catapult/third_party/py_vulcanize/third_party/rcssmin'
  'third_party/catapult/third_party/py_vulcanize/third_party/rjsmin'
  'third_party/catapult/tracing/third_party/d3'
  'third_party/catapult/tracing/third_party/gl-matrix'
  'third_party/catapult/tracing/third_party/jszip'
  'third_party/catapult/tracing/third_party/mannwhitneyu'
  'third_party/catapult/tracing/third_party/oboe'
  'third_party/ced'
  'third_party/cld_2'
  'third_party/cld_3'
  'third_party/cros_system_api'
  'third_party/devscripts'
  'third_party/dom_distiller_js'
  'third_party/fips181'
  'third_party/flatbuffers'
  'third_party/flot'
  'third_party/freetype'
  'third_party/glslang-angle'
  'third_party/google_input_tools'
  'third_party/google_input_tools/third_party/closure_library'
  'third_party/google_input_tools/third_party/closure_library/third_party/closure'
  'third_party/googletest'
  'third_party/hunspell'
  'third_party/iccjpeg'
  'third_party/inspector_protocol'
  'third_party/jinja2'
  'third_party/jstemplate'
  'third_party/khronos'
  'third_party/leveldatabase'
  'third_party/libXNVCtrl'
  'third_party/libaddressinput'
  'third_party/libjingle'
  'third_party/libphonenumber'
  'third_party/libsecret'
  'third_party/libsrtp'
  'third_party/libudev'
  'third_party/libva'
  'third_party/libvpx'
  'third_party/libvpx/source/libvpx/third_party/x86inc'
  'third_party/libwebm'
  'third_party/libyuv'
  'third_party/libxml'
  'third_party/lss'
  'third_party/lzma_sdk'
  'third_party/markupsafe'
  'third_party/mesa'
  'third_party/modp_b64'
  'third_party/mt19937ar'
  'third_party/node'
  'third_party/node/node_modules/vulcanize/third_party/UglifyJS2'
  'third_party/openmax_dl'
  'third_party/ots'
  'third_party/pdfium'
  'third_party/pdfium/third_party/agg23'
  'third_party/pdfium/third_party/base'
  'third_party/pdfium/third_party/build'
  'third_party/pdfium/third_party/bigint'
  'third_party/pdfium/third_party/freetype'
  'third_party/pdfium/third_party/lcms2-2.6'
  'third_party/pdfium/third_party/libopenjpeg20'
  'third_party/pdfium/third_party/libpng16'
  'third_party/pdfium/third_party/libtiff'
  'third_party/ply'
  'third_party/polymer'
  'third_party/protobuf'
  'third_party/protobuf/third_party/six'
  'third_party/qcms'
  'third_party/sfntly'
  'third_party/skia'
  'third_party/skia/third_party/vulkan'
  'third_party/smhasher'
  'third_party/spirv-headers'
  'third_party/spirv-tools-angle'
  'third_party/swiftshader'
  'third_party/swiftshader/third_party/llvm-subzero'
  'third_party/swiftshader/third_party/subzero'
  'third_party/sqlite'
  'third_party/tcmalloc'
  'third_party/usrsctp'
  'third_party/vulkan'
  'third_party/vulkan-validation-layers'
  'third_party/web-animations-js'
  'third_party/webdriver'
  'third_party/webrtc'
  'third_party/widevine'
  'third_party/woff2'
  'third_party/zlib/google'
  'url/third_party/mozilla'
  'v8/src/third_party/valgrind'
  'v8/third_party/inspector_protocol'

  # gyp -> gn leftovers
  'base/third_party/libevent'
  'third_party/adobe'
  'third_party/speech-dispatcher'
  'third_party/usb_ids'
  'third_party/xdg-utils'
  'third_party/yasm/run_yasm.py'
)

# Set build flags.

_flags=(
  'is_debug=false'
  'enable_widevine=true'
  'enable_hangout_services_extension=false'
  "ffmpeg_branding=\"ChromeOS\""
  'proprietary_codecs=true'
  "google_api_key=\"${_google_api_key}\""
  "google_default_client_id=\"${_google_default_client_id}\""
  "google_default_client_secret=\"${_google_default_client_secret}\""
  'fieldtrial_testing_like_official_build=false'
  "remove_webcore_debug_symbols=${_strip}"
  'use_gtk3=true'
  'use_gconf=false'
  "use_gio=false"
  "use_gnome_keyring=${_gnome_keyring}"
  'link_pulseaudio=true'
  'use_sysroot=false'
  'use_gold=false'
  'linux_use_bundled_binutils=false'
  'fatal_linker_warnings=false'
  'treat_warnings_as_errors=false'
  "enable_nacl=${_nacl}"
  "enable_nacl_nonsfi=${_nacl}"
)

# Set the bundled/external components.
# TODO: need ported to GN as GYP doing before. see status page: https://crbug.com/551343

_use_system=(
  'ffmpeg'
  'flac'
#  'freetype'   # https://bugs.chromium.org/p/pdfium/issues/detail?id=733
  'harfbuzz-ng'
#  'hunspell'   # Needs ustream changes
#  'icu'        # https://crbug.com/678661
  'libdrm'
#  'libevent'   # Get segfaults and other problems https://bugs.gentoo.org/593458
  'libjpeg'
  'libpng'
#  'libsrtp'    # https://bugs.gentoo.org/459932
#  'libvpx'     # Needs update
  'libwebp'
#  'libxml'     # https://bugs.gentoo.org/616818
  'libxslt'
  'openh264'
  'opus'
#  'protobuf'   # https://bugs.gentoo.org/525560
  're2'
#  'sqlite'     # https://crbug.com/58087
  'snappy'
#   'ssl'       # https://crbug.com/22208
  'yasm'
  'zlib'
)

# Conditionals.
if [ "${_debug_mode}" = "1" ]; then
  _keeplibs+=(
    'native_client/src/third_party/valgrind'
  )
fi

# https://crbug.com/678661
if [ "${_build_nacl}" = "1" ]; then
  _keeplibs+=(
    'third_party/icu' # https://crbug.com/678661
  )
elif [ "${_build_nacl}" = "0" ]; then
   depends+=('icu')
   _use_system+=('icu')
fi

################################################

prepare() {

  # Use custom toolchain.
  _flags+=(
    "custom_toolchain=\"${srcdir}:default\""
    "host_toolchain=\"${srcdir}:default\""
  )

  # Set Python2 path.
  mkdir -p python-path
  ln -sf /usr/bin/python2 "${srcdir}/python-path/python"
  export PATH="${srcdir}/python-path:$PATH"

  cd "${srcdir}/chromium-launcher"
  git config submodule.vendor/src/github.com/mattn/go-shellwords.url "file:///${srcdir}/go-shellwords"
  git submodule update --init

  cd "${srcdir}/chromium-${pkgver}"

  # Fix to save configuration in ~/.config/chromium-dev.
  sed -e 's|filename = "chromium-browser"|filename = "chromium-dev"|' \
      -e 's|confdir = "chromium"|confdir = "chromium-dev"|' \
      -i chrome/BUILD.gn
  sed -e 's|config_dir.Append("chromium")|config_dir.Append("chromium-dev")|' \
      -i chrome/common/chrome_paths_linux.cc

  msg2 "Patching the sources"
  # Patch sources from Gentoo.
  patch -p1 -i "${srcdir}/chromium-FORTIFY_SOURCE-r2.patch"
  patch -p1 -i "${srcdir}/chromium-gn-bootstrap-r10.patch"

  # Misc Patches:
  if [ "${_enable_vaapi}" = 1 ]; then
    patch -p1 -i "${srcdir}/vaapi_patch_r2.patch"
  fi

  # Fix paths.
  sed -e 's|i386-linux-gnu/||g' \
      -e 's|x86_64-linux-gnu/||g' \
      -e 's|/usr/lib/va/drivers|/usr/lib/dri|g' \
      -e 's|/usr/lib64/va/drivers|/usr/lib/dri|g' \
      -i content/common/sandbox_linux/bpf_gpu_policy_linux.cc

  patch -p1 -i "${srcdir}/minizip.patch"

  # Patch from crbug (chromium bugtracker).
  # https://crbug.com/473866
  patch -p0 -i "${srcdir}/chromium-widevine-r1.patch"
  sed 's|@WIDEVINE_VERSION@|The Cake Is a Lie|g' -i "third_party/widevine/cdm/stub/widevine_cdm_version.h"

  # Setup nodejs dependency
  mkdir -p third_party/node/linux/node-linux-x64/bin/
  ln -sf /usr/bin/node third_party/node/linux/node-linux-x64/bin/node

  # Try to fix libpng errors.
  msg2 "Attempt for fix libpng errors"
  for _path in 'chrome/app/theme' 'chrome/renderer' 'ui'; do
    pushd "${_path}" &> /dev/null
    export IFS=$'\n'
    for i in $(find . -name '*.png' -type f); do
      mogrify "${i}" &> /dev/null
    done
    export IFS=' '
    popd &> /dev/null
  done

  # Make it possible to remove third_party/adobe.
  echo > "${srcdir}/flapper_version.h"

  # Remove most bundled libraries. Some are still needed.
  msg2 "Removing unnecessary components to save space."
  python2 build/linux/unbundle/remove_bundled_libraries.py ${_keeplibs[@]} --do-remove

  # Can lead fail
  rm -fr native_client/toolchain
  rm -fr build/linux/debian*

  msg2 "Make sure use Python2"
  find . -name '*.py' -exec sed -r 's|/usr/bin/python$|&2|g' -i {} +
  find . -name '*.py' -exec sed -r 's|/usr/bin/env python$|&2|g' -i {} +

  msg2 "Changing bundle libraries to system ones."
  python2 build/linux/unbundle/replace_gn_files.py --system-libraries ${_use_system[@]}

  # Use the file at run time instead of effectively compiling it in.
  sed 's|//third_party/usb_ids/usb.ids|/usr/share/hwdata/usb.ids|g' -i device/usb/BUILD.gn

  msg2 "Update libaddressinput strings."
  python2 third_party/libaddressinput/chromium/tools/update-strings.py

  if [ "${_build_nacl}" = "1" ]; then
    msg2 "Setup NaCl/PNaCl SDK: Download and install NaCl/PNaCl toolchains"
    python2 build/download_nacl_toolchains.py --packages nacl_x86_newlib,pnacl_newlib,pnacl_translator sync --extract
    # Download clang from google. need for build NaCl. also is used by build the project in x86_64 systems when use clang
    python2 tools/clang/scripts/update.py
  fi

_set_gcc() {
    _flags+=(
      'is_clang=false'
      'clang_use_chrome_plugins=false'
    )
    export CC="${_ccache} gcc -Wall"
    export CXX="${_ccache} g++ -Wall"
}

  # Setup compilers.
  # Use system/bundled Clang? or GCC?.
  if [ "${_use_clang}" = "0" ]; then
    _set_gcc
  elif [ "${_use_clang}" = "1" ]; then
    if [ "${CARCH}" = 'i686' ]; then
      msg2 "Build with (bundled) clang is not possible in 32bit systems. then, Use system GCC"
      _set_gcc
    elif [ "${CARCH}" = 'x86_64' ]; then
      msg2 "Setup for use clang"
      _flags+=(
        'is_clang=true'
        'clang_use_chrome_plugins=true'
      )
      _clang_path="${srcdir}/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin"
      export CXXFLAGS="${CXXFLAGS} -Wno-unknown-warning-option"
      export CC="${_ccache} ${_clang_path}/clang -Qunused-arguments"
      export CXX="${_ccache} ${_clang_path}/clang++ -Qunused-arguments"
    fi
  fi
}

build() {

  msg2 "Build the Launcher"
  make -C "chromium-launcher" \
     PREFIX=usr \
     CHROMIUM_SUFFIX="-dev" \
     GTK=3

  cd "chromium-${pkgver}"

  msg2 "Starting building Chromium..."
  # Configure the builder.
  python2 tools/gn/bootstrap/bootstrap.py -v -s --no-clean
  out/Release/gn gen out/Release -v --args="${_flags[*]} ${_debug_flag}" --script-executable=/usr/bin/python2

  # Build all with ninja.
  LC_ALL=C ninja -C out/Release -v pdf chrome chrome_sandbox chromedriver widevinecdmadapter clearkeycdm
}

package() {
  # Install launcher.
  make -C "chromium-launcher" \
    PREFIX=/usr \
    CHROMIUM_SUFFIX="-dev" \
    DESTDIR="${pkgdir}" \
    install
  install -Dm644 "chromium-launcher/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE.launcher"

  pushd "chromium-${pkgver}/out/Release" &> /dev/null

  if [ "${_debug_mode}" = "1" ]; then
    # Build with debug needs a tons of space. remove this save that space, but break the rebuild process.
    rm -fr "chromium-${pkgver}/third_party"
  fi

  # Install binaries.
  install -Dm755 chrome "${pkgdir}/usr/lib/chromium-dev/chromium-dev"
  install -Dm644 chrome.1 "${pkgdir}/usr/share/man/man1/chromium-dev.1"
  install -Dm4755 chrome_sandbox "${pkgdir}/usr/lib/chromium-dev/chrome-sandbox"
  install -Dm755 chromedriver "${pkgdir}/usr/lib/chromium-dev/chromedriver"
  ln -sf /usr/lib/chromium-dev/chromedriver "${pkgdir}/usr/bin/chromedriver-dev"

  # Install libs.
  _libs=(
    'libclearkeycdm.so'
    'libEGL.so'
    'libGLESv2.so'
    'libVkLayer_core_validation.so'
    'libVkLayer_object_tracker.so'
    'libVkLayer_parameter_validation.so'
    'libVkLayer_swapchain.so'
    'libVkLayer_threading.so'
    'libVkLayer_unique_objects.so'
    'libwidevinecdmadapter.so'
  )
  for i in "${_libs[@]}"; do
    install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  install -Dm644 natives_blob.bin "${pkgdir}/usr/lib/chromium-dev/natives_blob.bin"
  install -Dm644 snapshot_blob.bin "${pkgdir}/usr/lib/chromium-dev/snapshot_blob.bin"
  install -Dm755 swiftshader/libEGL.so "${pkgdir}/usr/lib/chromium-dev/swiftshader/libEGL.so"
  install -Dm755 swiftshader/libGLESv2.so "${pkgdir}/usr/lib/chromium-dev/swiftshader/libGLESv2.so"

  # Install Resources.
  _resources=(
    'chrome_100_percent.pak'
    'chrome_200_percent.pak'
    'headless_lib.pak'
    'keyboard_resources.pak'
    'mus_app_resources_100.pak'
    'mus_app_resources_200.pak'
    'mus_app_resources_strings.pak'
    'resources.pak'
    'views_mus_resources.pak'
  )
  for i in "${_resources[@]}"; do
    install -Dm644 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done
  find resources -type f -name "*" -exec install -Dm644 '{}' "${pkgdir}/usr/lib/chromium-dev/{}" \;

  # Install locales.
  find locales -type f -name "*.pak" -exec install -Dm644 '{}' "${pkgdir}/usr/lib/chromium-dev/{}" \;

  # Install icons.
  for _size in 16 22 24 32 48 128 256; do
    case "${_size}" in
      16|32) _branding="${srcdir}/chromium-${pkgver}/chrome/app/theme/default_100_percent/chromium" ;;
      *) _branding="${srcdir}/chromium-${pkgver}/chrome/app/theme/chromium" ;;
    esac
    install -Dm644 "${_branding}/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/chromium-dev.png"
  done

  # Install NaCL stuff if is detected.
  if [ "${_build_nacl}" = "1" ]; then
    install -Dm755 nacl_helper "${pkgdir}/usr/lib/chromium-dev/nacl_helper"
    install -Dm755 nacl_helper_bootstrap "${pkgdir}/usr/lib/chromium-dev/nacl_helper_bootstrap"
    install -Dm755 nacl_helper_nonsfi "${pkgdir}/usr/lib/chromium-dev/nacl_helper_nonsfi"
    install -Dm755 nacl_irt_x86_64.nexe "${pkgdir}/usr/lib/chromium-dev/nacl_irt_x86_64.nexe"
    install -Dm644 icudtl.dat "${pkgdir}/usr/lib/chromium-dev/icudtl.dat"
  fi

  popd &> /dev/null

  # Install some external files.
  install -Dm644 "chromium-${pkgver}/chrome/installer/linux/common/desktop.template" "${pkgdir}/usr/share/applications/chromium-dev.desktop"
  sed -e 's|@@MENUNAME@@|Chromium-dev|g' \
      -e 's|@@USR_BIN_SYMLINK_NAME@@|chromium-dev|g' \
      -e 's|@@PACKAGE@@|chromium-dev|g' \
      -i "${pkgdir}/usr/share/applications/chromium-dev.desktop"
  install -Dm644 chromium-dev.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/chromium-dev.svg"
  install -Dm644 "chromium-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE"

  if [ "${_debug_mode}" = "0" ]; then
    # Manually strip binaries so that 'nacl_irt_*.nexe' is left intact.
    if [ "${_build_nacl}" = "1" ]; then
      strip $STRIP_BINARIES "${pkgdir}/usr/lib/chromium-dev/"nacl_helper{,_bootstrap,_nonsfi}
    fi
    strip $STRIP_BINARIES "${pkgdir}/usr/lib/chromium-dev/"{chromium-dev,chrome-sandbox,chromedriver}
    strip $STRIP_SHARED "${pkgdir}/usr/lib/chromium-dev/"lib*.so
  fi

  # Try to fix libpng errors. (second attemp)
  for _path in "${pkgdir}/usr/lib/chromium-dev/resources/inspector/Images"; do
    pushd "${_path}" &> /dev/null
    export IFS=$'\n'
    for i in $(find . -name '*.png' -type f); do
      mogrify "${i}" &> /dev/null
    done
    export IFS=' '
    popd &> /dev/null
  done
}
