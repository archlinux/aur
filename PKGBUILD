# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>
# Contributor: Nagisa <simonas@kazlauskas.me>
# Contributor: Misc <andreas.reis@gmail.com>
# Contributor: Jeagoss <jgoliver@jeago.com>
# Contributor: Saikrishna Arcot <saiarcot895@gmail.com> (Author of https://github.com/saiarcot895/chromium-ubuntu-build/blob/master/debian/patches/enable_vaapi_on_linux.diff)

#########################
## -- Build options -- ##
#########################

_use_clang=1           # Use clang compiler (system). Results in faster build and smaller chromium.
_use_bundled_clang=1   # Use bundled clang compiler (needs build). NOTE: if use this option, '_use_clang' is need set to 1
_use_ccache=1          # Use ccache when build
_use_pax=0             # Set 1 to change PaX permisions in executables NOTE: only use if use PaX environment
_use_gtk3=1            # If set 1, then build with GTK3 support, if set 0, then build with GTK2
_debug_mode=0          # Build in debug mode


##############################################
## -- Package and components information -- ##
##############################################
pkgname=chromium-dev
pkgver=55.0.2868.3
_launcher_ver=3
pkgrel=1
pkgdesc="The open-source project behind Google Chrome (Dev Channel)"
arch=('i686' 'x86_64')
url='http://www.chromium.org'
license=('BSD')
depends=('desktop-file-utils'
         'icu'
         'jsoncpp'
#          'libsrtp'
         'libwebp'
         'libxslt'
         'libxss'
         'minizip'
         'perl-file-basedir'
         'nss'
         'pciutils'
#          're2'
         'snappy'
         'speech-dispatcher'
         'speex'
         'xdg-utils'
#          'opus'
#          'protobuf'
#          'libevent'
         'libvpx.so'
         'ffmpeg'
         )
makedepends=('libexif'
             'elfutils'
             'gperf'
             'ninja'
             'perl-json'
             'python2-beautifulsoup4'
             'python2-html5lib'
             'python2-simplejson'
             'python2-jinja'
             'python2-ply'
             'subversion'
             'yasm'
             'git'
             'imagemagick'
             )
optdepends=('pepper-flash: PPAPI Flash Player'
            'chromium-widevine-dev: Widevine plugin (eg: Netflix) (Dev Channel)'
            #
            'kdebase-kdialog: Needed for file dialogs in KDE4/KF5'
            'kdialog-git: Needed for file dialogs in KF5'
            #
            'kwalletmanager: Needed for storing passwords in KWallet in KF5'
            #
            'libexif: Need for read EXIF metadata'
            'ttf-font: For some typography'
            )
source=("https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
        "chromium-launcher-${_launcher_ver}.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v${_launcher_ver}.tar.gz"
        'chromium-dev.svg'
        'BUILD.gn'
        # Patch form Gentoo
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-system-ffmpeg-r4.patch'
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-system-jinja-r14.patch'
        # Misc Patches
#         "enable_vaapi_on_linux-${pkgver}.diff::https://raw.githubusercontent.com/saiarcot895/chromium-ubuntu-build/master/debian/patches/enable_vaapi_on_linux.diff"
        'minizip.patch::http://pastebin.com/raw/QCqSDam5'
        'unset-madv_free.patch'
        # Patch from crbug (chromium bugtracker)
        'chromium-widevine-r1.patch'
        'https://codereview.chromium.org/download/issue2345013003_60001.diff'
        )
sha1sums=( #"$(curl -sL https://gsdview.appspot.com/chromium-browser-official/?marker=chromium-${pkgver}.tar.xz.hashes | awk -v FS='<td>"' -v RS='"</td>' '$0=$2' | head -n1)"
          "$(curl -sL https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz.hashes | grep sha1 | cut -d " " -f3)"
          'd18f8d96e80be9c31d994cc6362d7d8041c53319'
          '336976cb66bf8df71fc7f2e92aa723891b6efb53'
          '04b6606e1110eb3f7f8f7d2483004313d33e49bb'
          # Patch form Gentoo
          'e7db42be95f3ca28a270df45d884b12f66686716'
          'cb2fd59666b2904546d27e863613db515633a5f4'
          # Misc Patches
          '0032f3b38c3cdf07e592fe0428cea3af2ce433b8'
          'bc90b327b05dbecaa88da43211ae0a4ed0c6c57f'
          '17ba326edbd5df0aba71958d9eea56ba9653c995'
          # Patch from crbug (chromium bugtracker)
          '3032c9aeb68d80d8ef3cb8029be0d06ee402fa7f'
          '6da006f4a69f2904e89177fac79788469d523c98'
          )
options=('!strip')
install=chromium-dev.install

################################################
## -- Don't touch anything below this line -- ##
################################################

# Build Debug mode?
if [ "${_debug_mode}" = "1" ]; then
  _debug_flag=" symbol_level=1"
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

# 32 or 64 bits?
if [ "${CARCH}" = "i686" ]; then
  _build_nacl=0
  _nacl_arch=32
  _target=x86
elif [ "${CARCH}" = "x86_64" ]; then
  _build_nacl=1
  _nacl_arch=64
  _target=x64
fi
_build_nacl=0

# If use PaX environment, need 'paxctl'
if [ "${_use_pax}" = "1" ]; then
  makedepends+=('paxctl')
fi

# Need you use clang?
if [ "${_use_clang}" = "1" ]; then
  makedepends+=('clang')
fi
if [ "${_use_bundled_clang}" = "1" ]; then
  makedepends+=('cmake'
                'ocaml'
                'libffi'
                'chrpath'
                )
fi

# Build with GTK3?
if [ "${_use_gtk3}" = "1" ]; then
  depends+=('gtk3')
  makedepends+=('gtk2')
  _launcher_gtk='GTK=3'
  optdepends+=('libappindicator-gtk3: Needed for show systray icon in the panel in plasma-next (KF5)')
  _gtk3=true
elif [ "${_use_gtk3}" = "0" ]; then
  depends+=('gtk2')
  optdepends+=('libappindicator-gtk2: Needed for show systray icon in the panel in plasma-next (KF5)')
  _gtk3=false
fi

# Need you use ccache?
if [ "${_use_ccache}" = "1" ]; then
  makedepends+=('ccache')
fi

# Are you use gnome-keyring/gnome?
_gnome_keyring=false
if [ -f /usr/lib/security/pam_gnome_keyring.so ]; then
  depends+=('gnome-keyring')
  _gnome_keyring=true
fi

# Are you use Pulseaudio?
_pulseaudio=false
if [ -x /usr/lib/libpulse.so ]; then
  _pulseaudio=true
fi

# List of third-party components needed for build chromium. The rest is remove by remove_bundled_libraries srcipt in prepare()
_keeplibs=('base/third_party/dmg_fp'
           'base/third_party/dynamic_annotations'
           'base/third_party/icu'
           'base/third_party/libevent'
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
           'third_party/adobe'
           'third_party/analytics'
           'third_party/angle'
           'third_party/angle/src/common/third_party/numerics'
           'third_party/angle/src/third_party/compiler'
           'third_party/angle/src/third_party/murmurhash'
           'third_party/angle/src/third_party/trace_event'
           'third_party/angle/src/third_party/libXNVCtrl'
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
           'third_party/ced'
           'third_party/cld_2'
           'third_party/cld_3'
           'third_party/cros_system_api'
           'third_party/devscripts'
           'third_party/dom_distiller_js'
           'third_party/fips181'
           'third_party/flatbuffers'
           'third_party/flot'
           'third_party/google_input_tools'
           'third_party/google_input_tools/third_party/closure_library'
           'third_party/google_input_tools/third_party/closure_library/third_party/closure'
           'third_party/hunspell'
           'third_party/iccjpeg'
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
           'third_party/libusb'
           'third_party/libva'
           'third_party/libwebm'
           'third_party/libxml/chromium'
           'third_party/libyuv'
           'third_party/lss'
           'third_party/lzma_sdk'
           'third_party/mesa'
           'third_party/modp_b64'
           'third_party/mt19937ar'
           'third_party/openh264'
           'third_party/openmax_dl'
           'third_party/opus'
           'third_party/ots'
           'third_party/pdfium'
           'third_party/pdfium/third_party/agg23'
           'third_party/pdfium/third_party/base'
           'third_party/pdfium/third_party/bigint'
           'third_party/pdfium/third_party/freetype'
           'third_party/pdfium/third_party/lcms2-2.6'
           'third_party/pdfium/third_party/libjpeg'
           'third_party/pdfium/third_party/libopenjpeg20'
           'third_party/pdfium/third_party/libpng16'
           'third_party/pdfium/third_party/libtiff'
           'third_party/pdfium/third_party/zlib_v128'
           'third_party/polymer'
           'third_party/protobuf'
           'third_party/protobuf/third_party/six'
           'third_party/qcms'
           'third_party/re2'
           'third_party/sfntly'
           'third_party/skia'
           'third_party/smhasher'
           'third_party/speech-dispatcher'
           'third_party/sqlite'
           'third_party/tcmalloc'
           'third_party/usb_ids'
           'third_party/usrsctp'
           'third_party/web-animations-js'
           'third_party/webdriver'
           'third_party/webrtc'
           'third_party/widevine'
           'third_party/woff2'
           'third_party/x86inc'
           'third_party/xdg-utils'
           'third_party/yasm/run_yasm.py'
           'third_party/zlib'
           'url/third_party/mozilla'
           'v8/src/third_party/valgrind'
           )

if [ "${_debug_mode}" = "1" ]; then
  _keeplibs+=('native_client/src/third_party/valgrind')
fi

# Set build flags
# NOTE: need ported to GN
# -Denable_sql_database=0| http://crbug.com/22208

_flags=('is_debug=false'
        "target_cpu=\"${_target}\""
#        'is_component_build=true'
        'enable_widevine=true'
        'enable_hangout_services_extension=false'
        "ffmpeg_branding=\"ChromeOS\""
        'proprietary_codecs=true'
        "google_api_key=\"${_google_api_key}\""
        "google_default_client_id=\"${_google_default_client_id}\""
        "google_default_client_secret=\"${_google_default_client_secret}\""
        'fieldtrial_testing_like_official_build=false'
        "remove_webcore_debug_symbols=${_strip}"
        'use_gconf=false'
        "use_gio=false"
        "use_gnome_keyring=${_gnome_keyring}"
        "use_gtk3=${_gtk3}"
        "use_pulseaudio=${_pulseaudio}"
        "link_pulseaudio=${_pulseaudio}"
        'use_kerberos=true'
        'use_cups=true'
        'use_sysroot=false'
        'use_gold=false'
        "use_allocator=\"none\""
        'linux_use_bundled_binutils=false'
        'fatal_linker_warnings=false'
        'treat_warnings_as_errors=false'
        )

# Set nacl flags
if [ "${_build_nacl}" = "1" ]; then
  _flags+=('enable_nacl=true'
           'enable_nacl_nonsfi=true'
           )
elif [ "${_build_nacl}" = "0" ]; then
  _flags+=('enable_nacl=false'
           'enable_nacl_nonsfi=false'
           )
fi

# Set the bundled/external components
# TODO: need ported to GN as GYP doing before. see status page: https://crbug.com/551343
# hunspell
# libusb
# opus
# sqlite
# ssl
# libsrtp
# protobuf

_use_system=('ffmpeg'
             'flac'
             'harfbuzz-ng'
             'icu'
#              'libevent' # get segfaults and other problems https://bugs.gentoo.org/593458
             'libjpeg'
             'libpng'
             'libvpx'
             'libwebp'
             'libxml'
             'libxslt'
#              're2' # need arch update
             'snappy'
             'yasm'
#              'zlib' # broken
             )

################################################

prepare() {

  # Use custom toolchain
  _flags+=("custom_toolchain=\"${srcdir}:default\"")

  # Set Python2 path
  mkdir -p python-path
  ln -s /usr/bin/python2 "${srcdir}/python-path/python"
  export PATH="${srcdir}/python-path:$PATH"

  cd "chromium-${pkgver}"

  # Fix to save configuration in ~/.config/chromium-dev
  sed -e 's|filename = "chromium-browser"|filename = "chromium-dev"|' \
      -e 's|confdir = "chromium"|confdir = "chromium-dev"|' \
      -i chrome/BUILD.gn
  sed -e 's|config_dir.Append("chromium")|config_dir.Append("chromium-dev")|' \
      -i chrome/common/chrome_paths_linux.cc

  msg2 "Patching the sources"
  # Patch sources from Gentoo
  patch -p1 -i "${srcdir}/chromium-system-ffmpeg-r4.patch"
  patch -p1 -i "${srcdir}/chromium-system-jinja-r14.patch"

  # Misc Patches:
#   patch -p1 -i "${srcdir}/enable_vaapi_on_linux-${pkgver}.diff"
  # fix paths
  sed -e 's|/usr/lib/|/usr/lib32/|g' \
      -e 's|/usr/lib64/|/usr/lib/|g' \
      -i content/common/sandbox_linux/bpf_gpu_policy_linux.cc
  patch -p1 -i "${srcdir}/minizip.patch"
  patch -p1 -i "${srcdir}/unset-madv_free.patch"

  # Patch from crbug (chromium bugtracker)
  # https://crbug.com/473866
  patch -p0 -i "${srcdir}/chromium-widevine-r1.patch"
  sed 's|@WIDEVINE_VERSION@|The Cake Is a Lie|g' -i "third_party/widevine/cdm/stub/widevine_cdm_version.h"
  # https://codereview.chromium.org/2345013003 (fail build if not revert this CL)
  patch -Rp1 -i "${srcdir}/issue2345013003_60001.diff"

  ##
  # Fix libpng errors
  pushd chrome/app/theme &> /dev/null
  export IFS=$'\n'
  for i in $(find . -name '*.png' -type f); do
    mogrify "${i}" &> /dev/null
  done
  export IFS=' '
  popd &> /dev/null

  # Make it possible to remove third_party/adobe
  echo > "${srcdir}/flapper_version.h"

  # Remove most bundled libraries. Some are still needed.
  msg2 "Removing unnecessary components to save space"
  python2 build/linux/unbundle/remove_bundled_libraries.py ${_keeplibs[@]} --do-remove
  rm -fr native_client/toolchain
  rm -fr build/linux/debian*

  if [ "${_build_nacl}" = "1" ]; then
    msg2 "Setup NaCl/PNaCl SDK: Download and install NaCl/PNaCl toolchains"
    python2 build/download_nacl_toolchains.py --packages nacl_x86_newlib,pnacl_newlib,pnacl_translator sync --extract
  fi

  msg2 "Make sure use Python2"
  find . -name '*.py' -exec sed -r 's|/usr/bin/python$|&2|g' -i {} +
  find . -name '*.py' -exec sed -r 's|/usr/bin/env python$|&2|g' -i {} +

  touch chrome/test/data/webui/i18n_process_css_test.html

  # Changing bundle libraries to system ones
  python2 build/linux/unbundle/replace_gn_files.py --system-libraries ${_use_system[@]}

  # update libaddressinput strings
  python2 third_party/libaddressinput/chromium/tools/update-strings.py

  # Use the file at run time instead of effectively compiling it in.
  sed 's|//third_party/usb_ids/usb.ids|/usr/share/hwdata/usb.ids|g' -i device/usb/BUILD.gn
}

build() {

  msg2 "Build the Launcher"
  make -C "chromium-launcher-${_launcher_ver}" CHROMIUM_SUFFIX="-dev" PREFIX=/usr ${_launcher_gtk}

  cd "chromium-${pkgver}"

  # Set ccache environment
  if [ "${_use_ccache}" = "1" ]; then
    msg2 "Setup ccache"
    export CCACHE_CPP2=yes
    export CCACHE_SLOPPINESS=time_macros
  fi

  # Use system/bundled Clang? or GCC?
  _bundled_clang_path="${srcdir}/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin"

  if [ "${_use_clang}" = "0" ]; then
    msg2 "Setup for use system GCC"
    _flags+=('is_clang=false'
             'clang_use_chrome_plugins=false'
             )
    if [ "${_use_ccache}" = "0" ]; then
      export CC="gcc -Wall"
      export CXX="g++ -Wall"
    elif [ "${_use_ccache}" = "1" ]; then
      export CC="ccache gcc -Wall"
      export CXX="ccache g++ -Wall"
    fi
  elif [ "${_use_clang}" = "1" ]; then
    _flags+=('is_clang=true')
    if [ "${_use_bundled_clang}" = "0" ]; then
    _flags+=('clang_use_chrome_plugins=false')
    msg2 "Setup for use system Clang"
      if [ "${_use_ccache}" = "0" ]; then
        export CC="clang -Qunused-arguments"
        export CXX="clang++ -Qunused-arguments"
      elif [ "${_use_ccache}" = "1" ]; then
        export CC="ccache clang -Qunused-arguments"
        export CXX="ccache clang++ -Qunused-arguments"
      fi
      export CXXFLAGS="${CXXFLAGS} -Wno-unknown-warning-option"
    elif [ "${_use_bundled_clang}" = "1" ]; then
      _flags+=('clang_use_chrome_plugins=true')
      msg2 "Setup and build bundled Clang"
      python2 tools/clang/scripts/update.py --force-local-build --without-android --gcc-toolchain=/usr
      if [ "${_use_ccache}" = "0" ]; then
        export CC="${_bundled_clang_path}/clang -Qunused-arguments"
        export CXX="${_bundled_clang_path}/clang++ -Qunused-arguments"
      elif [ "${_use_ccache}" = "1" ]; then
        export CC="ccache ${_bundled_clang_path}/clang -Qunused-arguments"
        export CXX="ccache ${_bundled_clang_path}/clang++ -Qunused-arguments"
      fi
    fi
  fi

  msg2 "Starting building Chromium..."
  # Configure the builder
  python2 tools/gn/bootstrap/bootstrap.py -v --gn-gen-args "${_flags[*]} ${_debug_flag}"
  out/Release/gn gen out/Release --args="${_flags[*]} ${_debug_flag}" --script-executable=/usr/bin/python2

  # Build mksnapshot and pax-mark it.
  if [ "${_use_pax}" = "1" ]; then
    ninja -C out/Release -v mksnapshot
    paxctl -cm out/Release/mksnapshot
  fi

  # Build all with ninja
  LC_ALL=C ninja -C out/Release -v pdf chrome chrome_sandbox chromedriver widevinecdmadapter clearkeycdm

  # Pax-mark again
  if [ "${_use_pax}" = "1" ]; then
    paxctl -cm out/Release/chrome
  fi
}

package() {
  # Install launcher
  make -C "chromium-launcher-${_launcher_ver}" CHROMIUM_SUFFIX="-dev" PREFIX=/usr DESTDIR="${pkgdir}" install-strip
  install -Dm644 "chromium-launcher-${_launcher_ver}/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE.launcher"

  pushd "chromium-${pkgver}/out/Release" &> /dev/null

  if [ "${_debug_mode}" = "1" ]; then
    # Build with debug needs a tons of space. remove this save that space, but break the rebuild process
    rm -fr "chromium-launcher-${_launcher_ver}/third_party"
  fi

  # Install binaries
  install -Dm755 chrome "${pkgdir}/usr/lib/chromium-dev/chromium-dev"
  install -Dm644 chrome.1 "${pkgdir}/usr/share/man/man1/chromium-dev.1"
  install -Dm4755 chrome_sandbox "${pkgdir}/usr/lib/chromium-dev/chrome-sandbox"
  install -Dm755 chromedriver "${pkgdir}/usr/lib/chromium-dev/chromedriver"
  ln -s /usr/lib/chromium-dev/chromedriver "${pkgdir}/usr/bin/chromedriver-dev"

  # Install libs
  for i in libwidevinecdmadapter libclearkeycdm; do
    install -Dm755 "${i}.so" "${pkgdir}/usr/lib/chromium-dev/${i}.so"
  done
  install -Dm644 natives_blob.bin "${pkgdir}/usr/lib/chromium-dev/natives_blob.bin"
  install -Dm644 snapshot_blob.bin "${pkgdir}/usr/lib/chromium-dev/snapshot_blob.bin"

  # Install Resources
  for i in chrome_100_percent chrome_200_percent keyboard_resources keyboard_resources mus_app_resources_100 mus_app_resources_200 mus_app_resources_strings resources views_mus_resources; do
    install -Dm644 "${i}.pak" "${pkgdir}/usr/lib/chromium-dev/${i}.pak"
  done

  # Install locales
  find locales -type f -name "*.pak" -exec install -Dm644 '{}' "${pkgdir}/usr/lib/chromium-dev/{}" \;
  find resources -type f -name "*" -exec install -Dm644 '{}' "${pkgdir}/usr/lib/chromium-dev/{}" \;
  (cd "${pkgdir}/usr/lib/chromium-dev"; ln -s locales remote_locales)

  # Install icons
  for _size in 16 22 24 32 48 128 256; do
    case "${_size}" in
      16|32) _branding="${srcdir}/chromium-${pkgver}/chrome/app/theme/default_100_percent/chromium" ;;
      *) _branding="${srcdir}/chromium-${pkgver}/chrome/app/theme/chromium" ;;
    esac
    install -Dm644 "${_branding}/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/chromium-dev.png"
  done

  # Install pNaCL/NaCL stuff if is detected
  if [ "${_build_nacl}" = "1" ]; then
    install -Dm755 nacl_helper "${pkgdir}/usr/lib/chromium-dev/nacl_helper"
    install -Dm755 nacl_helper_bootstrap "${pkgdir}/usr/lib/chromium-dev/nacl_helper_bootstrap"
    install -Dm755 nacl_helper_nonsfi "${pkgdir}/usr/lib/chromium-dev/nacl_helper_nonsfi"
    install -Dm755 "nacl_irt_x86_${_nacl_arch}.nexe" "${pkgdir}/usr/lib/chromium-dev/nacl_irt_x86_${_nacl_arch}.nexe"
    (cd pnacl; for i in $(find -type f); do install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/pnacl/${i}"; done)
  fi

  popd &> /dev/null

  # Install some external files
  install -Dm644 "chromium-${pkgver}/chrome/installer/linux/common/desktop.template" "${pkgdir}/usr/share/applications/chromium-dev.desktop"
  sed -e 's|@@MENUNAME@@|Chromium-dev|g' \
      -e 's|@@USR_BIN_SYMLINK_NAME@@|chromium-dev|g' \
      -e 's|@@PACKAGE@@|chromium-dev|g' \
      -i "${pkgdir}/usr/share/applications/chromium-dev.desktop"
  install -Dm644 chromium-dev.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/chromium-dev.svg"
  install -Dm644 "chromium-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE"

  # install gnome stuff if detect it
  if [ "${_use_gnome}" = "1" ]; then
    install -Dm644 "chromium-${pkgver}/chrome/installer/linux/common/default-app.template" "${pkgdir}/usr/share/gnome-control-center/default-apps/chromium-dev.xml"
    sed -e 's|@@MENUNAME@@|Chromium-dev|g' \
        -e 's|@@INSTALLDIR@@|/usr/bin|g' \
        -e 's|@@PACKAGE@@|chromium-dev|g' \
        -i "${pkgdir}/usr/share/gnome-control-center/default-apps/chromium-dev.xml"
  fi

  if [ "${_debug_mode}" = "0" ]; then
    # Manually strip binaries so that 'nacl_irt_*.nexe' is left intact
    if [ "${_build_nacl}" = "1" ]; then
      strip $STRIP_BINARIES "${pkgdir}/usr/lib/chromium-dev/"nacl_helper{,_bootstrap,_nonsfi}
    fi
    strip $STRIP_BINARIES "${pkgdir}/usr/lib/chromium-dev/"{chromium-dev,chrome-sandbox,chromedriver}
    strip $STRIP_SHARED "${pkgdir}/usr/lib/chromium-dev/"lib{widevinecdmadapter,clearkeycdm}.so
  fi
}
