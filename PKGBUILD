# Maintainer: Matthew <mattzilvar@gmail.com>
# Contributors: Seppia <seppia@seppio.fish>
# Contributors: Eloston
# Derived from official Chromium and Inox PKGBUILDS and ungoogled-chromium buildkit

pkgname=ungoogled-chromium-arm64
pkgver=76.0.3809.100
_rev=1
_archver=7f34e646009e66258e3d567728d0ac209ea7556c
pkgrel=${_rev}
_launcher_ver=6
pkgdesc="A lightweight approach to removing Google web service dependency"
arch=('aarch64')
url="https://github.com/Eloston/ungoogled-chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib' 'libva'
         'desktop-file-utils' 'hicolor-icon-theme' 'jsoncpp' 'openjpeg2')
makedepends=('python' 'python2' 'gperf' 'yasm' 'mesa' 'ninja' 'git'
             'clang' 'lld' 'gn' 'llvm' 'quilt')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
provides=('chromium')
conflicts=('chromium')
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        https://github.com/Eloston/ungoogled-chromium/archive/$pkgver-$pkgrel.tar.gz
        https://github.com/ungoogled-software/ungoogled-chromium-archlinux/archive/${_archver}.tar.gz
        gcc-9-fix.patch
        0001-crashpad-include-limits.patch)
sha256sums=('8cd93ada3e0837ced512f69783400991d3b82e0d9622e04fab5922877577d26d'
            '04917e3cd4307d8e31bfb0027a5dce6d086edb10ff8a716024fbb8bb0c7dccf1'
            '9458efb5d2313a4ee91c74df607037d4d89d827a42e2edcf84398482e9c00ac5'
            'e4997a75b5396ae5aaaabcf51cd873e745159df29f31ab14e7fac09d3c5b4a43'
            'dbebf3f50660c30e36ffdf05d9fc3abb338beed5510e051eaee6a2c3fe23a0fa'
            'df99f49ad58b70c9a3e1827d7e80b62e4363419334ed83373cf55b79c17b6f10')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [ffmpeg]=ffmpeg
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [libdrm]=
  [libevent]=libevent
  [libjpeg]=libjpeg
  #[libpng]=libpng            # https://crbug.com/752403#c10
  [libvpx]=libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  ${!_system_libs[@]}
  ${_system_libs[libjpeg]+libjpeg_turbo}
)
depends+=(${_system_libs[@]})

prepare() {
  _ungoogled_archlinux_repo="$srcdir/ungoogled-chromium-archlinux-${_archver}"
  _ungoogled_repo="$srcdir/ungoogled-chromium-$pkgver-$pkgrel"
  _utils="${_ungoogled_repo}/utils"

  cd "$srcdir/chromium-$pkgver"

#  msg2 'Fixing compile time bug on gcc9'
#  patch -p1 --ignore-whitespace -i ../gcc-9-fix.patch --no-backup-if-mismatch
  
  # Arch Linux ARM fixes
  patch -p1 -i ../0001-crashpad-include-limits.patch
  
  # Allow build to set march and options on AArch64 (crc, crypto)
  [[ $CARCH == "aarch64" ]] && CFLAGS=`echo $CFLAGS | sed -e 's/-march=armv8-a//'` && CXXFLAGS="$CFLAGS"
  
  msg2 'Pruning binaries'
  python "$_utils/prune_binaries.py" ./ "$_ungoogled_repo/pruning.list"
  msg2 'Applying patches'
  python "$_utils/patches.py" apply ./ "$_ungoogled_repo/patches" "$_ungoogled_archlinux_repo/patches"
  msg2 'Applying domain substitution'
  python "$_utils/domain_substitution.py" apply -r "$_ungoogled_repo/domain_regex.list" -f "$_ungoogled_repo/domain_substitution.list" -c domainsubcache.tar.gz ./

  # Force script incompatible with Python 3 to use /usr/bin/python2
  sed -i '1s|python$|&2|' third_party/dom_distiller_js/protoc_plugins/*.py

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find -type f -path "*third_party/$_lib/*" \
      \! -path "*third_party/$_lib/chromium/*" \
      \! -path "*third_party/$_lib/google/*" \
      \! -path './base/third_party/icu/*' \
      \! -path './third_party/crashpad/crashpad/third_party/zlib/zlib_crashpad.h' \
      \! -path './third_party/pdfium/third_party/freetype/include/pstables.h' \
      \! -path './third_party/yasm/run_yasm.py' \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  _ungoogled_archlinux_repo="$srcdir/ungoogled-chromium-archlinux-${_archver}"
  _ungoogled_repo="$srcdir/ungoogled-chromium-$pkgver-$pkgrel"

  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/chromium-$pkgver"

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
  fi

  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export NM=llvm-nm

  mkdir -p out/Default

  # Assemble GN flags
  cp "$_ungoogled_repo/flags.gn" "out/Default/args.gn"
  printf '\n' >> "out/Default/args.gn"
  cat "$_ungoogled_archlinux_repo/flags.archlinux.gn" >> "out/Default/args.gn"

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  msg2 'Configuring Chromium'
  gn gen out/Default --script-executable=/usr/bin/python2 --fail-on-unused-args
  msg2 'Building Chromium'
  ninja -C out/Default chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/chromium-$pkgver"

  install -D out/Default/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -Dm4755 out/Default/chrome_sandbox "$pkgdir/usr/lib/chromium/chrome-sandbox"
  ln -s /usr/lib/${pkgname#ungoogled-}/chromedriver "$pkgdir/usr/bin/chromedriver"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/chromium.desktop"
  install -Dm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/chromium.1"
  sed -i \
    -e "s/@@MENUNAME@@/Chromium/g" \
    -e "s/@@PACKAGE@@/chromium/g" \
    -e "s/@@USR_BIN_SYMLINK_NAME@@/chromium/g" \
    "$pkgdir/usr/share/applications/chromium.desktop" \
    "$pkgdir/usr/share/man/man1/chromium.1"

  cp \
    out/Default/{chrome_{100,200}_percent,resources}.pak \
    out/Default/{*.bin,chromedriver} \
    "$pkgdir/usr/lib/chromium/"
  install -Dm644 -t "$pkgdir/usr/lib/chromium/locales" out/Default/locales/*.pak

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Default/icudtl.dat "$pkgdir/usr/lib/chromium/"
  fi

  for size in 22 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
