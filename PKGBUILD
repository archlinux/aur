# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Nicola Squartini <tensor5@gmail.com>
# Contributor: Valentin Hăloiu <vially.ichb@gmail.com>
# Contributor: David Rubio <david.alejandro.rubio at gmail.com>

pkgname=electron-ozone
pkgver=11.3.0
provides=('electron')
conflicts=('electron')
_commit=1631fc9b0c0d84283105a669c98bbeb8bab39109
_chromiumver=87.0.4280.141
pkgrel=1
pkgdesc='Electron compiled with wayland support via Ozone'
arch=('x86_64')
url='https://electronjs.org/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'minizip'
         'nss' 'snappy' 'openh264')
makedepends=('git' 'gn-m87' 'gperf' 'harfbuzz-icu' 'java-runtime-headless'
             'jsoncpp' 'libnotify' 'lld' 'llvm' 'ninja' 'npm' 'pciutils' 'yarn'
             'python2' 'wget' 'yasm' 'python2-setuptools' 'libpipewire02' 'nodejs'
             'clang')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'libappindicator-gtk3: StatusNotifierItem support'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
source=('git+https://github.com/electron/electron.git'
        'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git'
        'electron.desktop'
        'default_app-icon.patch'
        'use-system-libraries-in-node.patch'
        'icu68.patch'
        'v8-icu68.patch' 
        'chromium-skia-harmony.patch'
        '0001-fix-add-Wayland-support-26022.patch'
       )
sha256sums=('SKIP'
            'SKIP'
            '5270db01f3f8aaa5137dec275a02caa832b7f2e37942e068cba8d28b3a29df39'
            '00b21418b9468064f6f275566d3cf64c6b014e596acc650100a5a46da31efbfa'
            '50884820e07f7ce5ce55ee1ecdf610367a737e076c5029da0ab0d23154e7661d'
            '38fb5218331d6e03915490dab64f7b8bf26833a581d1aaa02090437c67e9439c'
            '6e919c9712d8fe6c2918778df1f8c2ee0675a87a48be5d2aaa54e320703ced4b' 
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            'f896ed4008feb76be3a9bef17d6e237b8592de19dc667b1905cacd311e97c70b'
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
              # 'libvpx'
              'libwebp'
              'libxml'
              'libxslt'
              'openh264'
              'opus'
               # 're2' Not possible with custom libcxx
              'snappy'
              'zlib'
             )

prepare() {
  export PATH="${PATH}:${srcdir}/depot_tools"

  echo "Fetching chromium..."
  # If you build electron a lot, you might want to uncomment this.
  # if [ -d "src" ]; then
  #   echo "Removing existing src folder..."
  #   rm -rf src
  # fi
  
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

  cd src/electron
  echo "Applying local electron patches"
  # Wayland support -- Backported from 12.x.y
  patch -Np1 -i ../../0001-fix-add-Wayland-support-26022.patch
  cd ../../

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
  # Create sysmlink to system clang-format
  ln -s /usr/bin/clang-format src/buildtools/linux64
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  python2 src/third_party/depot_tools/download_from_google_storage.py \
    --no_resume --extract --no_auth --bucket chromium-nodejs \
    -s src/third_party/node/node_modules.tar.gz.sha1
  vpython src/tools/download_optimization_profile.py \
    --newest_state=src/chrome/android/profiles/newest.txt \
    --local_state=src/chrome/android/profiles/local.txt \
    --output_name=src/chrome/android/profiles/afdo.prof \
    --gs_url_base=chromeos-prebuilt/afdo-job/llvm
  vpython \
    src/tools/update_pgo_profiles.py \
    --target=linux \
    update \
    --gs-url-base=chromium-optimization-profiles/pgo_profiles
  python2 src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json
  cd src/electron
  yarn install --frozen-lockfile
  cd ..

  echo "Applying local Chromium patches..."
  patch -Np1 -i ../icu68.patch
  patch -Np1 -d v8 <../v8-icu68.patch 
  patch -Np0 -i ../chromium-skia-harmony.patch
  # patch -Np1 -i ../use-system-libraries-in-node.patch
  patch -Np1 -i ../default_app-icon.patch  # Icon from .desktop file

  # Force script incompatible with Python 3 to use /usr/bin/python2
  sed -i '1s|python$|&2|' third_party/dom_distiller_js/protoc_plugins/*.py

  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
      tools/generate_shim_headers/generate_shim_headers.py
  for lib in $(printf "%s\n" "${_system_libs[@]}" | sed 's/^libjpeg$/&_turbo/'); do
      third_party_dir="third_party/${lib}"
      if [ ! -d ${third_party_dir} ]; then
        third_party_dir="base/${third_party_dir}"
      fi
      find ${third_party_dir} -type f \
          \! -path "${third_party_dir}/chromium/*" \
          \! -path "${third_party_dir}/google/*" \
          \! -path 'third_party/harfbuzz-ng/utils/hb_scoped.h' \
          \! -regex '.*\.\(gn\|gni\|isolate\)' \
          -delete
  done
  python2 build/linux/unbundle/replace_gn_files.py \
      --system-libraries \
      "${_system_libs[@]}"
}

build() {
  cd src
  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  local _flags=(
    'blink_symbol_level = 0'
    'icu_use_data_file = false'
    'is_component_ffmpeg = false'
    'link_pulseaudio = true'
    'treat_warnings_as_errors = false'
    'use_gnome_keyring = false'
    'use_sysroot = false'
    'use_ozone = true'
    'ozone_auto_platforms = false'
    'ozone_platform_wayland = true'
    'ozone_platform_x11 = true'
    'use_system_libwayland = true'
    'use_glib = true'
    'use_vaapi = true'
    'rtc_use_pipewire=true'
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

  gn-m87 gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${_flags[*]}" \
      --script-executable=/usr/bin/python2
  ninja -C out/Release electron
  # Strip before zip to avoid
  # zipfile.LargeZipFile: Filesize would require ZIP64 extensions
  if check_option strip y; then
    strip -s out/Release/electron
  fi
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
