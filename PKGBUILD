# Maintainer: 7Ji <pugokushin@gmail.com>

# Based on alarm/extra/chromium, with Rockchip MPP support
#   alarm/extra/chromium is based on archlinux/extra/chromium

# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - makeflags to -j4 on v7, RAM constraints
#  - let build set march on AArch64
#  - is_cfi=false, use_gold=false
#  - clang_use_default_sample_profile=false, AFDO breaks distcc
#  - use_allocator="none", tcmalloc breaks ARM
#  - patch and rebuild bundled eu-strip
#  - disable LTO on v7

highmem=1

_pkgname=chromium
pkgname=${_pkgname}-mpp
_pkgver_short=114.0.5735 # MPP patches are released for x.y.z
pkgver=${_pkgver_short}.198
pkgrel=1
_launcher_ver=8
_manual_clone=0
pkgdesc="A web browser built for speed, simplicity, and security"
arch=('aarch64')
url="https://www.chromium.org/Home"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python' 'gn' 'ninja' 'clang' 'lld' 'gperf' 'nodejs' 'pipewire'
             'qt5-base' 'java-runtime-headless' 'git')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma')
options=('!lto') # Chromium adds its own flags for ThinLTO
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz
        add-some-typename-s-that-are-required-in-C-17.patch
        REVERT-disable-autoupgrading-debug-info.patch
        download-bubble-typename.patch
        webauthn-variant.patch
        random-fixes-for-gcc13.patch
        disable-GlobalMediaControlsCastStartStop.patch
        use-oauth2-client-switches-as-default.patch
        0001-widevine-support-for-arm.patch
        0002-Run-blink-bindings-generation-single-threaded.patch
        0003-Fix-eu-strip-build-for-newer-GCC.patch)
sha256sums=('a9f3440feeab51f56b199797b83b458ca545bf67e114c62b21470fadd5a41dea'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a'
            '621ed210d75d0e846192c1571bb30db988721224a41572c27769c0288d361c11'
            '1b782b0f6d4f645e4e0daa8a4852d63f0c972aa0473319216ff04613a0592a69'
            'd464eed4be4e9bf6187b4c40a759c523b7befefa25ba34ad6401b2a07649ca2a'
            '590fabbb26270947cb477378b53a9dcd17855739076b4af9983e1e54dfcab6d7'
            'ba4dd0a25a4fc3267ed19ccb39f28b28176ca3f97f53a4e9f5e9215280040ea0'
            '7f3b1b22d6a271431c1f9fc92b6eb49c6d80b8b3f868bdee07a6a1a16630a302'
            'e393174d7695d0bafed69e868c5fbfecf07aa6969f3b64596d0bae8b067e1711'
            'fb2eb2d3d140f52717eb46f7f6b9300138862771dde02b9ca28d79eef62c81f8'
            '17a404e586b1f2fdc5a6f1e7795aaabd77bd5c27547212301d588b802138a332'
            '10eda8342a10ffec2d25cfc469f788923f5b32b594b0c6574c35a9b78f346be0')

if (( _manual_clone )); then
  source[0]=fetch-chromium-release
  makedepends+=('python-httplib2' 'python-pyparsing' 'python-six')
fi

provides=("chromium=${pkgver}" "chromedriver=${pkgver}")
conflicts=('chromium' 'chromedriver')
depends+=('libv4l-rkmpp')
install=${pkgname}.install
source+=(
  'chromium-mpp-setup.service'
  'chromium-mpp-setup.sh'
)
_mpp_patches=(
  '0001-media-gpu-v4l2-Support-V4L2-VDA-with-libv4l2-on-Linu.patch'
  '0002-HACK-media-gpu-v4l2-Allow-V4L2-VEA-on-non-chromeos-p.patch'
  '0003-Add-mmap-via-libv4l-to-generic_v4l2_device.patch'
  '0004-media-capture-linux-Support-libv4l2-plugins.patch'
  '0005-cld3-Avoid-unaligned-accesses.patch'
  '0006-media-gpu-v4l2-Use-POLLIN-for-pending-event.patch'
  '0007-media-capture-linux-Prefer-using-the-first-device.patch'
  '0008-media-gpu-v4l2-Fix-compile-error-when-ozone-not-enab.patch'
  '0009-ui-events-ozone-Define-SW_PEN_INSERTED-for-old-kerne.patch'
  '0010-Create-new-fence-when-there-s-no-in-fences.patch'
  '0011-HACK-ozone-wayland-Force-disable-implicit-external-s.patch'
  '0012-HACK-media-capture-linux-Allow-camera-without-suppor.patch'
  '0013-content-gpu-Only-depend-dri-for-X11.patch'
  '0014-HACK-media-Disable-chromeos-direct-video-decoder-by-.patch'
  '0015-media-Support-HEVC-in-V4L2-VDA.patch'
  '0016-media-gpu-chromeos-Define-new-formats-for-old-kernel.patch'
  '0017-media-Support-AV1-in-V4L2-VDA.patch'
  '0018-media-gpu-sandbox-Only-depend-dri-for-X11.patch'
  '0019-HACK-ui-gl-Force-enabling-validating-command-decoder.patch'
  '0020-ui-gfx-linux-Force-disabling-modifiers.patch'
)
_mpp_commit='7f01be8b695ed27220c4fb3d92f96f65aeafc755'
_mpp_parent="https://github.com/JeffyCN/meta-rockchip/raw/${_mpp_commit}/dynamic-layers/recipes-browser/chromium/chromium_${_pkgver_short}/"
for _mpp_patch in ${_mpp_patches[@]}; do
  source+=("${_mpp_parent}${_mpp_patch}")
done
sha256sums+=(
  'a586439809d50cbdf89368978d4d41fd0d77c4898a68e94ea6ba8bc399d939b2'
  '479559ce86f580cdb39d204fd28b94b7698f23210a1337e596fe9bf8866b090e'
  'ddfa54cd7f67c6f8ce6a60d665d4fca6fc642b09b6433a0820f126f53d2e546a'
  'e6089f4fb42cf3d0dd3d616a930b15cb798d6cbc3e3c742b5cffe822fcd579e1'
  'c3f6ef31304473c90b9e9ea028d4c6a6e15d37888b34df90efa07f0f29bdec88'
  'e6d31c2445f81f0a30607d1fa51a08c928c8e701e9dcc397b172cdaf5a3fe2c3'
  '77b1d5a8b75e2131d8e5dd03d6a3b6a9c01f96328373b030a8aec5c177c25fab'
  '130ed4457e5e1147d7599efe9b2fee3a8d7f84d6fdf7126d3ee8a1cf88fa8a0a'
  'c4797fa2c6b7f0429bf5bd11a2e3992e9048ac1d2e81b16e5705d81087fb666c'
  '6b8527c77a2656a1681e6c64562df9fddecc133ab45e292d6d79b39a15f255a4'
  '46a86a521b78dc900be6d7f3e32cb2782197e54fce1cebd8ac3c7cd90223f6cc'
  '8f200d9a1d327532a98383bfd34fbe8944c5c8d5e11be4985928ed2eba28bd91'
  '027d274721829746753ede2eebbf140d78e0a7df6349b901ef464df424960c07'
  '0840c0fd9a4d81a4d77af9761c317d0b0500c5b23869cc919f69886c6dfefee9'
  '3ec89cb09f248b9a8e358959d6d4a91bcaef072964bfda98c71cfd0b839f1ccb'
  '81d4ff6b78c4f6962ce75fe514d326650aed4bc7153ee31a28616ff24b16fb73'
  '4483fb6bb41fc40f0b2b34b1ded22fed3258b2e0b14dd97fa34ded36fb8efec5'
  '485bcb4cf4bc17660203853c682ed8b668d2f222a3e0eb36c0996e8c2cd53e6c'
  'c17147edd83dafb811bb8bc92b33921065225eadc665bb706812ef6e5f08af18'
  '5c8977d5d5eaba5d5a557fa4f8fefbb8f2a788a25569659d4d205a328b093f6e'
  'a2f827dfb6a0bb4cc222fe1e7f09de1db4537f0da1b1a8da0e84bb65a9a5d599'
  '9afa1330d0dad5adffe5181bbb7f5eedb0a44c4c2981b9d1a68748bf192a6ea8'
)

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
  #[re2]=re2         # The current re2 (2023-08-01) breaks the build
  [snappy]=snappy
  [woff2]=woff2
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
#  - Arch Linux ARM has obtained permission to use the Arch Linux keys.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  if (( _manual_clone )); then
    ./fetch-chromium-release $pkgver
  fi
  cd chromium-$pkgver

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # Arch Linux ARM fixes
  patch -p1 -i ../0001-widevine-support-for-arm.patch
  patch -p1 -i ../0002-Run-blink-bindings-generation-single-threaded.patch
  patch -p1 -i ../0003-Fix-eu-strip-build-for-newer-GCC.patch

  if [[ $CARCH == "armv7h" ]]; then
    export ALARM_NINJA_JOBS="4"
    export MAKEFLAGS="-j4"
  fi

  # Allow build to set march and options on AArch64 (crc, crypto)
  [[ $CARCH == "aarch64" ]] && CFLAGS=`echo $CFLAGS | sed -e 's/-march=armv8-a//'` && CXXFLAGS="$CFLAGS"

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc \
    third_party/maldoca/src/maldoca/ole/oss_utils.h

  # Use the --oauth2-client-id= and --oauth2-client-secret= switches for
  # setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
  # runtime -- this allows signing into Chromium without baked-in values
  patch -Np1 -i ../use-oauth2-client-switches-as-default.patch

  # Upstream fixes
  patch -Np1 -i ../add-some-typename-s-that-are-required-in-C-17.patch

  # Revert addition of compiler flag that needs newer clang
  patch -Rp1 -i ../REVERT-disable-autoupgrading-debug-info.patch

  # Disable kGlobalMediaControlsCastStartStop by default
  # https://crbug.com/1314342
  patch -Np1 -i ../disable-GlobalMediaControlsCastStartStop.patch

  # Build fixes
  patch -Np1 -i ../download-bubble-typename.patch
  patch -Np1 -i ../webauthn-variant.patch
  patch -Np1 -i ../random-fixes-for-gcc13.patch

  # MPP Patches
  for _mpp_patch in ${_mpp_patches[@]}; do
    patch -Np1 -i ../${_mpp_patch}
  done

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  ln -s /usr/bin/java third_party/jdk/current/bin/

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
  make -C chromium-launcher-$_launcher_ver

  cd chromium-$pkgver

  # Rebuild eu-strip
  pushd buildtools/third_party/eu-strip
  ./build.sh
  popd

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    'clang_use_default_sample_profile=false'
    'use_allocator="none"'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'is_cfi=false'
    'chrome_pgo_phase=0'
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=false'
    'use_gnome_keyring=false'
    'use_gold=false'
    'use_sysroot=false'
    'use_system_libffi=true'
    'enable_hangout_services_extension=true'
    'enable_widevine=true'
    'enable_nacl=false'
    "google_api_key=\"$_google_api_key\""
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  if [[ $CARCH == "armv7h" ]]; then
    _flags+=('use_thin_lto=false')
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

  cd ../chromium-$pkgver

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"
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

  install -Dm644 chrome/installer/linux/common/chromium-browser/chromium-browser.appdata.xml \
    "$pkgdir/usr/share/metainfo/chromium.appdata.xml"
  sed -ni \
    -e 's/chromium-browser\.desktop/chromium.desktop/' \
    -e '/<update_contact>/d' \
    -e '/<p>/N;/<p>\n.*\(We invite\|Chromium supports Vorbis\)/,/<\/p>/d' \
    -e '/^<?xml/,$p' \
    "$pkgdir/usr/share/metainfo/chromium.appdata.xml"

  local toplevel_files=(
    chrome_100_percent.pak
    chrome_200_percent.pak
    chrome_crashpad_handler
    libqt5_shim.so
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
  
  # MPP specific
  cd ..
  install -Dm755 chromium-mpp-setup.sh -t "${pkgdir}"/usr/bin
  install -Dm644 chromium-mpp-setup.service -t "${pkgdir}"/usr/lib/systemd/system
  local _profiles="${pkgdir}"/usr/share/chromium-mpp-profiles
  echo 'enc' |
    install -Dm644 /dev/stdin "${_profiles}"/default.enc
  local _template='type=%s\ncodecs=%s\nmax-width=%u\nmax-height=%u\n'
  printf "${_template}" dec VP8:VP9:H.264:H.265:AV1 1920 1080 |
    install -Dm644 /dev/stdin "${_profiles}"/default.dec
  printf "${_template}" dec VP8:VP9:H.264:H.265:AV1 7680 4320 |
    install -Dm644 /dev/stdin "${_profiles}"/rk3588.dec
  printf '# The corresponding profile must exist under /usr/share/chromium-mpp-profiles\nPROFILE=rk3588\n' |
    install -Dm644 /dev/stdin ${pkgdir}/etc/conf.d/chromium-mpp
}

# vim:set ts=2 sw=2 et:
