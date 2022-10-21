# Maintainer: Bruno Pagani <archange@archlinux.org>

_use_suffix=1
pkgver=18.3.9
_commit=dce1b44b61284b508a141d01a320275c14831b19
_chromiumver=100.0.4896.160
_gcc_patchset=4
# shellcheck disable=SC2034
pkgrel=3

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
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2'
         'snappy')
# shellcheck disable=SC2034
makedepends=('clang' 'git' 'gn' 'gperf' 'harfbuzz-icu' 'http-parser'
             'java-runtime-headless' 'jsoncpp' 'libnotify' 'lld' 'llvm' 'ninja'
             'npm' 'pciutils' 'pipewire' 'python' 'python-httplib2'
             'python-pyparsing' 'python-six' 'wget' 'yarn')
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
        'jinja-python-3.10.patch'
        'std-vector-non-const.patch'
        'use-system-libraries-in-node.patch'
        'webcodecs-stop-using-AudioOpusEncoder.patch'
        'webrtc-check-existence-of-cursor-metadata.patch'
        'fix-no-member-named-tie-in-namespace-std.patch'
        'iwyu-add-utility-for-std-exchange.patch'
        'iwyu-add-vector-needed-by-statsentry.patch'
        'enable-GlobalMediaControlsCastStartStop.patch'
        'sql-make-VirtualCursor-standard-layout-type.patch'
       )
# shellcheck disable=SC2034
sha256sums=('SKIP'
            'SKIP'
            'a6120e7d4eb5e131b87b6ab3b922e0c6cd78e15501e54cfb2019875173688d80'
            '77817939c9833f8dda74a8c75620c15747170551ffa6f14f7c5b4071599e8831'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            '76b969e1534e8c355b8b524a686cbf3b24136eaa6bd40b0c09fdd9866049f159'
            'c70652a8b24c237bcfd27469de32797a2cb46d9f0d63d897bb6418314a25644c'
            '064daaa2b9d95b96ec04d8ddebf4af441f92263d123365b58fe73966866080af'
            '88b2c8d9c6c1917f6632453f18aad7a3fd94d605eecb6c77ae2394ac5856ba95'
            '7ad0106161bbf25e2e603ae1a723ae4217155ebb26eb4778363ad396e8c14156'
            '6f666ef0acb08704ca58cc0d5e97e7ce64d8fea51042e593adae1ce15a61231c'
            '0ec88c8022c946ac333cbc1060d6b9cacbef6c4a86fe8763d23add6939a3c490'
            '779fb13f2494209d3a7f1f23a823e59b9dded601866d3ab095937a1a04e19ac6'
            'b94b2e88f63cfb7087486508b8139599c89f96d7a4181c61fec4b4e250ca327a'
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
  python src/tools/download_optimization_profile.py \
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
  # Upstream fixes
  patch -Np1 -i ../webcodecs-stop-using-AudioOpusEncoder.patch
  patch -Np1 -d third_party/webrtc <../webrtc-check-existence-of-cursor-metadata.patch

  # Upstream fixes
  patch -Np1 -i ../fix-no-member-named-tie-in-namespace-std.patch
  patch -Np1 -i ../iwyu-add-utility-for-std-exchange.patch
  patch -Np1 -i ../iwyu-add-vector-needed-by-statsentry.patch

  # Revert kGlobalMediaControlsCastStartStop enabled by default
  # https://crbug.com/1314342
  patch -Rp1 -F3 -i ../enable-GlobalMediaControlsCastStartStop.patch

  # https://chromium-review.googlesource.com/c/chromium/src/+/2862724
  patch -Np1 -i ../sql-make-VirtualCursor-standard-layout-type.patch

  # Fixes for building with libstdc++ instead of libc++
  #patch -Np1 -i ../patches/

  # Electron specific fixes
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

  # https://crbug.com/957519#c122
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

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
