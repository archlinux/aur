# $Id: PKGBUILD 277477 2016-10-01 03:36:40Z foutrelis $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium
pkgver=54.0.2840.59
pkgrel=1.1
_launcher_ver=3
pkgdesc="The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser"
arch=('i686' 'x86_64')
url="http://www.chromium.org/"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libxss' 'libexif'
         'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'libpulse' 'harfbuzz'
         'perl' 'perl-file-basedir' 'desktop-file-utils' 'hicolor-icon-theme'
         'pciutils')
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja' 'python2-jinja'
             'python2-markupsafe' 'python2-ply' 'python2-beautifulsoup4'
             'python2-html5lib')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
options=('!strip' debug)
install=chromium.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/$pkgname-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        chromium.desktop
        chromium-52.0.2743.116-unset-madv_free.patch
        chromium-53.0.2785.92-last-commit-position.patch
        chromium-widevine.patch)
sha256sums=('df89c284b0109566acc6a5a1a84d94a5ab0509cc3a86a31299a50328991edcde'
            '8b01fb4efe58146279858a754d90b49e5a38c9a0b36a1f84cbb7d12f92b84c28'
            '028a748a5c275de9b8f776f97909f999a8583a4b77fd1cd600b4fc5c0c3e91e9'
            '3b3aa9e28f29e6f539ed1c7832e79463b13128863a02e9c6fecd16c30d61c227'
            '9502a4d7e825a21ae63cced5715e5f06d983033b623cd41d94d1e38a70f29310'
            'd6fdcb922e5a7fbe15759d39ccc8ea4225821c44d98054ce0f23f9d1f00c9808')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

# We can't build (P)NaCL on i686 because the toolchain is x86_64 only and the
# instructions on how to build the toolchain from source don't work that well
# (at least not from within the Chromium 39 source tree).
# https://sites.google.com/a/chromium.org/dev/nativeclient/pnacl/building-pnacl-components-for-distribution-packagers
_build_nacl=0
_nacl="false"
if [[ $CARCH == i686 ]]; then
  _build_nacl=0
  _nacl="false"
fi

prepare() {
  # These are few system libraries that can be safely used
  local _system_libs=(
    'bzip2'
    'flac'
    'harfbuzz'
    'icu'
    'libjpeg'
    'libpng'
    'libwebp'
    'libxml'
    'libxslt'
    're2'
    'yasm'
    'zlib'
  )

  # List of required bundled libraries
  local _keeplibs=(
    'base/third_party/dmg_fp'
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
    'buildtools/third_party/libc++'
    'buildtools/third_party/libc++abi'
    'chrome/third_party/mozilla_security_manager'
    'courgette/third_party'
    'native_client/src/third_party/dlmalloc'
    'native_client/src/third_party/valgrind'
    'net/third_party/mozilla_security_manager'
    'net/third_party/nss'
    'third_party/WebKit'
    'third_party/adobe'
    'third_party/analytics'
    'third_party/angle'
    'third_party/angle/src/common/third_party/numerics'
    'third_party/angle/src/third_party/compiler'
    'third_party/angle/src/third_party/libXNVCtrl'
    'third_party/angle/src/third_party/murmurhash'
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
    'third_party/ced'
    'third_party/cld_2'
    'third_party/cld_3'
    'third_party/cros_system_api'
    'third_party/cython/python_flags.py'
    'third_party/devscripts'
    'third_party/dom_distiller_js'
    'third_party/ffmpeg'
    'third_party/fips181'
    'third_party/flac'
    'third_party/flatbuffers'
    'third_party/flot'
    'third_party/google_input_tools'
    'third_party/google_input_tools/third_party/closure_library'
    'third_party/google_input_tools/third_party/closure_library/third_party/closure'
    'third_party/harfbuzz-ng'
    'third_party/hunspell'
    'third_party/iccjpeg'
    'third_party/icu'
    'third_party/jstemplate'
    'third_party/khronos'
    'third_party/leveldatabase'
    'third_party/libXNVCtrl'
    'third_party/libaddressinput'
    'third_party/libjingle'
    'third_party/libjpeg_turbo'
    'third_party/libphonenumber'
    'third_party/libpng'
    'third_party/libsecret'
    'third_party/libsrtp'
    'third_party/libudev'
    'third_party/libusb'
    'third_party/libvpx'
    'third_party/libvpx/source/libvpx/third_party/x86inc'
    'third_party/libwebm'
    'third_party/libwebp'
    'third_party/libxml'
    'third_party/libxml/chromium'
    'third_party/libxslt'
    'third_party/libyuv'
    'third_party/lss'
    'third_party/lzma_sdk'
    'third_party/mesa'
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
    'third_party/protobuf/third_party/six'
    'third_party/qcms'
    'third_party/re2'
    'third_party/sfntly'
    'third_party/skia'
    'third_party/smhasher'
    'third_party/snappy'
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
    'third_party/yasm'
    'third_party/yasm/run_yasm.py'
    'third_party/zlib'
    'third_party/zlib/google'
    'url/third_party/mozilla'
    'v8/src/third_party/valgrind'
  )

  cd "$srcdir/$pkgname-$pkgver"

  # Enable support for the Widevine CDM plugin
  # libwidevinecdm.so is not included, but can be copied over from Chrome
  # (Version string doesn't seem to matter so let's go with "Pinkie Pie")
  sed "s/@WIDEVINE_VERSION@/Pinkie Pie/" ../chromium-widevine.patch |
    patch -Np1

  # Disable MADV_FREE (if set by glibc)
  # https://bugzilla.redhat.com/show_bug.cgi?id=1361157
  patch -Np1 -i ../chromium-52.0.2743.116-unset-madv_free.patch

  # Disable last_commit_position as we don't build from git repository
  patch -Np1 -i ../chromium-53.0.2785.92-last-commit-position.patch

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +

  # There are still a lot of relative calls which need a workaround
  mkdir -p "$srcdir/python2-path"
  ln -sf /usr/bin/python2 "$srcdir/python2-path/python"

  # Download the PNaCL toolchain on x86_64; i686 toolchain is no longer provided
  if (( $_build_nacl )); then
    python2 build/download_nacl_toolchains.py \
      --packages nacl_x86_newlib,pnacl_newlib,pnacl_translator \
      sync --extract
    #python2 tools/clang/scripts/update.py
  fi

  # Remove bundled and switch to system libraries (where possible)
  python2 build/linux/unbundle/remove_bundled_libraries.py \
    --do-remove "${_keeplibs[@]}"
  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${_use_system[@]}"

  # More inexplicable hacks
  rm -rf third_party/{jinja2,markupsafe,ply}
  ln -s /usr/lib/python2.7/site-packages/jinja2 third_party/jinja2
  ln -s /usr/lib/python2.7/site-packages/markupsafe third_party/markupsafe
  ln -s /usr/lib/python2.7/site-packages/ply third_party/ply

  python2 third_party/libaddressinput/chromium/tools/update-strings.py
  touch chrome/test/data/webui/i18n_process_css_test.html

  # Use the file at runtime
  sed 's|//third_party/usb_ids/usb.ids|/usr/share/hwdata/usb.ids|g' -i device/usb/BUILD.gn
}

build() {
  local _flags=(
    'is_debug=false'
    'symbol_level=0'
    'enable_widevine=true'
    'enable_hangout_services_extension=false'
    "ffmpeg_branding=\"ChromeOS\""
    'proprietary_codecs=true'
    "google_api_key=\"${_google_api_key}\""
    "google_default_client_id=\"${_google_default_client_id}\""
    "google_default_client_secret=\"${_google_default_client_secret}\""
    'fieldtrial_testing_like_official_build=false'
    "remove_webcore_debug_symbols=true"
    'use_gconf=false'
    "use_gio=false"
    "use_gnome_keyring=false"
    "use_gtk3=false"
    "use_pulseaudio=true"
    "link_pulseaudio=true"
    'use_kerberos=true'
    'use_cups=true'
    'use_sysroot=false'
    'use_gold=false'
    "use_allocator=\"none\""
    'linux_use_bundled_binutils=false'
    'fatal_linker_warnings=false'
    'treat_warnings_as_errors=false'
    "enable_nacl=${_nacl}"
    "enable_nacl_nonsfi=${_nacl}"
    'is_clang=false'
    'clang_use_chrome_plugins=false'
  )

  make -C "$srcdir/chromium-launcher-$_launcher_ver" PREFIX=/usr

  cd "$srcdir/$pkgname-$pkgver"
  export PATH="$srcdir/python2-path:$PATH"

  python2 tools/gn/bootstrap/bootstrap.py -v --gn-gen-args "${_flags[*]}"
  out/Release/gn gen out/Release -v --args="${_flags[*]}" \
    --script-executable=/usr/bin/python2

  ninja -C out/Release \
    pdf \
    chrome chrome_sandbox chromedriver \
    widevinecdmadapter \
    clearkeycdm
}

package() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"

  make PREFIX=/usr DESTDIR="$pkgdir" install-strip
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/$pkgname-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"

  install -Dm4755 out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/chromium/chrome-sandbox"

  install -D out/Release/chromedriver "$pkgdir/usr/lib/chromium/chromedriver"

  cp out/Release/{*.pak,*.bin,libwidevinecdmadapter.so} \
    "$pkgdir/usr/lib/chromium/"

  # Manually strip binaries so that 'nacl_irt_*.nexe' is left intact
  strip $STRIP_BINARIES "$pkgdir/usr/lib/chromium/"{chromium,chrome-sandbox} \
    "$pkgdir/usr/lib/chromium/chromedriver"
  strip $STRIP_SHARED "$pkgdir/usr/lib/chromium/libwidevinecdmadapter.so"

  if (( $_build_nacl )); then
    cp out/Release/nacl_helper{,_bootstrap} out/Release/nacl_irt_*.nexe \
      "$pkgdir/usr/lib/chromium/"
    strip $STRIP_BINARIES "$pkgdir/usr/lib/chromium/"nacl_helper{,_bootstrap}
  fi

  cp -a out/Release/locales "$pkgdir/usr/lib/chromium/"

  install -Dm644 out/Release/chrome.1 "$pkgdir/usr/share/man/man1/chromium.1"

  install -Dm644 "$srcdir/chromium.desktop" \
    "$pkgdir/usr/share/applications/chromium.desktop"

  for size in 22 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"

  install -Dm644 out/Release/icudtl.dat "$pkgdir/usr/lib/chromium/icudtl.dat"

  install -Dm644 out/Release/gen/content/content_resources.pak \
    "$pkgdir/usr/lib/chromium/content_resources.pak"
}

# vim:set ts=2 sw=2 et:
