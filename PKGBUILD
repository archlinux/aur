# Maintainer: Sasha Marie te Rehorst <sasha.marieterehorst@gmail.com>
pkgbase=zen-browser-git
pkgname=("$pkgbase")
pkgver=1.18.1b.r6282.g9b6937650
pkgrel=1
pkgdesc='Zen Browser Twilight (Git version)'
url='https://zen-browser.app/'
arch=('x86_64')
license=(MPL-2.0)
depends=(
  alsa-lib at-spi2-core bash cairo dbus ffmpeg fontconfig freetype2 gcc-libs
  gdk-pixbuf2 glib2 glibc gtk3 hicolor-icon-theme libpulse libx11 libxcb
  libxcomposite libxdamage libxext libxfixes libxrandr libxss libxt mime-types
  nspr nss pango ttf-font adwaita-icon-theme libnotify
)
makedepends=(
  git pnpm rsync cbindgen clang diffutils imake lld llvm mesa nasm nodejs
  python rust unzip wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi
  xorg-server-xvfb yasm zip mold jq wget
)
options=(!emptydirs !makeflags !debug !lto)

_repo='https://github.com/zen-browser/desktop'
source=(
  "git+$_repo.git"
  "firefox-l10n::git+https://github.com/mozilla-l10n/firefox-l10n"
  zen-browser.desktop
  0003-do-not-disable-system-extensions.zen.patch
  0005-source-firefox-language-packs.patch
)
sha256sums=('SKIP'
            'SKIP'
            'b16a9e39033e6172d6593b832aed747c50e3264326c50d04f47a168ed3f63c76'
            '36bff2af04da55da0cc71f960d921889ccf21c11fcd8343087c144dfcc50f10a'
            '7702c197f5509e4ec7e744f74105cc8339b631e37f7a0b41bf3070bf3ccc92a7')

pkgver() {
  cd desktop
  local _tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "0.0.0")
  local _safe_ver="${_tag//-/.}"
  printf "%s.r%s.g%s" "$_safe_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_OBJ_DIR=obj

prepare() {
  cd desktop
  git checkout .
  git clean -fdx

  _zen_engine_version=$(jq -r '.version.version' surfer.json)
  if [ "$_zen_engine_version" == "null" ] || [ -z "$_zen_engine_version" ]; then return 1; fi

  local _ff_tarball="firefox-${_zen_engine_version}.source.tar.xz"
  local _ff_url="https://archive.mozilla.org/pub/firefox/releases/${_zen_engine_version}/source/${_ff_tarball}"
  
  if ! curl --output /dev/null --silent --head --fail "$_ff_url"; then
      _ff_url="https://archive.mozilla.org/pub/firefox/candidates/${_zen_engine_version}-candidates/build1/source/${_ff_tarball}"
  fi
  if [ ! -f "$srcdir/$_ff_tarball" ]; then
      wget -O "$srcdir/$_ff_tarball" "$_ff_url"
  fi

  git submodule init
  git config submodule.l10n.url "$srcdir/l10n"
  git -c protocol.file.allow=always submodule update

  git apply -3 "$srcdir"/0003-do-not-disable-system-extensions.zen.patch || true
  patch -Np1 -i ../0005-source-firefox-language-packs.patch || true

  jq '(.pnpm.onlyBuiltDependencies += ["sharp"]) | del(.devDependencies["eslint-plugin-spidermonkey-js"])' package.json > temp.json && mv temp.json package.json

  pnpm config set store-dir "$srcdir"/pnpm-store
  pnpm install --no-frozen-lockfile

  pnpm surfer ci --brand release --display-version "$_zen_engine_version"
  install -Dvm644 "$srcdir/$_ff_tarball" -t "./.surfer/engine"
  pnpm surfer download
  env SURFER_COMPAT="$CARCH" pnpm surfer import

  srcdir="$srcdir" sh scripts/download-language-packs.sh

  cat >mozconfig <<END
mk_add_options MOZ_OBJDIR=${srcdir}/$_OBJ_DIR
ac_add_options --prefix=/usr
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --disable-debug
ac_add_options --disable-tests
ac_add_options --enable-linker=mold
ac_add_options --enable-lto
ac_add_options --disable-frame-pointers
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
ac_add_options --allow-addon-sideload
export MOZ_APP_REMOTINGNAME=$pkgbase
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --target=x86_64-pc-linux-gnu
END
}

_mach() {
  "$srcdir/desktop/engine/mach" "$@"
}

build() {
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_BUILD_DATE
  export MOZ_NOSPAM=1
  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export NM=llvm-nm
  export RANLIB=llvm-ranlib

  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  ulimit -n 4096
  unset MOZ_PGO
  
  (
    cd "$srcdir/desktop"
    if [ -f "./engine/build/clang-plugin/moz.build" ]; then
        sed -i 's/clangASTMatchers/clang-cpp/g' ./engine/build/clang-plugin/moz.build
    fi

    pnpm run ffprefs
    
    env SURFER_COMPAT="$CARCH" SURFER_PLATFORM=linux ZEN_RELEASE_BRANCH=release ZEN_RELEASE=1 \
    dbus-run-session xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    pnpm surfer build --skip-patch-check
  )

  local _l10n_dir="$srcdir/l10n"
  if [ -d "$_l10n_dir" ]; then
    for _lang_dir in "$_l10n_dir"/*; do
      if [ -d "$_lang_dir" ]; then
        _lang=$(basename "$_lang_dir")
        if [[ "$_lang" != "en-US" && "$_lang" != ".git" ]]; then
          _mach build "merge-$_lang" || true
          _mach build "langpack-$_lang" || true
        fi
      fi
    done
  fi
}

package_zen-browser-git() {
  provides=("zen-browser=$pkgver" "zen-browser")
  conflicts=("zen-browser" "zen-browser-bin")
  DESTDIR="$pkgdir" _mach install
  
  local _appdir="$pkgdir/usr/lib/$pkgbase"
  rm -rf "$_appdir"
  if [ -d "$pkgdir/usr/lib/zen" ]; then mv "$pkgdir/usr/lib/zen" "$_appdir"; fi

  ln -srvf "$_appdir"/zen "$_appdir/zen-bin"
  ln -srvf "$_appdir"/zen "$pkgdir"/usr/bin/zen-git

  install -Dvm644 "$srcdir"/desktop/build/AppDir/distribution/*.json -t "$_appdir/distribution" || true
  
  local _vendorjs="$_appdir/browser/defaults/preferences/vendor.js"
  mkdir -p "$(dirname "$_vendorjs")"
  echo 'pref("spellchecker.dictionary_path", "/usr/share/hunspell");' >> "$_vendorjs"
  echo 'pref("intl.locale.requested", "");' >> "$_vendorjs"

  local _dist_dir="$srcdir/obj/dist"
  find "$_dist_dir" -name "*.langpack.xpi" -exec install -Dvm644 {} "$pkgdir/usr/lib/$pkgbase/browser/extensions/" \;

  install -Dvm644 "$srcdir"/zen-browser.desktop "$pkgdir/usr/share/applications/$pkgbase.desktop"

  for i in 16 32 48 64 128; do
    install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    ln -srvf \
      "$_appdir/browser/chrome/icons/default/default${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgbase.png"
  done
  
  local _svg_icon="$srcdir/desktop/docs/assets/zen-black.svg"
  if [ -f "$_svg_icon" ]; then
      install -Dvm644 "$_svg_icon" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgbase.svg"
  fi

  sed -i "s|Icon=.*|Icon=$pkgbase|g" "$pkgdir/usr/share/applications/$pkgbase.desktop"
  sed -i "s|Exec=.*|Exec=/usr/lib/zen-browser-git/zen %u|g" "$pkgdir/usr/share/applications/$pkgbase.desktop"
  
  echo "StartupWMClass=zen-alpha" >> "$pkgdir/usr/share/applications/$pkgbase.desktop"
  echo "StartupWMClass=zen" >> "$pkgdir/usr/share/applications/$pkgbase.desktop"
  echo "StartupWMClass=Zen Browser" >> "$pkgdir/usr/share/applications/$pkgbase.desktop"
}
