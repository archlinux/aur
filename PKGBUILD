# Maintainer: Drew Nutter <dnut@users.noreply.github.com>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_use_suffix=1
pkgver=19.1.9
_chromiumver=102.0.5005.167
# depot_tools has no releases. pin a known-good commit for reproducibility
_depot_tools_commit=7083aadfb53f3de2e20b72058c7f510da8f8218a
# Google Storage objects normally fetched by gclient hooks, see
# chrome/build/linux.pgo.txt and third_party/node/node_modules.tar.gz.sha1
_pgo_profile=chrome-linux-5005-1653490340-736db1732ea5f3959ee14f875a1211fdb84a54af.profdata
_node_modules_sha1=df473d4b1ab26ce6b669007521f2ffb8ff99f9d7
# Build with the toolchain chromium 102 was developed against instead of
# patching it for current clang and python releases. the clang revision is
# from tools/clang/scripts/update.py
_clang_revision=llvmorg-15-init-7570-gba4537b2-1
_python=3.10.19+20251014  # python-build-standalone version+release
# shellcheck disable=SC2034
pkgrel=6

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
license=('MIT' 'BSD-3-Clause')
# shellcheck disable=SC2034
depends=('c-ares' 'gtk3' 'libnghttp2' 'libpulse' 'nss')
# shellcheck disable=SC2034
# clang is only needed for clang-format, which the blink bindings generator uses
makedepends=('clang' 'git' 'gn' 'gperf' 'java-runtime-headless' 'libnotify'
             'libva' 'ninja' 'npm' 'pciutils' 'pipewire' 'python' 'wget'
             'yarn')
# shellcheck disable=SC2034
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
if [[ ${_use_suffix} == 0 ]]; then
  # shellcheck disable=SC2034
  conflicts=("electron${_major_ver}")
  # shellcheck disable=SC2034
  provides=("electron${_major_ver}")
fi
# shellcheck disable=SC2034
options=('!lto') # Electron adds its own flags for ThinLTO
# shellcheck disable=SC2034
noextract=("chromium-node_modules-${_node_modules_sha1}.tar.gz"
           "clang-${_clang_revision}.tgz")
# shellcheck disable=SC2034
source=("git+https://github.com/electron/electron.git#tag=v${pkgver}"
        "git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=${_depot_tools_commit}"
        "https://storage.googleapis.com/chromium-optimization-profiles/pgo_profiles/${_pgo_profile}"
        "chromium-node_modules-${_node_modules_sha1}.tar.gz::https://storage.googleapis.com/chromium-nodejs/${_node_modules_sha1}"
        "https://commondatastorage.googleapis.com/chromium-browser-clang/Linux_x64/clang-${_clang_revision}.tgz"
        "https://github.com/astral-sh/python-build-standalone/releases/download/${_python#*+}/cpython-${_python}-x86_64-unknown-linux-gnu-install_only.tar.gz"
        "electron-launcher.sh"
        "electron.desktop"
        'default_app-icon.patch'
        'jinja-python-3.10.patch'
        'use-system-libraries-in-node.patch'
        'std-vector-non-const.patch'
        'skia-freetype-2.13.patch'
        'sql-make-VirtualCursor-standard-layout-type.patch'
        'chromium-fix-SYS_SECCOMP-redefinition.patch'
        'blink-gperf-3.2-fallthrough.patch'
       )
# shellcheck disable=SC2034
sha256sums=('706ebc368149b727ffd317885b2e26d5e1bb30060e6ebe6f2273aa55c8becb2e'
            '2d8434e23010fd9ddd0299f098857f42bb786550de96d7cd66137ce96b382af5'
            'e01e7575b8947d9e0b42b755c28a292a1d27244a9e873d53840be83c7519e0ce'
            '38fa60c59a8398ae33f8d12c1234735a74dc3c8d0c6d4bc7a9c212c2b4b7fef8'
            '40090455226011c896ecae5770c55a06deb39849f8b6a3c167e7ced843154073'
            '85c96114de83d783db18137f3858bcd3b5a9c4cbe9053f0072d7b5f52154a8c9'
            'b406bc9adb7fadcfbd26f204f3e0ef8c31a41fa09181edb28626167ac58fe038'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            '8725ef370aa37f5752d6f23bca77709bf3c80f425b348d3a244c9556c5d41f53'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            '34454d59d2bc137e63b666141551466a042af1188fe84ef1f5eca1ed991d099a'
            '76b969e1534e8c355b8b524a686cbf3b24136eaa6bd40b0c09fdd9866049f159'
            '3a2876e54755df12aacd0575d9d2ff345fabaca6a0dddc72208787dbb2f34fcb'
            'b94b2e88f63cfb7087486508b8139599c89f96d7a4181c61fec4b4e250ca327a'
            'a8841a6c46cb3ff13477a94fd862e9dd22f0de0ca5e00c63a0519e888e02c39e'
            '8dfb5012081d4d2c4645a1d551dfe20cf8dabe1db74d0765d30a7b22664d33fb')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
# - C++ libraries (icu, re2, snappy) are kept bundled as they are ABI
#   incompatible with the bundled libc++ (use_custom_libcxx=true)
# - ffmpeg is kept bundled as chromium 102 predates the FFmpeg 5+ APIs
# - libxml and libxslt are kept bundled as chromium 102 predates the
#   libxml2 2.12+ APIs
declare -gA _system_libs=(
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [libdrm]=
  [libjpeg]=libjpeg-turbo
  [libpng]=libpng
  #[libvpx]=libvpx
  [libwebp]=libwebp
  [opus]=opus
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

prepare() {
  sed -i "s|@ELECTRON@|${pkgname}|" electron-launcher.sh
  sed -i "s|@ELECTRON@|${pkgname}|" electron.desktop
  sed -i "s|@ELECTRON@|${pkgname}|" default_app-icon.patch
  if [[ ${_use_suffix} != 0 ]]; then
    sed -i "s|@ELECTRON_NAME@|Electron ${_major_ver}|" electron.desktop
  else
    sed -i "s|@ELECTRON_NAME@|Electron|" electron.desktop
  fi

cat >.gclient <<EOF
solutions = [
  {
    "name": "src/electron",
    "url": "file://${srcdir}/electron@refs/tags/v${pkgver}",
    "deps_file": "DEPS",
    "managed": False,
    "custom_deps": {
      # Fetch chromium from the github mirror: shallow fetches of chromium/src
      # from googlesource are extremely slow and often rate limited (HTTP 429)
      "src": "https://github.com/chromium/chromium.git@refs/tags/${_chromiumver}",
    },
    "custom_vars": {},
  },
]
EOF

  export PATH+=":$PWD/depot_tools" DEPOT_TOOLS_UPDATE=0
  export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

  echo "Fetching chromium..."
  # History, branch heads and tags are not needed and make the checkout
  # several times larger and slower
  depot_tools/gclient.py sync -D \
      --nohooks \
      --no-history \
      --shallow

  # depot_tools above needs the system python. chromium 102 needs an older one
  export PATH="${srcdir}/python/bin:${PATH}"

  # electron/BUILD.gn lists .git/packed-refs as an input, which is missing in
  # a fresh shallow clone and would leave build.ninja permanently dirty
  git -C src/electron pack-refs --all

  (
    cd src/electron || exit
    patch -Np1 -i ../../std-vector-non-const.patch
  )

  echo "Running hooks..."
  # python "${srcdir}/depot_tools/gclient.py" runhooks
  src/build/landmines.py
  # The shallow checkout only contains the release commit which has no
  # Change-Id, so do not filter on it
  src/build/util/lastchange.py --filter='^' -o src/build/util/LASTCHANGE
  src/build/util/lastchange.py --filter='^' -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  install -Dm644 "${_pgo_profile}" -t src/chrome/build/pgo_profiles
  bsdtar -xf "chromium-node_modules-${_node_modules_sha1}.tar.gz" \
    -C src/third_party/node
  # Where tools/clang/scripts/update.py would install it
  mkdir -p "src/third_party/llvm-build/Release+Asserts"
  bsdtar -xf "clang-${_clang_revision}.tgz" \
    -C "src/third_party/llvm-build/Release+Asserts"
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
  # Upstream fixes
  patch -Np1 -d third_party/skia <../skia-freetype-2.13.patch

  # Fixes for building with newer system tools
  # gperf 3.2+ already emits [[fallthrough]]
  patch -Np1 -i ../blink-gperf-3.2-fallthrough.patch
  # glibc now defines SYS_SECCOMP in an enum (https://crbug.com/456218403)
  patch -Np1 -i ../chromium-fix-SYS_SECCOMP-redefinition.patch

  # https://chromium-review.googlesource.com/c/chromium/src/+/2862724
  patch -Np1 -i ../sql-make-VirtualCursor-standard-layout-type.patch

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
  export PATH="${srcdir}/python/bin:${PATH}"
  local _clang_bin="${srcdir}/src/third_party/llvm-build/Release+Asserts/bin"
  export CC="${_clang_bin}/clang"
  export CXX="${_clang_bin}/clang++"
  export AR="${_clang_bin}/llvm-ar"
  export NM="${_clang_bin}/llvm-nm"

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

  cd src || exit
  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  GN_EXTRA_ARGS='
    custom_toolchain = "//build/toolchain/linux/unbundle:default"
    host_toolchain = "//build/toolchain/linux/unbundle:default"
    clang_use_chrome_plugins = false
    symbol_level = 0 # sufficient for backtraces on x86(_64)
    chrome_pgo_phase = 2
    treat_warnings_as_errors = false
    rtc_use_pipewire = true
    link_pulseaudio = true
    use_gnome_keyring = false
    use_sysroot = false
    use_custom_libcxx = true
  '
  gn gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${GN_EXTRA_ARGS}"
  ninja -C out/Release electron
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
    ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}${_major_ver}"
    ln -s "/usr/lib/${pkgname}" "${pkgdir}/usr/lib/${pkgname}${_major_ver}"
  fi

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 electron.desktop \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"  # hicolor has no 1024x1024
}
