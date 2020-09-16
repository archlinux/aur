# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Nicola Squartini <tensor5@gmail.com>
# Contributor: Valentin Hăloiu <vially.ichb@gmail.com>

pkgname=electron-ozone
pkgver=10.1.2
provides=('electron')
conflicts=('electron')
_commit=fbd99fbed1e78af18017c31af20a5baa934468b6
_chromiumver=85.0.4183.98
pkgrel=1
pkgdesc='Electron compiled with wayland support via Ozone'
arch=('x86_64')
url='https://electronjs.org/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'minizip'
         'nss' 'snappy')
makedepends=('git' 'gn<0.1809' 'gperf' 'harfbuzz-icu' 'java-runtime-headless'
             'jsoncpp' 'libnotify' 'lld' 'llvm' 'ninja' 'npm' 'pciutils' 'yarn'
             'python2' 'wget' 'yasm' 'python2-setuptools' 'libpipewire02' 'nodejs'
             'openh264')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'libappindicator-gtk3: StatusNotifierItem support'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
source=('git+https://github.com/electron/electron.git'
        'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git'
        'electron.desktop'
        'default_app-icon.patch'
        'use-system-libraries-in-node.patch'
        'chromium-skia-harmony.patch'
        'media-Set-allocation-limit-compatible-with-FFmpeg-4.3.patch'
        '0001-fix-use-ozone-version-of-global_shortcut_listener-wh.patch'
        '0002-fix-don-t-include-global_menu_bar_x11-sources-in-ozo.patch'
        '0003-fix-fix-ifdefs-and-add-NOTIMPLEMENTEDs-to-make-nativ.patch'
        '0004-fix-remove-various-x11-sources-from-filenames.gni-in.patch'
        '0005-fix-atom_browser_main_parts-move-non-X11-specific-th.patch'
        '0006-fix-add-ifdefs-around-some-X11-specific-code-to-focu.patch'
        '0007-stop-initializing-gtk_ui_delegate_-on-ozone.patch'
        '0008-fix-change-some-X11-specific-ifdefs-to-linux.patch'
        '0009-Remove-unnecessary-ozone-ifdefs-in-native-window-vie.patch'
       )
sha256sums=('SKIP'
            'SKIP'
            '5270db01f3f8aaa5137dec275a02caa832b7f2e37942e068cba8d28b3a29df39'
            '00b21418b9468064f6f275566d3cf64c6b014e596acc650100a5a46da31efbfa'
            '50884820e07f7ce5ce55ee1ecdf610367a737e076c5029da0ab0d23154e7661d'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            '0f041d655335cd2a4773ae7ca5e301a0ff12c6c53f57b7cf6651c268e0420a1c'
            '1f93ae4176cdb6ee6c3517b35a2a34fbebdcfaa387e6a0fb5de701785ec17313'
            '960ad1f120ffe5737ffa89eeb7086651b29fe766c085a863ff8effe92e7bac5d'
            '1a1ae23cabd98c248e75288ef55b517e23c5ca0a262953598179a2d0fbf82e18'
            '322f5228f50a53223fba5bdadc7a0032a661336f13c714b921241ae3965e7d36'
            '3d035ca6fb14f5e9042bb0b4cff23b5ef3e6ca51b97a0569b45e13740c518942'
            'b77f1aa5884108dfaf70d0cb321017adc289f805378c84d12d76ec9bea47f6f5'
            '2b5d233350e42db67db39bfce712b7465313bef25a751af94f0c6fac79f56059'
            '48545645d6d42a7034badf9130752dbd271d0de4cf3a188f2604a89064767978'
            'b85f7edf92be4678849196208e464028cb73f564b8adea98f191abf0995ed5c6')

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
  patch -Np1 -i ../../0001-fix-use-ozone-version-of-global_shortcut_listener-wh.patch
  patch -Np1 -i ../../0002-fix-don-t-include-global_menu_bar_x11-sources-in-ozo.patch
  patch -Np1 -i ../../0003-fix-fix-ifdefs-and-add-NOTIMPLEMENTEDs-to-make-nativ.patch
  patch -Np1 -i ../../0004-fix-remove-various-x11-sources-from-filenames.gni-in.patch
  patch -Np1 -i ../../0005-fix-atom_browser_main_parts-move-non-X11-specific-th.patch
  patch -Np1 -i ../../0006-fix-add-ifdefs-around-some-X11-specific-code-to-focu.patch
  patch -Np1 -i ../../0007-stop-initializing-gtk_ui_delegate_-on-ozone.patch
  patch -Np1 -i ../../0008-fix-change-some-X11-specific-ifdefs-to-linux.patch
  patch -Np1 -i ../../0009-Remove-unnecessary-ozone-ifdefs-in-native-window-vie.patch
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
  python2 src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json
  cd src/electron
  yarn install --frozen-lockfile
  cd ..

  echo "Applying local Chromium patches..."
  patch -Np0 -i ../chromium-skia-harmony.patch
  patch -Np1 -i ../media-Set-allocation-limit-compatible-with-FFmpeg-4.3.patch
  patch -Np1 -i ../use-system-libraries-in-node.patch
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

  gn gen out/Release \
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
