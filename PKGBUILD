# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>
# Contributor: Nagisa <simonas@kazlauskas.me>
# Contributor: Misc <andreas.reis@gmail.com>
# Contributor: Jeagoss <jgoliver@jeago.com>

#########################
## -- Build options -- ##
#########################

_use_clang=1           # Use clang compiler (system). Results in faster build and smaller chromium.
_use_bundled_clang=1   # Use bundled clang compiler (needs build). NOTE: if use this option , _use_clang need set to 1
_use_ccache=0          # Use ccache when build
_use_pax=0             # If set 1 to change PaX permisions in executables NOTE: only use if use PaX environment

##############################################
## -- Package and components information -- ##
##############################################
pkgname=chromium-dev
pkgver=45.0.2454.6
_launcher_ver=2
pkgrel=1
pkgdesc='The open-source project behind Google Chrome (Dev Channel)'
arch=('i686' 'x86_64')
url='http://www.chromium.org'
license=('BSD')
depends=('desktop-file-utils' 'gtk2' 'icu' 'jsoncpp' 'libsrtp' 'libwebp' 'libxslt' 'libxss' 'minizip' 'perl-file-basedir'
         'nss' 'pciutils' 're2' 'snappy' 'speech-dispatcher' 'speex' 'xdg-utils') #  'opus'  'protobuf'  'libevent' 'libvpx'
makedepends=('libexif' 'elfutils' 'gperf' 'ninja' 'perl-json' 'python2-beautifulsoup3' 'python2-simplejson' 'python2-jinja' 'subversion' 'yasm' 'git') # 'python2-ply'
makedepends_x86_64=('lib32-gcc-libs' 'lib32-zlib')
optdepends=('chromium-pepper-flash-dev: PPAPI Flash Player (Dev Channel)'
            'kdebase-kdialog: Needed for file dialogs in KDE4'
            'kdeutils-kwalletmanager: For storing passwords in KWallet in KDE4'
            'kdialog-frameworks-git: Needed for file dialogs in KF5'
            'kwalletmanager-git: Needed for storing passwords in KWallet in KF5'
            'libappindicator-gtk2: Needed for show systray icon in the panel in plasma-next (KF5)'
            'llibexif: Need for read EXIF metadata'
            'ttf-font: For some typography')
source=("https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
        "chromium-launcher-${_launcher_ver}.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v${_launcher_ver}.tar.gz"
        'chromium-dev.desktop'
        'chromium-dev.xml'
        'chromium-dev.svg'
        # Patch form Gentoo

        # Misc Patches
        'chromium-system-jinja-r8.patch'
        'enable_vaapi_on_linux.diff'
        # Patch from crbug (chromium bugtracker)

        )
sha1sums=( #"$(curl -sL https://gsdview.appspot.com/chromium-browser-official/?marker=chromium-${pkgver}.tar.x | awk -v FS='<td>"' -v RS='"</td>' '$0=$2' | head -n1)"
          "$(curl -sL "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz.hashes" | grep sha1 | cut -d " " -f3)"
          '55f9646683bc8b92587f8e0a36aff242cb436a24'
          '0acc45b901418f270d0b2068502e39c407c74ea4'
          '2b98c549332e7337307ce287e150930cfc1dfa5f'
          '336976cb66bf8df71fc7f2e92aa723891b6efb53'
          # Patch form Gentoo

          # Misc Patches
          '51ee08f9500a9006673787b0f29ffa089b09c286'
          '4e223ea3df5be9374f202f7c3f0679ae55eed495'
          # Patch from crbug (chromium bugtracker)

          )
options=('!strip')
install=chromium-dev.install

################################################
## -- Don't touch anything below this line -- ##
################################################

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# NOTE: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key="AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM"
_google_default_client_id="413772536636.apps.googleusercontent.com"
_google_default_client_secret="0ZChLK6AxeA3Isu96MkwqDR4"

# 32 or 64 bits?
if [ "${CARCH}" = "i686" ]; then
  _build_ffmpeg_args=" --disable-asm"
  _target_arch=ia32
  _build_pnacl=0
  _pnacl_arch=32
elif  [ "${CARCH}" = "x86_64" ]; then
  _build_ffmpeg_args=""
  _target_arch=x64
  _build_pnacl=1
  _pnacl_arch=64
fi

# If use PaX environment, need 'paxctl'
if [ "${_use_pax}" = "1" ]; then
  makedepends+=('paxctl')
fi

# Need you use clang?
if [ "${_use_clang}" = "1" ]; then
  makedepends+=('clang')
fi
if [ "${_use_bundled_clang}" = "1" ]; then
  makedepends+=('cmake' 'ocaml' 'libffi' 'chrpath')
fi

# Need you use ccache?
if [ "${_use_ccache}" = "1" ]; then
  makedepends+=('ccache')
fi

# Are we in Gnome?
_use_gnome=0
if [ -f /usr/lib/libgconf-2.so ]; then
  depends+=('gconf')
  _use_gnome=1
fi

# Are you use gnome-keyring?
_use_gnome_keyring=0
if [ -f /usr/lib/libgnome-keyring.so ]; then
  depends+=('libgnome-keyring' 'gnome-keyring')
  _use_gnome_keyring=1
fi

# Are you use Pulseaudio?
_use_pulseaudio=0
if [ -x /usr/lib/libpulse.so ]; then
  depends+=('libpulse')
  _use_pulseaudio=1
fi


# List of third-party components needed for build chromium. The rest is remove by remove_bundled_libraries srcipt in prepare()
_necesary=('base/third_party/dmg_fp'
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
           'crypto/third_party/nss'
           'native_client/src/third_party/dlmalloc'
           'native_client_sdk/src/libraries/third_party/newlib-extras'
           'net/third_party/mozilla_security_manager'
           'net/third_party/nss'
           'third_party/WebKit'
           'third_party/analytics'
           'third_party/angle'
           'third_party/angle/src/third_party/compiler'
           'third_party/brotli'
           'third_party/boringssl'
           'third_party/cacheinvalidation'
           'third_party/cld_2'
           'third_party/cros_system_api'
           'third_party/cython/python_flags.py'
           'third_party/devscripts'
           'third_party/dom_distiller_js'
           'third_party/dom_distiller_js/dist/proto_gen/third_party/dom_distiller_js'
           'third_party/ffmpeg'
           'third_party/fips181'
           'third_party/flot'
           'third_party/google_input_tools'
           'third_party/google_input_tools/third_party/closure_library'
           'third_party/google_input_tools/third_party/closure_library/third_party/closure'
           'third_party/hunspell'
           'third_party/iccjpeg'
           'third_party/jstemplate'
           'third_party/khronos'
           'third_party/leveldatabase'
           'third_party/libaddressinput'
           'third_party/libevent'
           'third_party/libjingle'
           'third_party/libphonenumber'
           'third_party/libsecret'
           'third_party/libudev'
           'third_party/libusb'
           'third_party/libva'
           'third_party/libvpx'
           'third_party/libvpx/source/libvpx/third_party/x86inc'
           'third_party/libxml/chromium'
           'third_party/libXNVCtrl'
           'third_party/libyuv'
           'third_party/lss'
           'third_party/lzma_sdk'
           'third_party/mesa'
           'third_party/mojo'
           'third_party/mojo/src/mojo/public/third_party/ply'
           'third_party/modp_b64'
           'third_party/mt19937ar'
           'third_party/npapi'
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
           'third_party/pdfium/third_party/zlib_v128'
           'third_party/ply'
           'third_party/polymer'
           'third_party/protobuf'
           'third_party/qcms'
           'third_party/readability'
           'third_party/sfntly'
           'third_party/skia'
           'third_party/smhasher'
           'third_party/sqlite'
           'third_party/tcmalloc'
           'third_party/trace-viewer'
           'third_party/trace-viewer/tracing/third_party/components/polymer'
           'third_party/trace-viewer/tracing/third_party/d3'
           'third_party/trace-viewer/tracing/third_party/gl-matrix'
           'third_party/trace-viewer/tracing/third_party/jszip'
           'third_party/trace-viewer/tracing/third_party/tvcm'
           'third_party/trace-viewer/tracing/third_party/tvcm/third_party/beautifulsoup/polymer_soup.py'
           'third_party/trace-viewer/tracing/third_party/tvcm/third_party/rcssmin'
           'third_party/trace-viewer/tracing/third_party/tvcm/third_party/rjsmin'
           'third_party/usrsctp'
           'third_party/web-animations-js'
           'third_party/webdriver'
           'third_party/webrtc'
           'third_party/widevine'
           'third_party/x86inc'
           'third_party/zlib/google'
           'url/third_party/mozilla'
           'v8/src/third_party/fdlibm'
           'v8/src/third_party/valgrind'
           )

# Set build flags
# NOTE
# -Denable_sql_database=0                    | http://crbug.com/22208
# -Dlogging_like_official_build=1            | Save space by removing DLOG and DCHECK messages (about 6% reduction).
# -Dlinux_use_gold_flags=0                   | Never use bundled gold binary. Disable gold linker flags for now.
# -Dusb_ids_path=/usr/share/hwdata/usb.ids   | Use the file at run time instead of effectively compiling it in.
# -Denable_hotwording=0                      | http://crbug.com/491435
_flags=("-Dclang=${_use_clang}"
        '-Ddisable_glibc=1'
        '-Ddisable_fatal_linker_warnings=1'
        '-Denable_sql_database=0'
        '-Denable_hidpi=1'
        '-Denable_touch_ui=1'
        '-Denable_webrtc=1'
        '-Denable_widevine=1'
        '-Denable_hotwording=0'
        '-Dffmpeg_branding=ChromeOS'
        "-Dgoogle_api_key=${_google_api_key}"
        "-Dgoogle_default_client_id=${_google_default_client_id}"
        "-Dgoogle_default_client_secret=${_google_default_client_secret}"
        '-Dicu_use_data_file_flag=0'
        '-Dlibspeechd_h_prefix=speech-dispatcher/'
        "-Dlinux_link_gnome_keyring=${_use_gnome_keyring}"
        "-Dlinux_link_gsettings=${_use_gnome}"
        '-Dlinux_link_kerberos=1'
        '-Dlinux_link_libbrlapi=1'
        '-Dlinux_link_libpci=1'
        '-Dlinux_link_libspeechd=1'
        "-Dlinux_link_pulseaudio=${_use_pulseaudio}"
        '-Dlinux_strip_binary=1'
        '-Dlinux_use_bundled_binutils=0'
        '-Dlinux_use_bundled_gold=0'
        '-Dlinux_use_gold_flags=0'
        '-Dlogging_like_official_build=1'
        '-Dno_strict_aliasing=1'
        '-Dproprietary_codecs=1'
        '-Dremove_webcore_debug_symbols=1'
        "-Dtarget_arch=${_target_arch}"
        '-Dusb_ids_path=/usr/share/hwdata/usb.ids'
        "-Duse_gconf=${_use_gnome}"
        "-Duse_gio=${_use_gnome}"
        "-Duse_gnome_keyring=${_use_gnome_keyring}"
        "-Duse_pulseaudio=${_use_pulseaudio}"
        '-Dwerror='
        )

# Set pnacl flags
if [ "${_build_pnacl}" = "0" ]; then
  _flags+=('-Ddisable_nacl=1'
           '-Ddisable_pnacl=1'
           )
fi

# Set clang flags
if [ "${_use_clang}" = "1" ]; then
  if [ "${_use_bundled_clang}" = "0" ]; then
    _flags+=('-Dclang_use_chrome_plugins=0'
             '-Dhost_clang=0')
  elif [ "${_use_bundled_clang}" = "1" ]; then
    _flags+=('-Dclang_use_chrome_plugins=1'
             '-Dhost_clang=1')
  fi
fi

# Set the bundled/external components
# TODO
# -Duse_system_hunspell=1    | Upstream changes needed
# -Duse_system_libusb=1      | http://crbug.com/266149
# -Duse_system_opus=1        | https://code.google.com/p/webrtc/issues/detail?id=3077
# -Duse_system_sqlite=1      | http://crbug.com/22208
# -Duse_system_ssl=1         | http://crbug.com/58087
# -Duse_system_openssl=1     | Use if use BoringSSL instead of SSL
# NOTE
# -Duse_system_libevent=0    | Need older version (<2.x.x)
# -Duse_system_protobuf=0    | https://bugs.gentoo.org/show_bug.cgi?id=525560
# -Duse_system_v8=0          | Possible broken in API/ABI if use a differen version
# -Duse_system_libxnvctrl=0  | Because not exist in Arch (and not all users use nvidia)
# -Duse_system_libvpx=0      | http://crbug.com/494939
_use_system=('-Duse_system_expat=1'
             '-Duse_system_ffmpeg=0'
             '-Duse_system_flac=1'
             '-Duse_system_fontconfig=1'
             '-Duse_system_harfbuzz=1'
             '-Duse_system_icu=1'
             '-Duse_system_jsoncpp=1'
             '-Duse_system_libevent=0'
             '-Duse_system_libexif=1'
             '-Duse_system_libjpeg=1'
             '-Duse_system_libpng=1'
             '-Duse_system_libsrtp=1'
             '-Duse_system_libusb=0'
             '-Duse_system_libvpx=0'
             '-Duse_system_libwebp=1'
             '-Duse_system_libxml=1'
             '-Duse_system_libxnvctrl=0'
             '-Duse_system_libxslt=1'
             '-Duse_system_minizip=1'
             '-Duse_system_nspr=1'
             '-Duse_system_openssl=0'
             '-Duse_system_opus=0'
             '-Duse_system_protobuf=0'
             '-Duse_system_re2=1'
             '-Duse_system_snappy=1'
             '-Duse_system_speex=1'
             '-Duse_system_sqlite=0'
             '-Duse_system_ssl=0'
             '-Duse_system_v8=0'
             '-Duse_system_yasm=1'
             '-Duse_system_xdg_utils=1'
             '-Duse_system_zlib=1'
             )

# Add more options to ffmpeg NOTE: in testing
_extended_ffmpeg_flags=('--enable-vdpau'
                        '--enable-vaapi'
                        )

################################################

prepare() {

  # Set Python2 path
  mkdir -p python-path
  ln -s /usr/bin/python2 "${srcdir}/python-path/python"
  export PATH="${srcdir}/python-path:$PATH"

  cd "chromium-${pkgver}"

  # Fix to save configuration in ~/.config/chromium-dev
  sed -e "s|'filename': 'chromium-browser'|'filename': 'chromium-dev'|" \
      -e "s|'confdir': 'chromium'|'confdir': 'chromium-dev'|" \
      -i chrome/chrome_exe.gypi
  sed -e 's|config_dir.Append("chromium")|config_dir.Append("chromium-dev")|' \
      -e 's|config_dir.Append("chrome-frame")|config_dir.Append("chrome-frame-dev")|' \
      -i chrome/common/chrome_paths_linux.cc

  msg2 "Patching the sources"
  # Patch sources from Gentoo

  # Misc Patches:
  patch -p0 -i ../chromium-system-jinja-r8.patch
  patch -p1 -i ../enable_vaapi_on_linux.diff

  # Patch from crbug (chromium bugtracker)
  # fix the missing define (if not, fail build) (need upstream fix) (https://crbug.com/473866)
  sed '14i#define WIDEVINE_CDM_VERSION_STRING "The Cake Is a Lie"' -i "third_party/widevine/cdm/stub/widevine_cdm_version.h"

  # Make it possible to remove third_party/adobe
  echo > "${srcdir}/flapper_version.h"
  _flags+=("-Dflapper_version_h_file=${srcdir}/flapper_version.h")

  # Remove most bundled libraries. Some are still needed.
  msg2 "Removing unnecessary components to save space"
  python2 build/linux/unbundle/remove_bundled_libraries.py ${_necesary[@]} --do-remove

  if [ "${_build_pnacl}" = "1" ]; then
    msg2 "Setup NaCl/PNaCl SDK: Download and install NaCl/PNaCl toolchains"
    python2 build/download_nacl_toolchains.py --packages nacl_x86_newlib,pnacl_newlib,pnacl_translator sync --extract
  fi

  msg2 "Make sure use Python2"
  find . -name '*.py' -exec sed -r 's|/usr/bin/python$|&2|g' -i {} +
  find . -name '*.py' -exec sed -r 's|/usr/bin/env python$|&2|g' -i {} +
}

build() {

  msg2 "Build the Launcher"
  make -C "chromium-launcher-${_launcher_ver}" CHROMIUM_SUFFIX="-dev" PREFIX=/usr

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
    if [ "${_use_ccache}" = "0" ]; then
      export CC="gcc -Wall"
      export CXX="g++ -Wall"
    elif [ "${_use_ccache}" = "1" ]; then
      export CC="ccache gcc -Wall"
      export CXX="ccache g++ -Wall"
    fi
  elif [ "${_use_clang}" = "1" ]; then
    if [ "${_use_bundled_clang}" = "0" ]; then
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
      msg2 "Setup and build bundled Clang"
      python2 tools/clang/scripts/update.py --force-local-build --without-android
      if [ "${_use_ccache}" = "0" ]; then
        export CC="${_bundled_clang_path}/clang -Qunused-arguments"
        export CXX="${_bundled_clang_path}/clang++ -Qunused-arguments"
      elif [ "${_use_ccache}" = "1" ]; then
        export CC="ccache ${_bundled_clang_path}/clang -Qunused-arguments"
        export CXX="ccache ${_bundled_clang_path}/clang++ -Qunused-arguments"
      fi
    fi
  fi

  # Changing bundle libraries to system ones
  python2 build/linux/unbundle/replace_gyp_files.py ${_use_system[@]}

  # Re-configure and install headers of bundled ffmpeg
  msg2 "Configuring and build the bundled FFmpeg"
  pushd third_party/ffmpeg > /dev/null
  if [ "${_use_clang}" = "1" ] ; then
    if [ "${_use_bundled_clang}" = "0" ] ; then
      _build_ffmpeg_args+=" --cc=clang --cxx=clang++"
    elif [ "${_use_bundled_clang}" = "1" ] ; then
      _build_ffmpeg_args+=" --cc=${_bundled_clang_path}/clang --cxx=${_bundled_clang_path}/clang++"
    fi
  fi
  python2 chromium/scripts/build_ffmpeg.py linux ${_target_arch} --branding=ChromeOS -- ${_extended_ffmpeg_flags[@]} ${_build_ffmpeg_args}
  sh chromium/scripts/copy_config.sh
  python2 chromium/scripts/generate_gyp.py
  popd > /dev/null

  # update libaddressinput strings
  python2 third_party/libaddressinput/chromium/tools/update-strings.py

  # CFLAGS are passed through -Drelease_extra_cflags=
  export -n CFLAGS CXXFLAGS

  msg2 "Starting building Chromium..."
  # Configure the builder
  python2 build/gyp_chromium --depth=. -Drelease_extra_cflags="$CFLAGS" ${_flags[@]} ${_use_system[@]}

  # Build mksnapshot and pax-mark it.
  if [ "${_use_pax}" = "1" ]; then
    ninja -C out/Release -v "mksnapshot"
    paxctl -cm "out/Release/mksnapshot"
  fi

  # Build all with ninja
  ninja -C out/Release -v pdf chrome chrome_sandbox chromedriver widevinecdmadapter clearkeycdm

  # Pax-mark again
  if [ "${_use_pax}" = "1" ]; then
    paxctl -cm out/Release/chrome
  fi
}

package() {
  # Install launcher
  make -C "chromium-launcher-${_launcher_ver}" CHROMIUM_SUFFIX="-dev" PREFIX=/usr DESTDIR="${pkgdir}" install-strip
  install -Dm644 "chromium-launcher-${_launcher_ver}/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE.launcher"

  # Install binaries
  pushd "chromium-${pkgver}/out/Release" &> /dev/null
  install -Dm755 chrome "${pkgdir}/usr/lib/chromium-dev/chromium-dev"
  install -Dm644 chrome.1 "${pkgdir}/usr/share/man/man1/chromium-dev.1"
  install -Dm4755 chrome_sandbox "${pkgdir}/usr/lib/chromium-dev/chrome-sandbox"
  install -Dm755 chromedriver "${pkgdir}/usr/lib/chromium-dev/chromedriver"
  ln -s /usr/lib/chromium-dev/chromedriver "${pkgdir}/usr/bin/chromedriver-dev"

  # Install libs
  for i in widevinecdm widevinecdmadapter clearkeycdm; do
    install -Dm755 "lib${i}.so" "${pkgdir}/usr/lib/chromium-dev/lib${i}.so"
  done
  install -Dm644 natives_blob.bin "${pkgdir}/usr/lib/chromium-dev/natives_blob.bin"
  install -Dm644 snapshot_blob.bin "${pkgdir}/usr/lib/chromium-dev/snapshot_blob.bin"

  # Install Resources
  for i in content_resources keyboard_resources resources chrome_100_percent chrome_200_percent; do
    install -Dm644 "${i}.pak" "${pkgdir}/usr/lib/chromium-dev/${i}.pak"
  done

  # Install locales
  find pseudo_locales -type f -name "*.pak" -exec install -Dm644 '{}' "${pkgdir}/usr/lib/chromium-dev/{}" \;
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

  # Install pNaCL/NaCL stuff is is detected
  if [ "${_build_pnacl}" = "1" ]; then
    install -Dm755 nacl_helper "${pkgdir}/usr/lib/chromium-dev/nacl_helper"
    install -Dm755 nacl_helper_bootstrap "${pkgdir}/usr/lib/chromium-dev/nacl_helper_bootstrap"
    install -Dm755 nacl_helper_nonsfi "${pkgdir}/usr/lib/chromium-dev/nacl_helper_nonsfi"
    install -Dm755 "nacl_irt_x86_${_pnacl_arch}.nexe" "${pkgdir}/usr/lib/chromium-dev/nacl_irt_x86_${_pnacl_arch}.nexe"
    (cd pnacl; for i in $(find -type f); do install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/pnacl/${i}"; done)
  fi

  popd &> /dev/null

  # Install some external files
  install -Dm644 chromium-dev.desktop "${pkgdir}/usr/share/applications/chromium-dev.desktop"
  install -Dm644 chromium-dev.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/chromium-dev.svg"
  install -Dm644 "chromium-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE"

  # install gnome stuff if is detected
  if [ "${_use_gnome}" = "1" ]; then
    install -Dm644 chromium-dev.xml "${pkgdir}/usr/share/gnome-control-center/default-apps/chromium-dev.xml"
  fi

  # Manually strip binaries so that 'nacl_irt_*.nexe' is left intact
  if [ "${_build_pnacl}" = "1" ]; then
    strip $STRIP_BINARIES "${pkgdir}/usr/lib/chromium-dev/"nacl_helper{,_bootstrap,_nonsfi}
  fi
  strip $STRIP_BINARIES "${pkgdir}/usr/lib/chromium-dev/"{chromium-dev,chrome-sandbox,chromedriver}
  strip $STRIP_SHARED "${pkgdir}/usr/lib/chromium-dev/"lib{widevinecdm{,adapter},clearkeycdm}.so
}
