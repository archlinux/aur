# Maintainer:
# Contributor: éclairevoyant

## options
: ${_build_lto:=false}
: ${_build_system_libs:=true}

: ${_commit=ESR128}

_pkgname="midori"
pkgname="$_pkgname-git"
pkgver=11.6.r23.gcc19b4f
pkgrel=1
pkgdesc="Web browser based on Floorp"
url="https://github.com/goastian/midori-desktop"
license=('MPL-2.0')
arch=('x86_64')

depends=(
  dbus
  ffmpeg
  gtk3
  libevent
  libjpeg
  libvpx.so
  libwebp.so
  libxss
  libxt
  mime-types
  nspr
  nss
  ttf-font
  zlib
)
makedepends=(
  cargo
  cbindgen
  clang
  diffutils
  dump_syms
  git
  imake
  inetutils
  jack
  lld
  llvm
  mercurial
  mesa
  nasm
  nodejs
  python
  python-setuptools
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  yasm
  zip
)
optdepends=(
  'hunspell-dictionary: Spell checking'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)

options=(
  !debug
  !emptydirs
  !lto
  !makeflags
  !strip
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="midori-tensei"
source=(
  "$_pkgsrc"::"git+https://github.com/goastian/midori-desktop.git#commit=${_commit:?}"
  "$_pkgname.desktop"
)
sha256sums=(
  'SKIP'
  '7ef0f85f2b111caa08a3e855cb4b6595b6d0f62b3de13ce59eea94a580eec470'
)

pkgver() {
  cd "$_pkgsrc"
  local _file _hash _ver _rev _commit
  _file="browser/config/version_display.txt"
  read -r _hash _ver < <(
    NL=$(awk '/^[[:digit:]]+/{n=NR}END{print n}' "$_file")

    git blame -L "$NL,+1" -- "$_file" \
      | awk '{print $1" "$NF }' \
      | sed -E -e 's& v([[:digit:]]+)& \1&'
  )
  _rev=$(git rev-list --count --cherry-pick "$_hash"...HEAD)
  _commit=$(git rev-parse --short=7 HEAD)

  printf "%s.r%s.g%s" "${_ver:?}" "${_rev:?}" "${_commit::7}"
}

prepare() (
  mkdir -p mozbuild
  cd "$_pkgsrc"

  git submodule update --init --recursive --depth=1

  # clear forced startup pages
  sed -E -e 's&^\s*pref\("startup\.homepage.*$&&' -i "browser/branding/official/pref/firefox-branding.js"

  # prepare api keys
  cp "floorp/apis"/api-*-key ./

  # configure
  cat > ../mozconfig << END
ac_add_options --enable-application=browser
ac_add_options --disable-artifact-builds
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-rust-simd
ac_add_options --enable-wasm-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --with-app-basename=$_pkgname
ac_add_options --with-app-name=$_pkgname
ac_add_options --with-branding=browser/branding/official
ac_add_options --enable-update-channel=nightly
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$_pkgname
MOZ_REQUIRE_SIGNING=

# Floorp Upstream
ac_add_options --with-l10n-base=${PWD@Q}/floorp/browser/locales/l10n-central

# Keys
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/api-mozilla-key
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/api-google-location-service-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/api-google-safe-browsing-key

# Features
ac_add_options --enable-alsa
ac_add_options --enable-av1
ac_add_options --enable-eme=widevine
ac_add_options --enable-jack
ac_add_options --enable-jxl
ac_add_options --enable-proxy-bypass-protection
ac_add_options --enable-pulseaudio
ac_add_options --enable-sandbox
ac_add_options --enable-unverified-updates
ac_add_options --enable-webrtc
ac_add_options --disable-crashreporter
ac_add_options --disable-default-browser-agent
ac_add_options --disable-parental-controls
ac_add_options --disable-tests
ac_add_options --disable-updater

# Disables Telemetry by Default
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

# Debugging
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-debug-js-modules
ac_add_options --enable-strip
ac_add_options --enable-install-strip
export STRIP_FLAGS="--strip-debug --strip-unneeded"

# Optimization
ac_add_options --enable-optimize
ac_add_options OPT_LEVEL="2"
ac_add_options RUSTC_OPT_LEVEL="2"

# Other
export AR=llvm-ar
export CC=clang
export CXX=clang++
export NM=llvm-nm
export RANLIB=llvm-ranlib
END

  if [[ "${_build_system_libs::1}" == "t" ]]; then
    cat >> ../mozconfig << END
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-webp
ac_add_options --with-system-zlib
END
  fi

  if [[ "${_build_lto::1}" == "t" ]]; then
    cat >> ../mozconfig << END
ac_add_options --enable-lto=cross,full
END
  fi
)

build() (
  cd "$_pkgsrc"

  export RUSTUP_TOOLCHAIN=stable

  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$srcdir/xdg-runtime}"
  [ ! -d "$XDG_RUNTIME_DIR" ] && mkdir -pm700 "${XDG_RUNTIME_DIR:?}"

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # error: "STL code can only be used with -fno-exceptions"
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO/PGO needs more open files
  ulimit -n 4096

  echo "Building browser..."
  cat > .mozconfig ../mozconfig

  ./mach build --priority normal
)

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$vendorjs" << END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);

// Enable JPEG XL images
pref("image.jxl.enabled", true);

// Prevent about:config warning
pref("browser.aboutConfig.showWarning", false);

// Prevent telemetry notification
pref("services.settings.main.search-telemetry-v2.last_check", $(date +%s));
END

  local distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$distini" << END
[Global]
id=archlinux
version=rolling
about=Midori for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  # search provider
  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini"
  install -Dm644 /dev/stdin "$sprovider" << END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/}/SearchProvider
Version=2
END

  # Replace duplicate binary
  ln -sf "$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"

  # desktop file
  install -Dm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # icons
  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
}
