# Maintainer: Nicola Squartini <tensor5@gmail.com>

_use_suffix=1
pkgver=16.2.8
_commit=10ce3725c280131d7b7ad5b1440680b76d25a4d5
_chromiumver=96.0.4664.174
_gcc_patchset=4
# shellcheck disable=SC2034
pkgrel=2

_major_ver=${pkgver%%.*}
if [[ ${_use_suffix} != 0 ]]; then
  pkgname="electron${_major_ver}"
else
  pkgname=electron
fi
# shellcheck disable=SC2034
pkgdesc='Build cross platform desktop apps with web technologies'
# shellcheck disable=SC2034
arch=('x86_64')
# shellcheck disable=SC2034
url='https://electronjs.org/'
# shellcheck disable=SC2034
license=('MIT' 'custom')
# shellcheck disable=SC2034
depends=('c-ares' 'ffmpeg' 'gtk3' 'libxslt' 'minizip' 'nss' 're2' 'snappy')
# shellcheck disable=SC2034
makedepends=('clang' 'git' 'gn' 'gperf' 'harfbuzz-icu' 'http-parser'
             'java-runtime-headless' 'jsoncpp' 'libnotify' 'lld' 'llvm' 'ninja'
             'npm' 'pciutils' 'pipewire' 'python' 'python-httplib2' 'wget'
             'python-pyparsing' 'python-six' 'yarn')
# shellcheck disable=SC2034
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'libappindicator-gtk3: StatusNotifierItem support'
            'pipewire: WebRTC desktop sharing under Wayland'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
if [[ ${_use_suffix} == 0 ]]; then
  # shellcheck disable=SC2034
  conflicts=("electron${_major_ver}")
  # shellcheck disable=SC2034
  provides=("electron${_major_ver}")
fi
# shellcheck disable=SC2034
options=('!lto') # Electron adds its own flags for ThinLTO
# shellcheck disable=SC2034
source=('git+https://github.com/electron/electron.git'
        'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#branch=main'
        "https://github.com/stha09/chromium-patches/releases/download/chromium-${_chromiumver%%.*}-patchset-${_gcc_patchset}/chromium-${_chromiumver%%.*}-patchset-${_gcc_patchset}.tar.xz"
        "electron-launcher.sh"
        "electron.desktop"
        'default_app-icon.patch'
        'breakpad-fix-for-non-constant-SIGSTKSZ.patch'
        'jinja-python-3.10.patch'
        'sandbox-build-if-glibc-2.34-dynamic-stack-size-is-en.patch'
        'std-vector-non-const.patch'
        'use-system-libraries-in-node.patch'
        'cppgc-fix-include.patch'
        'iwyu-add-utility-for-std-exchange.patch'
        'sql-make-VirtualCursor-standard-layout-type.patch'
        'wayland-fix-binding-to-wrong-version.patch'
        'unbundle-fix-visibility-of-build-config-freetype.patch'
        'unexpire-accelerated-video-decode-flag.patch'
       )
# shellcheck disable=SC2034
sha256sums=('SKIP'
            'SKIP'
            '090af7eab39aade15a1786273f2497d6b4abfaef24279fbf97ce0dd1c38c69aa'
            '3953f532a3ea5fce19ee33600c6ead89dcd066df6a01d3c3ab4c24f96e46fca2'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            '75bac9c4ad32ff9329399b8587f9772e208c009fd822cdfce61b2bd1ee9ac828'
            'b4d28867c1fabde6c50a2cfa3f784730446c4d86e5191e0f0000fbf7b0f91ecf'
            '09de0ebb4002be7fb4ede63d3977e4f1235637750169c9e71bfdbd75bf750f7a'
            'f910be9370c880de6e1d61cc30383c069e421d7acf406166e4fbfad324fc7d61'
            '4fbef42aaa7bf60d059f1a6b0a92dc997d475256110bd4df32c12de7f4f175a7'
            'c70652a8b24c237bcfd27469de32797a2cb46d9f0d63d897bb6418314a25644c'
            '7987b106dbb35b74d6ff28dc8cf2c897647d5ce59d5d6dbe36b2f72542e713b6'
            '6f666ef0acb08704ca58cc0d5e97e7ce64d8fea51042e593adae1ce15a61231c'
            'dd317f85e5abfdcfc89c6f23f4c8edbcdebdd5e083dcec770e5da49ee647d150'
            'fc2be146412d117869368f8559afef76ad39a3442ace16e5c7000bd45aa56b27'
            'd0b17162211dd49e3a58c16d1697e7d8c322dcfd3b7890f0c2f920b711f52293'
            '2a97b26c3d6821b15ef4ef1369905c6fa3e9c8da4877eb9af4361452a425290b'
           )

_system_libs=('ffmpeg'
              'flac'
              'fontconfig'
              'freetype'
              'harfbuzz-ng'
              'icu'
              'libdrm'
              'libevent'
              'libjpeg'
              'libpng'
#              'libvpx'
              'libwebp'
              'libxml'
              'libxslt'
#              'openh264'
              'opus'
              're2'
              'snappy'
              'zlib'
             )

prepare() {
  sed -i "s|@ELECTRON@|${pkgname}|" electron-launcher.sh
  sed -i "s|@ELECTRON@|${pkgname}|" electron.desktop
  if [[ ${_use_suffix} != 0 ]]; then
    sed -i "s|@ELECTRON_NAME@|Electron ${_major_ver}|" electron.desktop
  else
    sed -i "s|@ELECTRON_NAME@|Electron|" electron.desktop
  fi

  export PATH="${PATH}:${srcdir:?}/depot_tools"

  echo "Fetching chromium..."
  git clone --branch=${_chromiumver} --depth=1 \
      https://chromium.googlesource.com/chromium/src.git

  echo "solutions = [
  {
    \"name\": \"src/electron\",
    \"url\": \"file://${srcdir}/electron@${_commit}\",
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
      --nohooks

  (
    cd src/electron || exit
    patch -Np1 -i ../../std-vector-non-const.patch
  )

  echo "Running hooks..."
  # python "${srcdir}/depot_tools/gclient.py" runhooks
  src/build/landmines.py
  src/build/util/lastchange.py -o src/build/util/LASTCHANGE
  src/build/util/lastchange.py -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  # Create sysmlink to system clang-format
  ln -s /usr/bin/clang-format src/buildtools/linux64
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  src/third_party/depot_tools/download_from_google_storage.py \
    --no_resume --extract --no_auth --bucket chromium-nodejs \
    -s src/third_party/node/node_modules.tar.gz.sha1
  vpython src/tools/download_optimization_profile.py \
    --newest_state=src/chrome/android/profiles/newest.txt \
    --local_state=src/chrome/android/profiles/local.txt \
    --output_name=src/chrome/android/profiles/afdo.prof \
    --gs_url_base=chromeos-prebuilt/afdo-job/llvm
  #vpython src/tools/update_pgo_profiles.py \
  #  --target=linux \
  #  update \
  #  --gs-url-base=chromium-optimization-profiles/pgo_profiles
  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json
  cd src/electron || exit
  yarn install --frozen-lockfile
  cd ..

  echo "Applying local patches..."
  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../patches/chromium-96-CommandLine-include.patch
  patch -Np1 -i ../patches/chromium-96-RestrictedCookieManager-tuple.patch
  patch -Np1 -i ../patches/chromium-96-DrmRenderNodePathFinder-include.patch
  patch -Np1 -i ../patches/chromium-96-CouponDB-include.patch

  patch -Np1 -d v8 < ../cppgc-fix-include.patch
  patch -Np1 -i ../iwyu-add-utility-for-std-exchange.patch
  patch -Np1 -d third_party/breakpad/breakpad < ../breakpad-fix-for-non-constant-SIGSTKSZ.patch
  patch -Np1 -i ../unbundle-fix-visibility-of-build-config-freetype.patch
  patch -Np1 -i ../sandbox-build-if-glibc-2.34-dynamic-stack-size-is-en.patch
  patch -Np1 -i ../sql-make-VirtualCursor-standard-layout-type.patch
  patch -Np1 -i ../wayland-fix-binding-to-wrong-version.patch
  patch -Np0 -i ../unexpire-accelerated-video-decode-flag.patch
  patch -d third_party/electron_node/tools/inspector_protocol/jinja2 \
      -Np1 -i ../../../../../../jinja-python-3.10.patch
  patch -Np1 -i ../use-system-libraries-in-node.patch
  patch -Np1 -i ../default_app-icon.patch  # Icon from .desktop file

  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
      tools/generate_shim_headers/generate_shim_headers.py
  for lib in $(printf "%s\n" "${_system_libs[@]}" | sed 's/^libjpeg$/&_turbo/'); do
      third_party_dir="third_party/${lib}"
      if [ ! -d "${third_party_dir}" ]; then
        third_party_dir="base/${third_party_dir}"
      fi
      find "${third_party_dir}" -type f \
          \! -path "${third_party_dir}/chromium/*" \
          \! -path "${third_party_dir}/google/*" \
          \! -path 'third_party/harfbuzz-ng/utils/hb_scoped.h' \
          \! -regex '.*\.\(gn\|gni\|isolate\)' \
          -delete
  done
  build/linux/unbundle/replace_gn_files.py \
      --system-libraries \
      "${_system_libs[@]}"
}

build() {
  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # This appears to cause random segfaults when combined with ThinLTO
  # https://bugs.archlinux.org/task/73518
  CFLAGS=${CFLAGS/-fstack-clash-protection}
  CXXFLAGS=${CXXFLAGS/-fstack-clash-protection}

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  cd src || exit
  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  GN_EXTRA_ARGS='
    blink_symbol_level = 0
    chrome_pgo_phase = 0
    clang_use_chrome_plugins = false
    custom_toolchain = "//build/toolchain/linux/unbundle:default"
    host_toolchain = "//build/toolchain/linux/unbundle:default"
    icu_use_data_file = false
    is_component_ffmpeg = false
    link_pulseaudio = true
    rtc_use_pipewire = true
    treat_warnings_as_errors = false
    use_custom_libcxx = false
    use_gnome_keyring = false
    use_sysroot = false
  '
  gn gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${GN_EXTRA_ARGS}"
  ninja -C out/Release electron
  # Strip before zip to avoid
  # zipfile.LargeZipFile: Filesize would require ZIP64 extensions
  strip -s out/Release/electron
  ninja -C out/Release electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}

package() {
  install -dm755 "${pkgdir:?}/usr/lib/${pkgname}"
  bsdtar -xf src/out/Release/dist.zip -C "${pkgdir}/usr/lib/${pkgname}"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for l in "${pkgdir}/usr/lib/${pkgname}"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      "$(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname}" "${l}")" \
      "${pkgdir}/usr/share/licenses/${pkgname}"
  done

  install -Dm755 "${srcdir}/electron-launcher.sh" \
    "${pkgdir}/usr/bin/${pkgname}"
  if [[ "${_use_suffix}" == 0 ]]; then
    ln "${pkgdir}/usr/bin/${pkgname}" \
      "${pkgdir}/usr/bin/${pkgname}${_major_ver}"
  fi

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 electron.desktop \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"  # hicolor has no 1024x1024
}
