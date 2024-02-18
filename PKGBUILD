# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Nikita Tarasov <nikatar@disroot.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

_pkgname=firefox
pkgname=firefox-globalmenu
pkgver=122.0.1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, with appmenu patch."
url="https://www.mozilla.org/firefox/"
arch=(x86_64)
license=(MPL-2.0)
depends=(
  dbus
  ffmpeg
  gtk3
  libpulse
  libxss
  libxt
  mime-types
  nss
  ttf-font)
makedepends=(
  cbindgen
  clang
  diffutils
  imake
  inetutils
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland')
options=(
  !emptydirs
  !lto
  !makeflags)
source=(
  "https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz"{,.asc}
  assert.patch
  unity-menubar.patch)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  '14F26682D0916CDD81E37B6D61B7B526D98F0353')
sha256sums=('36f19c9a748eec2fd6d3a1594d0f1d7b715eaa1d9ed6d7eeda9db8478dcf36d6'
            'SKIP'
            'ed84a17fa4a17faa70a0528556dbafeeb6ee59697451325881cb064b0ee8afec'
            '74440d292e76426ac5cba9058a6f86763c37a9aa61b7afc47771140f1f53870b')
b2sums=('ea4346b88c7f3e7e2126eed6b0f4b1460e70fa430944a7263d42ac762e10c8440967ebbae25ceff15e7afb451e1a890ab7e97ff60619a465152e9ff6a7691653'
        'SKIP'
        'bbc69752492649f288e0ceef6ce4a1703030cc98abd2442b7ebfba2be786eea643f594af5dc237a6e3c04fd0c8b147f529fd9e790f04c64b9f10abb3c826827f'
        '4b3837b398c5391ac036a59c8df51f9ad170b2d8c3d5d2011a63bacd9e24a81de4505ddf7ef722a0a6920b02bb8dbc2bb7b6f151e2aa7843baccec0572cc56c0')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  mkdir mozbuild
  cd firefox-$pkgver

  for patch in "${source[@]}"; do
    if [[ $patch == *.patch ]]; then
      msg2 "applying $patch"
      patch -d "$_pkgname" -Np1 < "$patch"
    fi
  done

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-install-strip
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${pkgname//-/}

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd firefox-$pkgver

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_NOSPAM=1
  MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_BUILD_DATE

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build

  echo "Profiling instrumented browser..."

  # https://aur.archlinux.org/packages/firefox-nightly#comment-953965
  export LIBGL_ALWAYS_SOFTWARE=true

  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross,full
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build # && echo "Building symbol archive..." & ./mach buildsymbols
}

package() {
  local desktopid=org.mozilla.$_pkgname
  local distdir="$pkgdir/usr/lib/$_pkgname/distribution/"
  local vendordir="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/"
  local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
  local i theme=official

  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  # Distribution
  install -Dvm644 -t "$vendordir" taskcluster/docker/firefox-flatpak/default-preferences.js
  install -Dvm644 -t "$distdir" taskcluster/docker/firefox-flatpak/policies.json
  install -Dvm644 /dev/stdin "$distdir/distribution.ini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux [Global Menu]

[Preferences]
# Distribution
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
mozilla.partner.id="archlinux"

# Use LANG environment variable to choose locale
intl.locale.matchOS=true
intl.regional_prefs.use_os_locales=true

# Don't disable extensions in the application directory
extensions.autoDisableScopes=11

# Enable GNOME Shell search provider
browser.gnome-search-provider.enabled=true

# Enable backspace button backward
browser.backspace_action=0

# Default use system title bar
browser.tabs.inTitlebar=0
browser.theme.dark-private-windows=false
END

  # Icons
  for i in 22 24 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$desktopid.png"
  done
  for i in 16 32 48 64 128; do
    ln -svf "/usr/lib/$_pkgname/browser/chrome/icons/default/default$i.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$desktopid.png"
  done

  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$desktopid.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$desktopid.png"

  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$desktopid.svg"
  install -Dvm644 taskcluster/docker/firefox-flatpak/$desktopid-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$desktopid-symbolic.svg"

  # Desktop
  install -Dvm644 -t "$pkgdir/usr/share/applications" \
    taskcluster/docker/firefox-flatpak/$desktopid.desktop

  install -Dvm644 /dev/stdin "$pkgdir/usr/share/metainfo/$desktopid.appdata.xml" < <(\
    VERSION=$pkgver DATE=$(date +%Y-%m-%d) envsubst < \
      taskcluster/docker/firefox-flatpak/$desktopid.appdata.xml.in\
  )
  
  # Install a wrapper to avoid confusion about binary path
  install -Dvm644 /dev/stdin "$pkgdir/usr/bin/$_pkgname" < <(\
    sed "s|/app/lib/firefox/firefox|/usr/lib/$_pkgname/firefox-bin|" \
      taskcluster/docker/firefox-flatpak/launch-script.sh\
  )

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/lib/$_pkgname/firefox-bin"

  # Use system certificates
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  # Search Providers
  install -Dvm644 browser/components/shell/search-provider-files/$desktopid.SearchProvider.service \
    "$pkgdir/usr/share/dbus-1/services/$desktopid.SearchProvider.service"
  install -Dvm644 /dev/stdin \
  "$pkgdir/usr/share/gnome-shell/search-providers/$desktopid.search-provider.ini" < <(\
    sed "s|firefox.desktop|$desktopid.desktop|" \
      browser/components/shell/search-provider-files/$desktopid.search-provider.ini\
  )
}

# vim:set sw=2 sts=-1 et:
