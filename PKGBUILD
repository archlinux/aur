# Maintainer: Nico Marinò <niconotnicko@gmail.com>
# Based on the Arch Linux firefox package by Jan Alexander Steffens (heftig).
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
# SPDX-License-Identifier: 0BSD

pkgname=firefox-vrr
pkgver=156.0.1
pkgrel=2
pkgdesc='Firefox with a monitor-aware Wayland software vsync patch for VRR'
arch=(x86_64)
url='https://github.com/ImJstNickDev/firefox-vrr'
license=(MPL-2.0)
depends=(
  alsa-lib at-spi2-core bash cairo dbus ffmpeg fontconfig freetype2 gdk-pixbuf2
  glib2 glibc 'gtk3>=3.22' hicolor-icon-theme libgcc libpulse libstdc++ libx11
  libxcb libxcomposite libxdamage libxext libxfixes libxrandr libxss libxt
  mime-types nspr nss pango ttf-font
)
makedepends=(
  cbindgen clang diffutils imake jack lld llvm mesa nasm nodejs onnxruntime
  python rust sccache unzip wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi
  xorg-server-xvfb yasm zip
)
optdepends=(
  'hunspell-dictionary: spell checking'
  'libnotify: notification integration'
  'networkmanager: location detection'
  'onnxruntime: local machine learning features'
  'speech-dispatcher: text-to-speech'
  'xdg-desktop-portal: screensharing with Wayland'
)
provides=("firefox=$pkgver")
conflicts=(firefox)
options=(!emptydirs !lto !makeflags !debug)
source=(
  "https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz"
  "https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz.asc"
  0001-Install-under-remoting-name.patch
  0002-wayland-software-vsync.patch
  build-resources.py
  firefox.desktop
  firefox-symbolic.svg
  vendor.js
  LICENSE.recipe
)
validpgpkeys=(14F26682D0916CDD81E37B6D61B7B526D98F0353)
# Mozilla Software Releases. Key fingerprint also pinned by Arch's firefox recipe.
sha256sums=(
  'f8b0bf733efebebf9af98ead537598c2cf56c2c1b9c06bf89220ea6731b64724'
  'SKIP'
  '8886b9f6109c1ec1d1f041d786e6a431766e2a06359f930ce07aaa6b84c6bef1'
  '24fd3228398c6e31e5591b6daeeb8a91d6d73d4f8784eef1b9d3e7fb6bb58b5c'
  'f8016a69712186694242965c1db8d6c2e3ab4e022f7168e056cf31c4e122011f'
  '5985c41a64dde6df3d31769ac57ddb59b94b1626aadb309fb488cdf6f3aa7015'
  'cb00ea359d6daf37900102307be4f515f1b7ef9c98825c64cc55bb562449d0d8'
  'b63f9e1a5b0c013c999cd984bd124aea31bfbf8ec8c9d8178df53ab2e559823e'
  '270621aee94e69bdbfb9ed5e87c1dca8d9fe686a20593243742a394d033e3dc6'
)

prepare() {
  cd "firefox-$pkgver" || return
  patch --batch --forward --fuzz=0 -Np1 <../0001-Install-under-remoting-name.patch
  patch --batch --forward --fuzz=0 -Np1 <../0002-wayland-software-vsync.patch

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=@TOPSRCDIR@/obj-vrr
ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-install-strip
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=local.firefox-vrr
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-updater
ac_add_options --disable-tests
ac_add_options --disable-cargo-incremental
ac_add_options --with-ccache=sccache
export MOZ_APP_REMOTINGNAME=firefox
END
}

build() {
  cd "firefox-$pkgver" || return
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  MOZ_BUILD_DATE=$(date -u --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m%d%H%M%S) || return
  export MOZ_BUILD_DATE
  export MOZ_NOSPAM=1
  export CARGO_INCREMENTAL=0
  export SCCACHE_DIR="${SCCACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/firefox-vrr/sccache}"
  export SCCACHE_IGNORE_SERVER_IO_ERROR=1
  local limits build_jobs link_jobs available_mib cpus
  limits=$(python "$srcdir/build-resources.py") || return
  read -r build_jobs link_jobs available_mib cpus <<<"$limits"
  printf 'Build resources: %s CPUs, %s MiB available; %s compile jobs, %s link jobs\n' \
    "$cpus" "$available_mib" "$build_jobs" "$link_jobs"
  export CARGO_BUILD_JOBS="$build_jobs"
  export RAYON_NUM_THREADS="$build_jobs"
  export LDFLAGS="$LDFLAGS -Wl,--threads=$link_jobs -Wl,--thinlto-jobs=$link_jobs"
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"
  ulimit -n 4096
  local pgo=${FIREFOX_VRR_PGO:-1} lto=${FIREFOX_VRR_LTO:-1}
  if [[ $pgo != [01] || $lto != [01] ]]; then
    printf '%s\n' 'FIREFOX_VRR_PGO and FIREFOX_VRR_LTO must be 0 or 1' >&2
    return 1
  fi
  if [[ $pgo == 1 ]]; then
    cat ../mozconfig >.mozconfig
    printf '%s\n' "mk_add_options MOZ_MAKE_FLAGS=-j$build_jobs" \
      'ac_add_options --enable-profile-generate=cross' >>.mozconfig
    ./mach build --priority normal || return
    ./mach package || return
    LLVM_PROFDATA=llvm-profdata JARLOG_FILE="$PWD/jarlog" \
      MOZ_ENABLE_WAYLAND=0 GDK_BACKEND=x11 \
      dbus-run-session -- xvfb-run -a -s '-screen 0 1920x1080x24 -nolisten local' \
      ./mach python build/pgo/profileserver.py || return
    [[ -s merged.profdata && -s jarlog ]] || return 1
    ./mach clobber objdir || return
  fi
  cat ../mozconfig >.mozconfig
  printf '%s\n' "mk_add_options MOZ_MAKE_FLAGS=-j$build_jobs" >>.mozconfig
  if [[ $pgo == 1 ]]; then
    cat >>.mozconfig <<END
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  fi
  if [[ $lto == 1 ]]; then
    printf '%s\n' 'ac_add_options --enable-lto=thin,cross' >>.mozconfig
  fi
  ./mach build --priority normal || return
  sccache --show-stats || true
}

package() {
  cd "firefox-$pkgver" || return
  DESTDIR="$pkgdir" ./mach install
  local appdir="$pkgdir/usr/lib/firefox"
  touch "$appdir/is-packaged-app"
  install -Dm644 "$srcdir/vendor.js" "$appdir/browser/defaults/preferences/vendor.js"
  install -Dm644 "$srcdir/firefox.desktop" "$pkgdir/usr/share/applications/firefox.desktop"
  install -Dm644 "$srcdir/LICENSE.recipe" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.recipe"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 toolkit/content/license.html "$pkgdir/usr/share/licenses/$pkgname/toolkit/content/license.html"

  local size
  for size in 16 22 24 32 48 64 128 256; do
    install -Dm644 "browser/branding/official/default$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/firefox.png"
  done
  install -Dm644 browser/branding/official/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/firefox.svg"
  install -Dm644 "$srcdir/firefox-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/firefox-symbolic.svg"
  install -Dm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
[Global]
id=firefox-vrr
version=$pkgver-$pkgrel
about=Wayland VRR patch by Nico Marinò - github.com/ImJstNickDev/firefox-vrr
END
  rm "$pkgdir/usr/bin/firefox"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/firefox" <<'END'
#!/bin/sh
exec /usr/lib/firefox/firefox "$@"
END
  ln -srf "$pkgdir/usr/bin/firefox" "$appdir/firefox-bin"
  ln -srv "$pkgdir/usr/lib/libonnxruntime.so" -t "$appdir"
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sf ../libnssckbi.so "$appdir/libnssckbi.so"
  fi
}
