# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>

# Remember to handle https://bugs.archlinux.org/task/74324 on major upgrades
_use_suffix=0
pkgver=22.3.2
_commit=5d3eea593437830ea16e4901f0410feadb0718d4
_chromiumver=108.0.5359.215
_gcc_patchset=2
# shellcheck disable=SC2034
pkgrel=1

_major_ver=${pkgver%%.*}
if [[ ${_use_suffix} != 0 ]]; then
  pkgname="electron${_major_ver}-xdg"
else
  pkgname=electron-xdg
fi
# shellcheck disable=SC2034
pkgdesc='Build cross platform desktop apps with web technologies - without creating a useless ~/.pki directory'
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
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
if [[ ${_use_suffix} == 0 ]]; then
  # shellcheck disable=SC2034
  conflicts=("electron${_major_ver}" "electron")
  # shellcheck disable=SC2034
  provides=("electron${_major_ver}" "electron")
else
  provides=("electron")
  conflicts=("electron")
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
        'use-system-libraries-in-node.patch'
        'std-vector-non-const.patch'
        're-fix-TFLite-build-error-on-linux-with-system-zlib.patch'
        'chromium-icu72.patch'
        'v8-enhance-Date-parser-to-take-Unicode-SPACE.patch'
        'REVERT-roll-src-third_party-ffmpeg-m102.patch'
        'REVERT-roll-src-third_party-ffmpeg-m106.patch'
        'angle-wayland-include-protocol.patch'
       )
# shellcheck disable=SC2034
sha256sums=('SKIP'
            'SKIP'
            '40ef8af65e78901bb8554eddbbb5ebc55c0b8e7927f6ca51b2a353d1c7c50652'
            '77817939c9833f8dda74a8c75620c15747170551ffa6f14f7c5b4071599e8831'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '893bc04c7fceba2f0a7195ed48551d55f066bbc530ec934c89c55768e6f3949c'
            '9015b9d6d5b4c1e7248d6477a4b4b6bd6a3ebdc57225d2d8efcd79fc61790716'
            'dabb5ab204b63be73d3c5c8b7c1fa74053105a285852ba3bbc4fb77646608572'
            'b83406a881d66627757d9cbc05e345cbb2bd395a48b6d4c970e5e1cb3f6ed454'
            '30df59a9e2d95dcb720357ec4a83d9be51e59cc5551365da4c0073e68ccdec44'
            '4c12d31d020799d31355faa7d1fe2a5a807f7458e7f0c374adf55edb37032152'
            'cd0d9d2a1d6a522d47c3c0891dabe4ad72eabbebc0fe5642b9e22efa3d5ee572')

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
  [libaom]=aom
  [libavif]=libavif
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
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

# add custom patches by extending the bash array, as this is both cleaner
# and easier to maintain
source=(${source[@]}
        xdg-basedir.patch)
sha256sums=(${sha256sums[@]}
            'cd844867b5b2197ad097662fee32579a7091dfba1d46cb438c4c7e696690440a')

prepare() {
  sed -i "s|@ELECTRON@|${pkgname%-*}|" electron-launcher.sh
  sed -i "s|@ELECTRON@|${pkgname%-*}|" electron.desktop
  if [[ ${_use_suffix} != 0 ]]; then
    sed -i "s|@ELECTRON_NAME@|Electron ${_major_ver}|" electron.desktop
  else
    sed -i "s|@ELECTRON_NAME@|Electron|" electron.desktop
  fi

  export PATH="${PATH}:${srcdir:?}/depot_tools"

  echo "Fetching chromium..."
  git clone --branch=${_chromiumver} --depth=1 \
      https://chromium.googlesource.com/chromium/src.git

  cat >.gclient <<EOF
solutions = [
  {
    "name": "src/electron",
    "url": "file://${srcdir}/electron@${_commit}",
    "deps_file": "DEPS",
    "managed": False,
    "custom_deps": {
      "src": None,
    },
    "custom_vars": {},
  },
]
EOF

  export PATH+=":$PWD/depot_tools" DEPOT_TOOLS_UPDATE=0
  export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

  echo "Fetching chromium..."
  git clone -b ${_chromiumver} --depth=2 https://chromium.googlesource.com/chromium/src

  depot_tools/gclient.py sync -D \
      --nohooks \
      --with_branch_heads \
      --with_tags

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
  src/build/util/lastchange.py \
    -s src/third_party/dawn --revision src/gpu/webgpu/DAWN_VERSION
  src/tools/update_pgo_profiles.py --target=linux update \
    --gs-url-base=chromium-optimization-profiles/pgo_profiles
  depot_tools/download_from_google_storage.py --no_resume --extract --no_auth \
    --bucket chromium-nodejs -s src/third_party/node/node_modules.tar.gz.sha1
  # Create sysmlink to system clang-format
  ln -s /usr/bin/clang-format src/buildtools/linux64
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json
  cd src/electron || exit
  yarn install --frozen-lockfile
  cd ..

  echo "Applying local patches..."

  # move ~/.pki directory to ${XDG_DATA_HOME:-$HOME/.local}/share/pki
  patch -p1 -i ../xdg-basedir.patch

  # Upstream fixes
  patch -Np1 -i ../re-fix-TFLite-build-error-on-linux-with-system-zlib.patch
  patch -Np1 -i ../chromium-icu72.patch
  patch -Np1 -d v8 <../v8-enhance-Date-parser-to-take-Unicode-SPACE.patch

  # Revert ffmpeg roll requiring new channel layout API support
  # https://crbug.com/1325301
  patch -Rp1 -i ../REVERT-roll-src-third_party-ffmpeg-m102.patch
  # Revert switch from AVFrame::pkt_duration to AVFrame::duration
  patch -Rp1 -i ../REVERT-roll-src-third_party-ffmpeg-m106.patch

  # https://crbug.com/angleproject/7582
  patch -Np0 -i ../angle-wayland-include-protocol.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../patches/chromium-103-VirtualCursor-std-layout.patch

  # Electron specific fixes
  patch -d third_party/electron_node/tools/inspector_protocol/jinja2 \
    -Np1 -i ../../../../../../jinja-python-3.10.patch
  patch -Np1 -i ../use-system-libraries-in-node.patch
  patch -Np1 -i ../default_app-icon.patch  # Icon from .desktop file

  # Allow building against system libraries in official builds
  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py
  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    third_party_dir="third_party/$_lib"
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

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  # https://github.com/webpack/webpack/issues/14532
  export NODE_OPTIONS=--openssl-legacy-provider

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

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  cd src || exit
  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  GN_EXTRA_ARGS='
    custom_toolchain = "//build/toolchain/linux/unbundle:default"
    host_toolchain = "//build/toolchain/linux/unbundle:default"
    clang_base_path = "/usr"
    clang_use_chrome_plugins = false
    symbol_level = 0 # sufficient for backtraces on x86(_64)
    chrome_pgo_phase = 2
    treat_warnings_as_errors = false
    disable_fieldtrial_testing_config = true
    blink_enable_generated_code_formatting = false
    ffmpeg_branding = "Chrome"
    rtc_use_pipewire = true
    link_pulseaudio = true
    use_custom_libcxx = false
    use_gnome_keyring = false
    use_sysroot = false
    use_system_libwayland = true
    use_system_wayland_scanner = true
    icu_use_data_file = false
    is_component_ffmpeg = false
  '
  gn gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${GN_EXTRA_ARGS}"
  ninja -C out/Release electron
  ninja -C out/Release electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}


package() {
  install -dm755 "${pkgdir:?}/usr/lib/${pkgname%-*}"
  bsdtar -xf src/out/Release/dist.zip -C "${pkgdir}/usr/lib/${pkgname%-*}"

  chmod u+s "${pkgdir}/usr/lib/${pkgname%-*}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname%-*}"
  for l in "${pkgdir}/usr/lib/${pkgname%-*}"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      "$(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname%-*}" "${l}")" \
      "${pkgdir}/usr/share/licenses/${pkgname%-*}"
  done

  install -Dm755 "${srcdir}/electron-launcher.sh" \
    "${pkgdir}/usr/bin/${pkgname%-*}"
  if [[ "${_use_suffix}" == 0 ]]; then
    ln -s "/usr/bin/${pkgname%-*}" "${pkgdir}/usr/bin/${pkgname%-*}${_major_ver}"
    ln -s "/usr/lib/${pkgname%-*}" "${pkgdir}/usr/lib/${pkgname%-*}${_major_ver}"
  fi

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 electron.desktop \
    "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop"
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/${pkgname%-*}.png"  # hicolor has no 1024x1024
}
