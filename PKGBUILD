# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Nicola Squartini <tensor5@gmail.com>
# Contributor: Valentin Hăloiu <vially.ichb@gmail.com>

pkgname=electron-ozone
pkgver=9.3.1
provides=('electron')
conflicts=('electron')
_commit=fe3378db92b76bd4dd14c11365c229a8be9954a7
_chromiumver=83.0.4103.122
pkgrel=2
pkgdesc='Electron compiled with wayland support via Ozone'
arch=('x86_64')
url='https://electronjs.org/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2'
         'libxslt' 'libxss' 'minizip' 'nss' 'snappy')
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
        'v8-remove-soon-to-be-removed-getAllFieldPositions.patch'
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
            'c7eadac877179e586d0cce7f898aa1462b4c207733e68ecc17de9754b691713a'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            'e042024423027ad3ef729a7e4709bdf9714aea49d64cfbbf46a645a05703abc2'
            '3a9b265ebc978d6b5b165c0c0098e6e26db7ce41ae33daca01e5201bd151e72e'
            '28e87512ae5f3be5ce5312e6aedd26bffa2d26b3bca89f9e568d6b044ad16753'
            '7e78b61a71609a041f2a45f4c20bd9f89fb4ccb6c48b2abb61faf474fcdd10e0'
            '0e1e1c1980ac6c8de7918b74ec3949fe54addbf89f12d4b4ecfd537549b572b4'
            'f554de4c173ec3fb0d128fe72a3677ecbecfb74eea07b8a0fb0057b7e44e540c'
            'd5dc4b7f050640daa015dd28b0aaba8b86681c3bb35288579c7bc10bb24f13c3'
            '03d57fe77c7f4ad5f86e6f9e276b6e973b48df194e2bb56d7e24257924e16ec7'
            'd95a64cef0371910c19447549d53fa7155dcb17b6daa8a15a6964d34694bf5c8'
            'bf0e01722870f54e773ea674b7eec03c0cc3740b361d45654d4888004b410884')

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
              'libvpx'
              'libwebp'
              'libxml'
              'libxslt'
              'openh264'
              'opus'
               # 're2' Not possible with custom libcxx
              'snappy'
              'yasm'
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

  echo "Applying local Chromium patches..."
  patch -Np0 -i ../chromium-skia-harmony.patch
  patch -Np1 -d v8 <../v8-remove-soon-to-be-removed-getAllFieldPositions.patch
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
          \! -path 'third_party/yasm/run_yasm.py' \
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
    'linux_use_bundled_binutils = false'
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
