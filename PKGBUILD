# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
## Arch Linux's maintainers:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-pure
pkgver=152.0.4
pkgrel=1
pkgdesc="Fast, Private & Safe Web Browser"
url="https://www.mozilla.org/firefox/"
arch=(x86_64)
license=(MPL-2.0)
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  firefox-settings
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  icu
  libevent
  libjpeg-turbo
  libpulse
  libvpx
  libwebp
  mime-types
  nspr
  nss
  pango
  ttf-font
  zlib
)
makedepends=(
  cbindgen
  clang
  diffutils
  imake
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  rust
  tinywl
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  yasm
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !emptydirs
  !lto
  !makeflags
  !ccache
)
provides=("firefox" "firefox=${pkgver}")
conflicts=(firefox)
source=(
  "https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz"
  "firefox-symbolic.svg"
  "firefox.desktop"
  "org.mozilla.firefox.metainfo.xml"
  "0001-Install-under-remoting-name.patch"
)
sha256sums=(
  'fd89982202cda5353a27307d85d48902d46576d46d1c9e36d55740e63b5216bb'
  'a9b8b4a0a1f4a7b4af77d5fc70c2686d624038909263c795ecc81e0aec7711e9'
  '71fe797430198ac8c00b538dce537284cf526e48be0496698cf5a980d70c16da'
  '23f557fa7989adcae03cc9458d94716981dbcf0e9d6d52a289a2426e50b4b785'
  'a7364ddb3b6eab922873f35731ed5cfb61e8022a35d54edd2f80b95a4f5625ed'
)

prepare() {
  mkdir mozbuild
  cd "firefox-$pkgver"

  # Make different channels installable in parallel
  patch -Np1 -i "${srcdir}"/0001-Install-under-remoting-name.patch

  # Unset variables to prevent issues with PGO profiling
  unset \
    DBUS_SESSION_BUS_ADDRESS \
    DISPLAY \
    ORBIT_SOCKETDIR \
    SESSION_MANAGER \
    XAUTHORITY \
    XDG_CACHE_HOME \
    XDG_SESSION_COOKIE

  export LLVM_PROFDATA="llvm-profdata"

  cat >../mozconfig <<END
ac_add_options --enable-project=browser
ac_add_options --disable-artifact-builds
ac_add_options MOZ_PGO=1
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-rust-simd
ac_add_options --enable-wasm-simd
ac_add_options --enable-lto=cross,full
ac_add_options --enable-linker=lld
ac_add_options --enable-jemalloc
ac_add_options --enable-replace-malloc
ac_add_options --disable-cargo-incremental
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland-only

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZ_APP_REMOTINGNAME=firefox

# System libraries
ac_add_options --with-system-libevent
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-libvpx
ac_add_options --with-system-webp
ac_add_options --with-system-jpeg
ac_add_options --with-system-zlib

# Optimization
ac_add_options --enable-optimize=-O3
ac_add_options OPT_LEVEL="3"
ac_add_options RUSTC_OPT_LEVEL="3"

# Features
ac_add_options --enable-alsa
ac_add_options --enable-pulseaudio
ac_add_options --enable-jxl
ac_add_options --disable-real-time-tracing
ac_add_options --disable-webdriver
ac_add_options --disable-accessibility
ac_add_options --disable-wmf
ac_add_options --disable-legacy-profile-creation
ac_add_options --disable-negotiateauth
ac_add_options --disable-synth-speechd
ac_add_options --disable-necko-wifi
ac_add_options --disable-webspeech
ac_add_options --disable-webspeechtestbackend
ac_add_options --disable-jack
ac_add_options --disable-parental-controls
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
ac_add_options --disable-rust-tests
ac_add_options --disable-debug
ac_add_options --disable-debug-js-modules
ac_add_options --disable-debug-symbols
ac_add_options --enable-strip
ac_add_options --enable-install-strip

# Fuck telemetry
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_NORMANDY=0
mk_add_options MOZ_TELEMETRY_REPORTING=0
END
}

build() {
  local VIRTWL VIRTWL_PID

  cd "firefox-$pkgver"

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1
  export DISABLE_TELEMETRY=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  echo "Building browser..."
  cat >.mozconfig ../mozconfig

  # Export XDG_RUNTIME_DIR for tinywl
  XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"
  mkdir -pm 0700 "$XDG_RUNTIME_DIR"
  export XDG_RUNTIME_DIR

  # Run tinywl compositor for PGO profiling
  coproc VIRTWL {
    WLR_RENDERER=pixman WLR_BACKENDS=headless \
      exec dbus-run-session -- tinywl -s 'echo $WAYLAND_DISPLAY; read _; kill $PPID'
  }
  local -x WAYLAND_DISPLAY
  read WAYLAND_DISPLAY <&${VIRTWL[0]}

  ./mach build

  exec {VIRTWL[0]}<&- {VIRTWL[1]}>&-
  rm -rf "${XDG_RUNTIME_DIR}"
}

package() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local distini="$pkgdir/usr/lib/firefox/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=firefox
app.partner.archlinux=archlinux
END

  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/firefox.svg"

  install -Dvm644 ../firefox-symbolic.svg -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dvm644 ../firefox.desktop -t "$pkgdir/usr/share/applications"
  install -Dvm644 ../org.mozilla.firefox.metainfo.xml -t "$pkgdir/usr/share/metainfo"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/firefox" <<END
#!/bin/sh
exec /usr/lib/firefox/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/firefox" "$pkgdir/usr/lib/firefox/firefox-bin"
}

# vim:set sw=2 sts=-1 et:
