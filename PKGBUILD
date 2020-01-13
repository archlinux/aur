# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=electron-ozone
pkgver=7.1.8
provides=('electron')
conflicts=('electron')
_commit=30a94ac944127293d3fd54ede2e3882a871ea8ec
_chromiumver=78.0.3904.130
pkgrel=2
pkgdesc='Electron compiled with wayland support via Ozone'
arch=('x86_64')
options=(debug !strip)
url='https://electronjs.org/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2'
         'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
makedepends=('clang' 'git' 'gn' 'gperf' 'harfbuzz-icu' 'java-runtime-headless'
             'jsoncpp' 'libnotify' 'lld' 'llvm' 'ninja' 'npm' 'pciutils' 'yarn'
             'python2' 'wget' 'yasm')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'libappindicator-gtk3: StatusNotifierItem support'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
source=('git+https://github.com/hedgepigdaniel/electron.git#branch=arch7.1.8-1'
        'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git'
        'electron.desktop'
        'default_app-icon.patch'
        'use-system-libraries-in-node.patch'
        'chromium-skia-harmony.patch'
        'icu65.patch'
        'chromium-system-icu.patch'
        'chromium-system-zlib.patch'
       )
sha256sums=('SKIP'
            'SKIP'
            '5270db01f3f8aaa5137dec275a02caa832b7f2e37942e068cba8d28b3a29df39'
            '51d6e4239b51084a1e9df87ed4d94dcaa22f8d4f332e941eb56fe71b834e9a7a'
            'c7eadac877179e586d0cce7f898aa1462b4c207733e68ecc17de9754b691713a'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            '1de9bdbfed482295dda45c7d4e323cee55a34e42f66b892da1c1a778682b7a41'
            'e73cc2ee8d3ea35aab18c478d76fdfc68ca4463e1e10306fa1e738c03b3f26b5'
            'eb67eda4945a89c3b90473fa8dc20637511ca4dcb58879a8ed6bf403700ca9c8')

_system_libs=('ffmpeg'
              'flac'
              'fontconfig'
              'freetype'
              'harfbuzz-ng'
              'icu'
              'libdrm'
              'libevent'
              'libjpeg'
#              'libpng'
#              'libvpx'
              'libwebp'
              'libxml'
              'libxslt'
#              'openh264'
              'opus'
              're2'
              'snappy'
              'yasm'
              'zlib'
             )

prepare() {
  mkdir -p "${srcdir}"/python2-path
  ln -sf /usr/bin/python2 "${srcdir}/python2-path/python"
  export PATH="${srcdir}/python2-path:${PATH}:${srcdir}/depot_tools"

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

  python2 "${srcdir}/depot_tools/gclient.py" sync \
      --with_branch_heads \
      --with_tags \
      --nohooks

  sed -e "s/'am'/'apply'/" -i src/electron/script/lib/git.py

  echo "Running hooks..."
  # python2 "${srcdir}/depot_tools/gclient.py" runhooks
  python2 src/tools/clang/scripts/update.py
  python2 src/build/landmines.py
  python2 src/build/util/lastchange.py -o src/build/util/LASTCHANGE
  python2 src/build/util/lastchange.py -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  python2 src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  python2 src/third_party/depot_tools/download_from_google_storage.py \
    --no_resume --extract --no_auth --bucket chromium-nodejs \
    -s src/third_party/node/node_modules.tar.gz.sha1
  vpython src/tools/download_cros_provided_profile.py \
    --newest_state=src/chrome/android/profiles/newest.txt \
    --local_state=src/chrome/android/profiles/local.txt \
    --output_name=src/chrome/android/profiles/afdo.prof \
    --gs_url_base=chromeos-prebuilt/afdo-job/llvm
  python2 src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json
  cd src/electron
  yarn install --frozen-lockfile
  cd ..

  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
      tools/generate_shim_headers/generate_shim_headers.py
  for lib in "${_system_libs[@]}" libjpeg_turbo; do
      third_party_dir="third_party/${lib}"
      if [ ! -d ${third_party_dir} ]; then
        third_party_dir="base/${third_party_dir}"
      fi
      find ${third_party_dir} -type f \
          \! -path "${third_party_dir}/chromium/*" \
          \! -path "${third_party_dir}/google/*" \
          \! -path 'third_party/yasm/run_yasm.py' \
          \! -regex '.*\.\(gn\|gni\|isolate\)' \
          -delete
  done
  python2 build/linux/unbundle/replace_gn_files.py \
      --system-libraries \
      "${_system_libs[@]}"

  echo "Applying local patches..."
  patch -Np0 -i ../chromium-skia-harmony.patch
  patch -Np1 -i ../icu65.patch
  patch -Np1 -i ../chromium-system-icu.patch
  patch -Np1 -i ../chromium-system-zlib.patch
  patch -Np1 -i ../use-system-libraries-in-node.patch
  patch -Np1 -i ../default_app-icon.patch  # Icon from .desktop file
}

build() {
  cd src
  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  local _flags=(
    'blink_symbol_level = 0'
    'icu_use_data_file = false'
    'is_component_ffmpeg = false'
    'link_pulseaudio = true'
    'linux_use_bundled_binutils = false'
    'treat_warnings_as_errors = false'
    'use_custom_libcxx = false'
    'use_gnome_keyring = false'
    'use_sysroot = false'
    'use_ozone = true'
    'ozone_auto_platforms = false'
    'ozone_platform_wayland = true'
    'ozone_platform_x11 = true'
    'use_xkbcommon = true'
    'use_system_libwayland = true'
    'use_system_minigbm = true'
    'use_system_libdrm = true'
    'use_glib = true'
  )

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
    _flags+=('cc_wrapper="ccache"')
  fi

  if check_option strip y; then
    _flags+=('symbol_level=0')
  else
    _flags+=('symbol_level=1')
  fi

  gn gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${_flags[*]}"
  ninja -C out/Release electron
  # Strip before zip to avoid
  # zipfile.LargeZipFile: Filesize would require ZIP64 extensions
  strip -s out/Release/electron
  ninja -C out/Release electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}

package() {
  install -dm755 "${pkgdir}/usr/lib/electron"
  bsdtar -xf src/out/Release/dist.zip -C "${pkgdir}/usr/lib/electron"

  chmod u+s "${pkgdir}/usr/lib/electron/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for l in "${pkgdir}/usr/lib/electron"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      $(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname}" ${l}) \
      "${pkgdir}/usr/share/licenses/${pkgname}"
  done

  install -dm755 "${pkgdir}"/usr/bin
  ln -s ../lib/electron/electron "${pkgdir}"/usr/bin

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 -t "${pkgdir}/usr/share/applications" electron.desktop
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/electron.png"  # hicolor has no 1024x1024
}
