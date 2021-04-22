# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>
# Contributor: Nagisa <simonas@kazlauskas.me>
# Contributor: Misc <andreas.reis@gmail.com>
# Contributor: Jeagoss <jgoliver@jeago.com>
# Contributor: Saikrishna Arcot <saiarcot895@gmail.com> and Steven Newbury <steve@snewbury.org.uk> (First Authors of VAAPI patch)

#########################
## -- Build options -- ##
#########################

_use_wayland=0           # Build Wayland NOTE: extremely experimental and don't work at this moment

##############################################
## -- Package and components information -- ##
##############################################
pkgname=chromium-dev
pkgver=91.0.4472.10
pkgrel=1
pkgdesc="The open-source project behind Google Chrome (Dev Channel)"
arch=('x86_64')
url='http://www.chromium.org'
license=('BSD')
depends=(
#          'libsrtp'
         'libxslt'
         'libxss'
#          'minizip'
         'nss'
         'pciutils'
#          're2'
         'snappy'
         'xdg-utils'
#          'protobuf'
#          'libevent'
#          'ffmpeg'
#          'icu'       # https://crbug.com/678661.
         'gtk3'
         'openh264'
         'vulkan-icd-loader'
         'libpulse'
         'libwebp'
#          'libvpx'
         'libva'
         'opus'
         'bluez-libs'
         'libnet'
         )
if [ "${_use_wayland}" = "1" ]; then
  depends+=('pipewire')
fi
makedepends=(
             'gperf'
             'ninja'
             'python-protobuf'
             'python-setuptools'
             'python'
             'python2' # for Nacl
             'yasm'
             'nasm'
             'git'
             'hwids'
             'nodejs'
             'java-runtime-headless'
             )
optdepends=(
            'pepper-flash: PPAPI Flash Player'
            'chromium-widevine: Widevine plugin (eg: Netflix)'
            #
            'kdialog: Needed for file dialogs in KF5'
            'kwalletmanager: Needed for storing passwords in KWallet5'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            #
            'ttf-font: For some typography'
            )
source=(
        #"https://gsdview.appspot.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
        "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
        'git+https://github.com/foutrelis/chromium-launcher.git'
        'chromium-dev.svg'
        # Patch form Gentoo.
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-89-EnumTable-crash.patch'
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-shim_headers.patch'
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-91-system-icu.patch'
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-91-ThemeService-crash.patch'
        # Misc Patches.
        'fix_hevc_in_non_cromeos_r1.patch'
        # Patch from crbug.com (chromium bugtracker), chromium-review.googlesource.com / Gerrit or Arch chromium package.
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/chromium/trunk/chromium-glibc-2.33.patch'
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/chromium/trunk/use-oauth2-client-switches-as-default.patch'
        )
sha256sums=(
            #"$(curl -sL https://gsdview.appspot.com/chromium-browser-official/chromium-${pkgver}.tar.xz.hashes | grep sha256 | cut -d ' ' -f3)"
            "$(curl -sL https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz.hashes | grep sha256 | cut -d ' ' -f3)"
            'SKIP'
            'dd2b5c4191e468972b5ea8ddb4fa2e2fa3c2c94c79fc06645d0efc0e63ce7ee1'
            # Patch form Gentoo
            '61066e638ee795e888d12cc2c4af42c8cf3fe9f473b1dc0b78c9e87faf5eacda'
            'fabf66cfb15449011a20e377d600573b6338cc4c52e3f28f80e0541772659e8b'
            '1276018471004688356ef70be708ce96a816ffca6625ed7cc99cb985b6e15559'
            '26cc77232d06e55b50a253617fb87218b0058ba2b0271fef5845bcc474f6a117'
            # Misc Patches
            '70f7a1736aabd63bbdf5060c015b220ede7d5d19837408eb4a5172099aecd862'
            # Patch from crbug (chromium bugtracker) or Arch chromium package
            '2fccecdcd4509d4c36af873988ca9dbcba7fdb95122894a9fdf502c33a1d7a4b'
            'e393174d7695d0bafed69e868c5fbfecf07aa6969f3b64596d0bae8b067e1711'
            )
install=chromium-dev.install

################################################
## -- Don't touch anything below this line -- ##
################################################

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# NOTE: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key="AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM"
#_google_default_client_id="413772536636.apps.googleusercontent.com"
#_google_default_client_secret="0ZChLK6AxeA3Isu96MkwqDR4"

# List of third-party components needed for build chromium. The rest is remove by remove_bundled_libraries srcipt in prepare().
_keeplibs=(
           'base/third_party/cityhash'
           'base/third_party/double_conversion'
           'base/third_party/dynamic_annotations'
           'base/third_party/icu'
           'base/third_party/nspr'
           'base/third_party/superfasthash'
           'base/third_party/symbolize'
           'base/third_party/valgrind'
           'base/third_party/xdg_mime'
           'base/third_party/xdg_user_dirs'
           'buildtools/third_party/libc++'
           'buildtools/third_party/libc++abi'
           'chrome/third_party/mozilla_security_manager'
           'courgette/third_party'
           'native_client/src/third_party/dlmalloc'
           'native_client_sdk/src/libraries/third_party/newlib-extras'
           'net/third_party/mozilla_security_manager'
           'net/third_party/nss'
           'net/third_party/quic'
           'net/third_party/uri_template'
           'third_party/abseil-cpp'
           'third_party/angle'
           'third_party/angle/src/common/third_party/base'
           'third_party/angle/src/common/third_party/smhasher'
           'third_party/angle/src/common/third_party/xxhash'
           'third_party/angle/src/third_party/compiler'
           'third_party/angle/src/third_party/libXNVCtrl'
           'third_party/angle/src/third_party/trace_event'
           'third_party/angle/src/third_party/volk'
           'third_party/apple_apsl'
           'third_party/axe-core'
           'third_party/blink'
           'third_party/boringssl'
           'third_party/boringssl/src/third_party/fiat'
           'third_party/breakpad'
           'third_party/breakpad/breakpad/src/third_party/curl'
           'third_party/brotli'
           'third_party/catapult'
           'third_party/catapult/common/py_vulcanize/third_party/rcssmin'
           'third_party/catapult/common/py_vulcanize/third_party/rjsmin'
           'third_party/catapult/third_party/beautifulsoup4'
           'third_party/catapult/third_party/html5lib-python'
           'third_party/catapult/third_party/polymer'
           'third_party/catapult/third_party/six'
           'third_party/catapult/tracing/third_party/d3'
           'third_party/catapult/tracing/third_party/gl-matrix'
           'third_party/catapult/tracing/third_party/jpeg-js'
           'third_party/catapult/tracing/third_party/jszip'
           'third_party/catapult/tracing/third_party/mannwhitneyu'
           'third_party/catapult/tracing/third_party/oboe'
           'third_party/catapult/tracing/third_party/pako'
           'third_party/ced'
           'third_party/cld_3'
           'third_party/closure_compiler'
           'third_party/crashpad'
           'third_party/crashpad/crashpad/third_party/lss'
           'third_party/crashpad/crashpad/third_party/zlib'
           'third_party/crc32c'
           'third_party/cros_system_api'
           'third_party/dav1d'
           'third_party/dawn'
           'third_party/dawn/third_party/khronos'
           'third_party/depot_tools'
           'third_party/devscripts'
           'third_party/devtools-frontend'
           'third_party/devtools-frontend/src/front_end/third_party/acorn'
           'third_party/devtools-frontend/src/front_end/third_party/axe-core'
           'third_party/devtools-frontend/src/front_end/third_party/chromium'
           'third_party/devtools-frontend/src/front_end/third_party/codemirror'
           'third_party/devtools-frontend/src/front_end/third_party/fabricjs'
           'third_party/devtools-frontend/src/front_end/third_party/i18n'
           'third_party/devtools-frontend/src/front_end/third_party/intl-messageformat'
           'third_party/devtools-frontend/src/front_end/third_party/lighthouse'
           'third_party/devtools-frontend/src/front_end/third_party/lit-html'
           'third_party/devtools-frontend/src/front_end/third_party/lodash-isequal'
           'third_party/devtools-frontend/src/front_end/third_party/marked'
           'third_party/devtools-frontend/src/front_end/third_party/puppeteer'
           'third_party/devtools-frontend/src/front_end/third_party/wasmparser'
           'third_party/devtools-frontend/src/third_party'
           'third_party/dom_distiller_js'
           'third_party/eigen3'
           'third_party/emoji-segmenter'
           'third_party/farmhash'
           'third_party/fdlibm'
           'third_party/fft2d'
           'third_party/ffmpeg'
           'third_party/flatbuffers'
           'third_party/fusejs'
           'third_party/gemmlowp'
           'third_party/google_input_tools'
           'third_party/google_input_tools/third_party/closure_library'
           'third_party/google_input_tools/third_party/closure_library/third_party/closure'
           'third_party/googletest'
           'third_party/harfbuzz-ng/utils'
           'third_party/highway'
           'third_party/hunspell'
           'third_party/iccjpeg'
           'third_party/inspector_protocol'
           'third_party/jinja2'
           'third_party/jsoncpp'
           'third_party/jstemplate'
           'third_party/khronos'
           'third_party/leveldatabase'
           'third_party/libXNVCtrl'
           'third_party/libaddressinput'
           'third_party/libaom'
           'third_party/libaom/source/libaom/third_party/fastfeat'
           'third_party/libaom/source/libaom/third_party/vector'
           'third_party/libaom/source/libaom/third_party/x86inc'
           'third_party/libavif'
           'third_party/libgav1'
           'third_party/libgifcodec'
           'third_party/libjingle'
           'third_party/libjxl'
           'third_party/libphonenumber'
           'third_party/libsecret'
           'third_party/libsrtp'
           'third_party/libsync'
           'third_party/libudev'
           'third_party/liburlpattern'
           'third_party/libva_protected_content'
           'third_party/libvpx'
           'third_party/libvpx/source/libvpx/third_party/x86inc'
           'third_party/libwebm'
           'third_party/libx11'
           'third_party/libxcb-keysyms'
           'third_party/libxml/chromium'
           'third_party/libyuv'
           'third_party/libzip'
           'third_party/llvm'
           'third_party/lottie'
           'third_party/lss'
           'third_party/lzma_sdk'
           'third_party/mako'
           'third_party/markupsafe'
           'third_party/mesa'
           'third_party/metrics_proto'
           'third_party/minigbm'
           'third_party/modp_b64'
           'third_party/nasm'
           'third_party/nearby'
           'third_party/neon_2_sse'
           'third_party/node'
           'third_party/node/node_modules/polymer-bundler/lib/third_party/UglifyJS2'
           'third_party/one_euro_filter'
           'third_party/opencv'
           'third_party/openscreen'
           'third_party/openscreen/src/third_party/mozilla'
           'third_party/openscreen/src/third_party/tinycbor/src/src'
           'third_party/ots'
           'third_party/pdfium'
           'third_party/pdfium/third_party/agg23'
           'third_party/pdfium/third_party/base'
           'third_party/pdfium/third_party/bigint'
           'third_party/pdfium/third_party/freetype'
           'third_party/pdfium/third_party/lcms'
           'third_party/pdfium/third_party/libopenjpeg20'
           'third_party/pdfium/third_party/libpng16'
           'third_party/pdfium/third_party/libtiff'
           'third_party/pdfium/third_party/skia_shared'
           'third_party/perfetto'
           'third_party/perfetto/protos/third_party/chromium'
           'third_party/pffft'
           'third_party/ply'
           'third_party/polymer'
           'third_party/private-join-and-compute'
           'third_party/private_membership'
           'third_party/protobuf'
           'third_party/protobuf/third_party/six'
           'third_party/pyjson5'
           'third_party/qcms'
           'third_party/re2'
           'third_party/rnnoise'
           'third_party/s2cellid'
           'third_party/securemessage'
           'third_party/shell-encryption'
           'third_party/simplejson'
           'third_party/skia'
           'third_party/skia/include/third_party/skcms'
           'third_party/skia/include/third_party/vulkan'
           'third_party/skia/third_party/skcms'
           'third_party/skia/third_party/vulkan'
           'third_party/smhasher'
           'third_party/sqlite'
           'third_party/swiftshader'
           'third_party/swiftshader/third_party/astc-encoder'
           'third_party/swiftshader/third_party/llvm-subzero'
           'third_party/swiftshader/third_party/marl'
           'third_party/swiftshader/third_party/subzero'
           'third_party/swiftshader/third_party/SPIRV-Headers/include/spirv/unified1'
           'third_party/tensorflow-text'
           'third_party/tflite'
           'third_party/tflite/src/third_party/eigen3'
           'third_party/tflite/src/third_party/fft2d'
           'third_party/tflite-support'
           'third_party/tcmalloc'
           'third_party/tint'
           'third_party/ruy'
           'third_party/ukey2'
           'third_party/unrar'
           'third_party/usrsctp'
           'third_party/utf'
           'third_party/vulkan'
           'third_party/wayland'
           'third_party/web-animations-js'
           'third_party/webdriver'
           'third_party/webgpu-cts'
           'third_party/webrtc'
           'third_party/webrtc/common_audio/third_party/ooura'
           'third_party/webrtc/common_audio/third_party/spl_sqrt_floor'
           'third_party/webrtc/modules/third_party/fft'
           'third_party/webrtc/modules/third_party/g711'
           'third_party/webrtc/modules/third_party/g722'
           'third_party/webrtc/rtc_base/third_party/base64'
           'third_party/webrtc/rtc_base/third_party/sigslot'
           'third_party/widevine'
           'third_party/woff2'
           'third_party/wuffs'
           'third_party/x11proto'
           'third_party/xcbproto'
           'third_party/zxcvbn-cpp'
           'third_party/zlib' # /google
           'tools/grit/third_party/six'
           'url/third_party/mozilla'
           'v8/src/third_party/siphash'
           'v8/src/third_party/valgrind'
           'v8/src/third_party/utf8-decoder'
           'v8/third_party/inspector_protocol'
           'v8/third_party/v8'

           # gyp -> gn leftovers.
           'base/third_party/libevent'
           'third_party/speech-dispatcher'
           'third_party/usb_ids'
           'third_party/xdg-utils'
           )

_keeplibs+=(
            'third_party/icu' # https://crbug.com/678661.
            )

# Set build flags.
_flags=(
        "custom_toolchain=\"//build/toolchain/linux/unbundle:default\""
        "host_toolchain=\"//build/toolchain/linux/unbundle:default\""
        'is_debug=false'
        'is_official_build=false'
        'chrome_pgo_phase=0' # unsupported instrumentation profile format version
        'is_component_build=true'
        'enable_widevine=true'
        'enable_hangout_services_extension=true'
        "ffmpeg_branding=\"ChromeOS\""
        'proprietary_codecs=true'
        "google_api_key=\"${_google_api_key}\""
        "google_default_client_id=\"${_google_default_client_id}\""
        "google_default_client_secret=\"${_google_default_client_secret}\""
        'fieldtrial_testing_like_official_build=true'
        'blink_symbol_level=0'
        'use_aura=true'
        'use_gio=false'
        'use_gnome_keyring=false'
        'link_pulseaudio=true'
        'use_sysroot=false'
        'treat_warnings_as_errors=false'
        'enable_nacl=true'
        'enable_nacl_nonsfi=true'
        'use_custom_libcxx=true' # use true if you want use bundled RE2
        'use_vaapi=true'
        'enable_platform_hevc=true'
        'enable_platform_ac3_eac3_audio=true'
        'enable_platform_mpeg_h_audio=true'
        'enable_platform_dolby_vision=true'
        'enable_mse_mpeg2ts_stream_parser=true'
        'clang_use_chrome_plugins=true'
        'use_gold=false'
        'use_dbus=true'
        'use_ozone=true'
        'ozone_auto_platforms=false'
        'ozone_platform_headless=true'
        'use_thin_lto=false'
        )

if [ "${_use_wayland}" = "1" ]; then
  _flags+=(
           'ozone_platform_wayland=true'
           'use_system_libdrm=true'
           'use_system_minigbm=true'
           'use_system_libwayland=true'
           'use_v4l2_codec=true'
           'use_xkbcommon=true'
           "ozone_platform=\"wayland"\"
           'rtc_use_pipewire=true'
           'rtc_pipewire_version="0.3"' # will be the default in Chromium 90
           )
fi

# Set the bundled/external components.
# TODO: need ported to GN as GYP doing before. see status page: https://crbug.com/551343.
_use_system=(
#              'ffmpeg'       # I'm not sure why, but all videos stop playback if use system ffmpeg.
             'flac'
             'fontconfig'
             'freetype'
             'harfbuzz-ng'
#              'icu'          # https://crbug.com/678661.
             'libdrm'
#              'libevent'     # Get segfaults and other problems https://bugs.gentoo.org/593458.
             'libjpeg'
             'libpng'
#              'libvpx'
             'libwebp'
             'libxml'
             'libxslt'
             'openh264'
             'opus'
#              're2'
             'snappy'
#              'yasm'
#              'zlib'         # NaCL needs it
             )

# Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn).
CFLAGS+=' -Wno-builtin-macro-redefined'
CXXFLAGS+=' -Wno-builtin-macro-redefined'
CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

# Conditionals.
if check_option strip y; then
  _flags+=(
           'symbol_level=0'
           )
fi

if check_buildoption ccache y; then
  # Avoid falling back to preprocessor mode when sources contain time macros.
  export CCACHE_CPP2=yes
  export CCACHE_SLOPPINESS=time_macros
fi

if [ ! -f "${BUILDDIR}/PKGBUILD" ]; then
  _builddir="/${pkgname}"
fi

_clang_path="${BUILDDIR}${_builddir}/src/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin/"

export CC="${_clang_path}clang"
export CXX="${_clang_path}clang++"
export AR="${_clang_path}llvm-ar"
export NM=nm
export RANLIB=/usr/bin/true
_lld="ld.lld"

################################################

prepare() {
  cd "${srcdir}/chromium-${pkgver}"

  # Force script incompatible with Python 3 to use /usr/bin/python2.
   sed -e '1s|python$|&2|' \
     -i third_party/ffmpeg/chromium/scripts/generate_gn.py \
     -i third_party/dom_distiller_js/protoc_plugins/json_values_converter.py \
     -i third_party/dom_distiller_js/protoc_plugins/json_values_converter_tests.py

  # Py3toniced.
  2to3 -w --no-diff build/linux/unbundle/remove_bundled_libraries.py
  2to3 -w --no-diff third_party/ffmpeg/chromium/scripts/build_ffmpeg.py

  # Remove most bundled libraries. Some are still needed.
  msg2 "Removing unnecessary components to save disk space."
  build/linux/unbundle/remove_bundled_libraries.py ${_keeplibs[@]} --do-remove

  msg2 "Changing bundle libraries to system ones."
  build/linux/unbundle/replace_gn_files.py --system-libraries ${_use_system[@]}

  msg2 "Setup NaCl/PNaCl SDK: Download and install toolchains"
  build/download_nacl_toolchains.py --packages nacl_x86_newlib,pnacl_newlib,pnacl_translator sync --extract

  msg2 "Download prebuild clang from Google"
  tools/clang/scripts/update.py

  # Use chromium-dev as brand name.
  sed -e 's|=Chromium|&-dev|g' \
      -i chrome/app/theme/chromium/BRANDING
  sed -e '0,/output_name = "chrome"/s/= "chrome"/= "chromium-dev"/' \
      -e 's|root_out_dir/chrome"|root_out_dir/chromium-dev"|g' \
      -i chrome/BUILD.gn
  sed -e 's|"chromium-browser"|"chromium-dev"|g' \
      -i media/audio/pulse/pulse_util.cc
  sed -e 's|"Chromium|&-dev|g' \
      -i chrome/common/chrome_constants.cc
  sed -e 's|chromium-browser|chromium-dev|g' \
      -i chrome/browser/shell_integration_linux.cc \
      -i ui/gtk/gtk_util.cc
  sed -e 's|chromium|&-dev|' \
      -i chrome/common/chrome_paths_linux.cc
  sed -e 's|/etc/chromium|&-dev|' \
      -e 's|/usr/share/chromium|&-dev|' \
      -i chrome/common/chrome_paths.cc
  sed -e 's|/etc/chromium|&-dev|' \
      -e "s|'app_name': 'Chromium|&-dev|g" \
      -i components/policy/tools/template_writers/writer_configuration.py

  # Fix(?) the name of the sandbox.
  sed -e 's|chrome-sandbox|chrome_sandbox|g'\
      -i sandbox/linux/suid/client/setuid_sandbox_host.cc

  # If use ccache, set it.
  if check_buildoption ccache y; then
    sed '36s|""|'ccache'|g' -i build/toolchain/cc_wrapper.gni
  fi

  msg2 "Patching the sources"

  # Misc patches.

  # Pats to chromium dev's about why always they forget add/remove missing build rules.
  # Not this time (?).

  # Allow building against system libraries in official builds.
  sed 's|OFFICIAL_BUILD|GOOGLE_CHROME_BUILD|' \
    -i tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950.
  sed -e 's/\<xmlMalloc\>/malloc/' \
      -e 's/\<xmlFree\>/free/' \
      -i third_party/blink/renderer/core/xml/*.cc \
      -i third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
      -i third_party/libxml/chromium/libxml_utils.cc

  ln -s /usr/bin/java third_party/jdk/current/bin/java

  # Fix build if enable HEVC in non-chromeOS system
  patch -p1 -i "${srcdir}/fix_hevc_in_non_cromeos_r1.patch"

  # # Patch from Gentoo
  patch -p1 -i "${srcdir}/chromium-89-EnumTable-crash.patch"
  patch -p1 -i "${srcdir}/chromium-shim_headers.patch"
  patch -p1 -i "${srcdir}/chromium-91-ThemeService-crash.patch"
  patch -p1 -i "${srcdir}/chromium-91-system-icu.patch"

  # # Patch from crbug.com (chromium bugtracker), chromium-review.googlesource.com / Gerrit or Arch chromium package.

  # Use the --oauth2-client-id= and --oauth2-client-secret= switches for
  # setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
  # runtime -- this allows signing into Chromium without baked-in values
  patch -p1 -i "${srcdir}/use-oauth2-client-switches-as-default.patch"

  # https://crbug.com/1164975
  patch -p1 -i "${srcdir}/chromium-glibc-2.33.patch"
  sed '34i#define AT_EMPTY_PATH 0x1000' -i sandbox/linux/seccomp-bpf-helpers/sigsys_handlers.cc

  # Upstream fixes

  # Setup nodejs dependency.
  mkdir -p third_party/node/linux/node-linux-x64/bin/
  ln -sf /usr/bin/node third_party/node/linux/node-linux-x64/bin/node

  # Use the file at run time instead of effectively compiling it in.
  sed 's|//third_party/usb_ids/usb.ids|/usr/share/hwdata/usb.ids|g' -i services/device/usb/BUILD.gn

  # Setup the linker in chromium.
  sed "s|-fuse-ld=lld|-fuse-ld=${_clang_path}${_lld}|g" \
    -i third_party/ffmpeg/chromium/scripts/build_ffmpeg.py \
    -i build/config/compiler/BUILD.gn

  # Setup bundled ffmpeg.
  # Add build verbose output.
  # setup all cores
  sed -e "s|'make', '-j|'make', 'V=1', '-j|g" \
      -e "s|parallel_jobs = 8|parallel_jobs = $(nproc)|g" \
      -i third_party/ffmpeg/chromium/scripts/build_ffmpeg.py
  # Use system opus.
  rm -fr third_party/opus/src/include
  ln -sf /usr/include/opus/ third_party/opus/src/include
}

build() {
  # set python 2 for build pnacl.
  export PNACLPYTHON=/usr/bin/python2

  msg2 "Build the Launcher"
  make -C chromium-launcher \
    CHROMIUM_SUFFIX="-dev"

  cd "chromium-${pkgver}"

  #echo ${_flags[@]}

  msg2 "Build bundled ffmpeg"
  pushd third_party/ffmpeg &> /dev/null
  # Disable lto.
  # NOTE: This avoid messages like:
  # bfd plugin: LLVM gold plugin has failed to create LTO module: Unknown attribute kind (60) (Producer: 'LLVM9.0.0svn' Reader: 'LLVM 8.0.0')
  # when you have installed clang in the system.
  # Use bundled clang
  chromium/scripts/build_ffmpeg.py linux x64 --branding ChromeOS -- \
    --disable-lto \
    --cc="${_clang_path}clang" \
    --cxx="${_clang_path}clang++" \
    --ld="${_clang_path}clang" \
    --ar="${_clang_path}llvm-ar" \
#     --disable-asm

  chromium/scripts/copy_config.sh
  chromium/scripts/generate_gn.py
  popd &> /dev/null

  # new chromium seems not like this flag. see base/allocator/allocator_shim.cc:408
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  msg2 "Starting building Chromium..."
  LC_ALL=C buildtools/linux64/gn gen out/Release -v --args="${_flags[*]}" --script-executable=/usr/bin/python

  # Build all.
  LC_ALL=C ninja -C out/Release -v chrome chrome_sandbox chromedriver
}

package() {
  options=('!strip')

  # Install launcher.
  make -C chromium-launcher \
    PREFIX=/usr \
    CHROMIUM_SUFFIX="-dev" \
    DESTDIR="${pkgdir}" \
    install
  install -Dm644 "chromium-launcher/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE.launcher"
  strip $STRIP_BINARIES "${pkgdir}/usr/bin/chromium-dev"

  pushd "chromium-${pkgver}/out/Release" &> /dev/null

  # Install binaries.
  _bin=(
        'chromium-dev'
        'chrome_sandbox'
        'chromedriver'
        'crashpad_handler'
        )
  for i in "${_bin[@]}"; do
    case "$i" in
      chrome_sandbox)
        install -Dm4755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
        ;;
      *)
        install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
        ;;
    esac
  strip $STRIP_BINARIES "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  ln -sf /usr/lib/chromium-dev/chromedriver "${pkgdir}/usr/bin/chromedriver-dev"

  # Install libs.
  for i in lib*.so swiftshader/lib*.so; do
    install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
    strip $STRIP_SHARED "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  _blobs=(
          'snapshot_blob.bin'
          'v8_context_snapshot.bin'
          'icudtl.dat' # https://crbug.com/678661.
          'MEIPreload/manifest.json'
          'MEIPreload/preloaded_data.pb'
          'vk_swiftshader_icd.json'
          )

  if [ "${_use_wayland}" = "0" ]; then
    _blobs+=(
             'angledata/VkICD_mock_icd.json'
             )
  fi

  for i in "${_blobs[@]}"; do
    install -Dm644 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  # Install NaCL.
  _nacl_libs=(
              'nacl_helper'
              'nacl_helper_bootstrap'
              'nacl_helper_nonsfi'
              'nacl_irt_x86_64.nexe'
              )
  for i in "${_nacl_libs[@]}"; do
    install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
    case "$i" in
      nacl_irt_x86_64.nexe)
        ;;
      *)
        strip $STRIP_BINARIES "${pkgdir}/usr/lib/chromium-dev/${i}"
        ;;
    esac
  done

  # Install Resources.
  _resources=(
              'chrome_100_percent.pak'
              'chrome_200_percent.pak'
              'headless_lib.pak'
              'resources.pak'
              )
  for i in "${_resources[@]}"; do
    install -Dm644 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  # Set info.
  source "${srcdir}/chromium-${pkgver}/chrome/installer/linux/common/installer.include"
  PACKAGE=chromium-dev
  PROGNAME=chromium-dev
  MENUNAME="Chromium-dev Web Browser"
  USR_BIN_SYMLINK_NAME=chromium-dev
  # Install .desktop and manpages.
  process_template "${srcdir}/chromium-${pkgver}/chrome/app/resources/manpage.1.in" chromium-dev.1
  install -Dm644 chromium-dev.1 "${pkgdir}/usr/share/man/man1/chromium-dev.1"
  process_template "${srcdir}/chromium-${pkgver}/chrome/installer/linux/common/desktop.template" chromium-dev.desktop
  install -Dm644 chromium-dev.desktop "${pkgdir}/usr/share/applications/chromium-dev.desktop"

  # Install locales.
  install -Dm644 locales/*.pak -t "${pkgdir}/usr/lib/chromium-dev/locales"

  # Install icons.
  for _size in 16 24 32 48 64 128 256; do
    case "${_size}" in
      16|32) _branding="${srcdir}/chromium-${pkgver}/chrome/app/theme/default_100_percent/chromium" ;;
      *) _branding="${srcdir}/chromium-${pkgver}/chrome/app/theme/chromium" ;;
    esac
    install -Dm644 "${_branding}/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/chromium-dev.png"
  done
  install -Dm644 "${srcdir}/chromium-dev.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/chromium-dev.svg"

  popd &> /dev/null

  # Install License.
  install -Dm644 "chromium-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE"
}
