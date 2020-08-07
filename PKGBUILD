# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=electron6
pkgver=6.1.9
_commit=26ee9476def66d6a57f12df9918145c303afa4ff
_chromiumver=76.0.3809.146
pkgrel=7
pkgdesc='Build cross platform desktop apps with web technologies'
arch=('x86_64')
url='https://electronjs.org/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2'
         'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
makedepends=('clang' 'git' 'gn-m76' 'gperf' 'harfbuzz-icu' 'java-runtime-headless'
             'jsoncpp' 'libnotify' 'lld' 'llvm' 'ninja' 'npm' 'pciutils'
             'python2' 'wget' 'yasm')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
source=('git+https://github.com/electron/electron.git'
        'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git'
        'electron6.desktop'
        'default_app-icon.patch'
        'use-system-libraries-in-node.patch'
        'icu65.patch'
        'icu67.patch'
        'chromium-gcc10.patch'
        'angle-gcc10.patch'
        'perfetto-gcc10.patch'
        'webrtc-gcc10.patch'
        'glslang-remove-setAllocator.patch'
        'chromium-ffmpeg-4.3.patch'
        'chromium-skia-harmony.patch')
sha512sums=('SKIP'
            'SKIP'
            'f2384d851478507b8b76ada5822d021b0ab86e6cb7d078294171cf43935f3362f383b8399fa29acd11f021df5f43c3a0337b173702313c4533946bb36b7e512d'
            '81a959a2873e868bb9394b1e5371d8c77f13f47d88c070016394188e96420ed64c8d6efa518e854f302ec4e6e7e17888d508f6a3598f433f6f82b8507639c0b7'
            '147563fe422108598af26c617edf78d146d4e70223e3093216d5f63a1ab051eff95abd0c8f8c0b6f8a504ae26557d65cd0ffd90c542d6534176b72b99ea44a5e'
            'd109937c4a5fba96e82d6fbc7b804943010d5723eef91af4f79355c8b84214da3978fc784dd0fcc3ed228c4684d0d06cf8cd21fa32fc5ec80c00d1bb4e3b9c90'
            'b46eeef32c7c773babe15da0c118ca55bf3c084142592695853a73f80b5dc55336cad72636f8ed2308fe9c10bcab953e37ca7ab08f20f545b881fe99a543d247'
            '682cbc25a332ea30e2475fc39fa8e6ce395f65b974520121ccf7be90b7744b0f9b98313e2d9ac0e56a0e41fd444e8dec80a7e8565b7e91508bfe8234e4105f6b'
            'fd8e523b657205ed1cb64581bd9e5597183c1575f0d0523dcc708e3b67e4ff2dcb962b41254b7ad7b180a317161ab47b7e262d2321ac1b21718c3b1bccc54c3e'
            '047606dacc67dc689bac9d30540331c4f4a56f5ff664115c779b13376918a0279fa0466099aa5e36a6541faa7479ae567ac50a4d4b482cdc34c95ae04aceb51d'
            'a4340a6b338768d51600853d101f7b4e06c7b733bda71f1e193c457edac3bb07887f7c307e60e26edf2fda47986788df8c4645b6ce26dae0d1e0b091f4520e91'
            'e34562b4b6cf4f0afa3f23afe7336fed4614201b39bfb73871899081161f5927d273c1da14b3ab7edeeb803300ba6e07c1ddf7261e8be12555cbfc4fe0a0d23c'
            '70c30709a9bb6abc7a61a17cdc90cb2c4bad907f13f3bdd595906d87f7ad9a45100f237885e08d3dd4373a19a0716e8a4fa72a3950b7f779c8755cf0349f63d2'
            '6fa7c5f737b3f86274b1f768aadf863dd7542fca9c8885d5c3804590bd04c288394c54b2003234be37d961f48b5470ce15254ba64b2716f8aceb181e1fd3c7c0')

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
              'zlib')

prepare() {
  mkdir -p "$srcdir"/python2-path
  ln -sf /usr/bin/python2 "$srcdir"/python2-path/python
  export PATH="$srcdir/python2-path:$PATH:$srcdir/depot_tools"

  echo 'Fetching chromium...'
  git clone --branch=$_chromiumver --depth=1 https://chromium.googlesource.com/chromium/src.git

  echo "solutions = [
  {
    \"name\": \"src/electron\",
    \"url\": \"file://$srcdir/electron@$_commit\",
    \"deps_file\": \"DEPS\",
    \"managed\": False,
    \"custom_deps\": {
      \"src\": None,
    },
    \"custom_vars\": {},
  },
]" > .gclient

  python2 "$srcdir"/depot_tools/gclient.py sync \
      --with_branch_heads \
      --with_tags \
      --nohooks

  sed -e "s/'am'/'apply'/" -i src/electron/script/lib/git.py

  echo 'Running hooks...'
  # python2 "$srcdir"/depot_tools/gclient.py runhooks
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
  vpython src/chrome/android/profiles/update_afdo_profile.py
  python2 src/electron/script/apply_all_patches.py \
      src/electron/patches/common/config.json
  cd src/electron
  npm install
  cd ..

  echo 'Patching Chromium for using system libraries...'
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
      tools/generate_shim_headers/generate_shim_headers.py
  for lib in "${_system_libs[@]}" libjpeg_turbo; do
      third_party_dir=third_party/"$lib"
      if [ ! -d "$third_party_dir" ]; then
        third_party_dir=base/"$third_party_dir"
      fi
      find "$third_party_dir" -type f \
          \! -path "$third_party_dir/chromium/*" \
          \! -path "$third_party_dir/google/*" \
          \! -path 'third_party/yasm/run_yasm.py' \
          \! -regex '.*\.\(gn\|gni\|isolate\)' \
          -delete
  done
  python2 build/linux/unbundle/replace_gn_files.py \
      --system-libraries \
      "${_system_libs[@]}"

  echo 'Applying local patches...'
  patch -Np1 -i ../chromium-ffmpeg-4.3.patch
  patch -Np0 -i ../chromium-skia-harmony.patch
  patch -Np1 -i ../icu65.patch
  patch -Np1 -d v8 <../icu67.patch
  patch -Np1 -i ../chromium-gcc10.patch
  patch -Np1 -d third_party/angle <../angle-gcc10.patch
  patch -Np1 -d third_party/perfetto <../perfetto-gcc10.patch
  patch -Np1 -d third_party/webrtc <../webrtc-gcc10.patch
  patch -Np1 -d third_party/glslang/src <../glslang-remove-setAllocator.patch
  patch -Np1 -i ../use-system-libraries-in-node.patch
  patch -Np1 -i ../default_app-icon.patch  # Icon from .desktop file
}

build() {
  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  cd src
  export CHROMIUM_BUILDTOOLS_PATH="$PWD"/buildtools
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
  gn-m76 gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") $GN_EXTRA_ARGS"
  ninja -C out/Release electron
  # Strip before zip to avoid
  # zipfile.LargeZipFile: Filesize would require ZIP64 extensions
  strip -s out/Release/electron
  ninja -C out/Release electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}

package() {
  install -dm755 "$pkgdir"/usr/lib/$pkgname
  bsdtar -xf src/out/Release/dist.zip -C "$pkgdir"/usr/lib/$pkgname

  chmod u+s "$pkgdir"/usr/lib/$pkgname/chrome-sandbox

  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  for l in "$pkgdir"/usr/lib/$pkgname/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      $(realpath --relative-to="$pkgdir"/usr/share/licenses/$pkgname $l) \
      "$pkgdir"/usr/share/licenses/$pkgname
  done

  install -dm755 "$pkgdir"/usr/bin
  ln -s ../lib/$pkgname/electron "$pkgdir"/usr/bin/$pkgname

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 -t "$pkgdir"/usr/share/applications $pkgname.desktop
  install -Dm644 src/electron/default_app/icon.png \
          "$pkgdir"/usr/share/pixmaps/$pkgname.png  # hicolor has no 1024x1024
}
