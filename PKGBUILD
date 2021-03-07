# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=electron9
pkgver=9.4.3
_commit=ca82414364002efa665ffa7427e267adf76ed1f3
_chromiumver=83.0.4103.122
pkgrel=1
pkgdesc='Build cross platform desktop apps with web technologies'
arch=('x86_64')
url='https://electronjs.org/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss'
         'minizip' 'nss' 're2' 'snappy')
makedepends=('clang' 'git' 'gn-m85' 'gperf' 'harfbuzz-icu' 'java-runtime-headless'
             'jsoncpp' 'libnotify' 'lld' 'llvm' 'ninja' 'npm' 'pciutils' 'yarn'
             'python2' 'wget' 'yasm')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'libappindicator-gtk3: StatusNotifierItem support'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
source=('git+https://github.com/electron/electron.git'
        'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git'
        'electron9.desktop'
        'default_app-icon.patch'
        'use-system-libraries-in-node.patch'
        'add-missing-algorithm-header-in-crx_install_error.cc.patch'
        'avoid-double-destruction-of-ServiceWorkerObjectHost.patch'
        'chromium-83-gcc-10.patch'
        'chromium-ffmpeg-4.3.patch'
        'qt5-webengine-glibc-2.33.patch'
        'chromium-skia-harmony.patch'
        'clean-up-a-call-to-set_utf8.patch'
        'include-memory-header-to-get-the-definition-of-std-u.patch'
        'iwyu-std-numeric_limits-is-defined-in-limits.patch'
        'libstdc-fix-incomplete-type-in-AXTree-for-NodeSetSiz.patch'
        'make-some-of-blink-custom-iterators-STL-compatible.patch'
        'v8-remove-soon-to-be-removed-getAllFieldPositions.patch'
       )
sha256sums=('SKIP'
            'SKIP'
            '93236bbc903c6b990e6562f0aed33ebe67c1ee365b7ffd094a2febcd3a5cad76'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            'c7eadac877179e586d0cce7f898aa1462b4c207733e68ecc17de9754b691713a'
            '0e2a78e4aa7272ab0ff4a4c467750e01bad692a026ad9828aaf06d2a9418b9d8'
            'd793842e9584bf75e3779918297ba0ffa6dd05394ef5b2bf5fb73aa9c86a7e2f'
            '3e5ba8c0a70a4bc673deec0c61eb2b58f05a4c784cbdb7c8118be1eb6580db6d'
            '5390304b5f544868985ce00a3ec082d4ece2dacb1c73cdb35dd4facfea12449a'
            '5600cfa40254fa3fa2cb541d3b55cc8f7a9231de8d2830c25a7651aa392de16f'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            '58c41713eb6fb33b6eef120f4324fa1fb8123b1fbc4ecbe5662f1f9779b9b6af'
            '071326135bc25226aa165639dff80a03670a17548f2d2ff5cc4f40982b39c52a'
            '675fb3d6276cce569a641436465f58d5709d1d4a5f62b7052989479fd4aaea24'
            '50687079426094f2056d1f4806dc30fc8d6bad16190520e57ba087ec5db1d778'
            '3d7f20e1d2ee7d73ed25e708c0d59a0cb215fcce10a379e3d48a856533c4b0b7'
            'e042024423027ad3ef729a7e4709bdf9714aea49d64cfbbf46a645a05703abc2'
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
#              'libpng'
              'libvpx'
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

  echo "Applying local patches..."
  patch -Np1 -i ../add-missing-algorithm-header-in-crx_install_error.cc.patch
  patch -Np1 -i ../avoid-double-destruction-of-ServiceWorkerObjectHost.patch
  patch -Np1 -i ../chromium-83-gcc-10.patch
  patch -Np1 -i ../chromium-ffmpeg-4.3.patch
  patch -Np0 -i ../chromium-skia-harmony.patch
  patch -Np4 -i ../qt5-webengine-glibc-2.33.patch
  patch -Np1 -i ../clean-up-a-call-to-set_utf8.patch
  patch -Np1 -i ../include-memory-header-to-get-the-definition-of-std-u.patch
  patch -Np1 -F3 -i ../iwyu-std-numeric_limits-is-defined-in-limits.patch
  patch -Np1 -i ../libstdc-fix-incomplete-type-in-AXTree-for-NodeSetSiz.patch
  patch -Np1 -i ../make-some-of-blink-custom-iterators-STL-compatible.patch
  patch -Np1 -d v8 <../v8-remove-soon-to-be-removed-getAllFieldPositions.patch
  patch -Np1 -i ../use-system-libraries-in-node.patch
  patch -Np1 -i ../default_app-icon.patch  # Icon from .desktop file

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
  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  # Workaround for building with ICU 68.x
  CPPFLAGS+=' -DU_DEFINE_FALSE_AND_TRUE=1'

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  cd src
  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  GN_EXTRA_ARGS='
    blink_symbol_level = 0
    clang_use_chrome_plugins = false
    custom_toolchain = "//build/toolchain/linux/unbundle:default"
    host_toolchain = "//build/toolchain/linux/unbundle:default"
    icu_use_data_file = false
    is_component_ffmpeg = false
    link_pulseaudio = true
    linux_use_bundled_binutils = false
    treat_warnings_as_errors = false
    use_custom_libcxx = false
    use_gnome_keyring = false
    use_sysroot = false
  '
  gn-m85 gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${GN_EXTRA_ARGS}"
  ninja -C out/Release electron
  # Strip before zip to avoid
  # zipfile.LargeZipFile: Filesize would require ZIP64 extensions
  strip -s out/Release/electron
  ninja -C out/Release electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}

package() {
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  bsdtar -xf src/out/Release/dist.zip -C "${pkgdir}/usr/lib/${pkgname}"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for l in "${pkgdir}/usr/lib/${pkgname}"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      $(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname}" ${l}) \
      "${pkgdir}/usr/share/licenses/${pkgname}"
  done

  install -dm755 "${pkgdir}"/usr/bin
  ln -s ../lib/${pkgname}/electron "${pkgdir}"/usr/bin/${pkgname}

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 -t "${pkgdir}/usr/share/applications" ${pkgname}.desktop
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"  # hicolor has no 1024x1024
}
