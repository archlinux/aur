# Maintainer:  Devin Cofer <ranguvar[at]ranguvar[dot]io>
# Maintainer:  Niko Cantero <[at]niko:conduit.rs (Matrix)>
# Contributor: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Maxwell Anselm <silverhammermba+aur@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

## options
# three-stage profile-guided optimization
: ${_build_pgo:=false}

# pkgtype: hg or wayland-hg
: ${_pkgtype:=wayland-hg}


## --
pkgname="firefox${_pkgtype:+-$_pkgtype}"
_pkgname=firefox-nightly
pkgver=121.0a1+20231117.1+h0dfaf13a5787
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
url="https://www.mozilla.org/firefox/channel/#nightly"
arch=(x86_64)
license=(
  GPL
  LGPL
  MPL
)
depends=(
  dbus-glib
  ffmpeg
  gtk3
  icu
  libpulse
  mime-types
  nspr-hg
  nss-hg
  ttf-font
  libvpx
  libwebp
  libjpeg
  zlib
  libevent
  pipewire
)
makedepends=(
  cbindgen
  clang
  diffutils
  dump_syms
  imake
  inetutils
  jack
  lld
  # mold - relook at the potential of the Mold linker in the future
  llvm
  mercurial
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
  yasm
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)

if [[ x"${_pkgtype::1}" == "xh" ]] ; then
  pkgdesc+=" (mozilla-unified hg, nightly branding, targeting wayland and x11)"

  depends+=(
    libxss
    libxt
  )
  makedepends+=(
    xorg-server-xvfb
  )
else
  pkgdesc+=" (mozilla-unified hg, nightly branding, targeting wayland)"

  if [[ x"${_enable_pgo::1}" == "xt" ]] ; then
    makedepends+=(
      cage
      pixman
      polkit
      xorg-server-xwayland
    )
  fi
fi

conflicts=('firefox-nightly')
provides=('firefox-nightly')

options=(
  !emptydirs
  !lto
  !makeflags
  !strip
)

_repo=https://hg.mozilla.org/mozilla-unified
source=(
  hg+$_repo
  $_pkgname.desktop
  identity-icons-brand.svg
  firefox-install-dir.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)
sha256sums=('SKIP'
            '022e9329fdb4af6267ad32a1398a9ae94a90cbb1e80dcf63e8b19e95490e7a35'
            'a9b8b4a0a1f4a7b4af77d5fc70c2686d624038909263c795ecc81e0aec7711e9'
            'c80937969086550237b0e89a02330d438ce17c3764e43cc5d030cb21c2abce5f')
b2sums=('SKIP'
        'e79bb7cf9f6aa1e816809f430a72e4d823756f363f635ebccb9a301d716979f3dd95506895798f54371b65b59065ca4c8e66d1dcac449a633da2a28f4bb966b9'
        '63a8dd9d8910f9efb353bed452d8b4b2a2da435857ccee083fc0c557f8c4c1339ca593b463db320f70387a1b63f1a79e709e9d12c69520993e26d85a3d742e34'
        'f76eb72c326f347991133c004b252ed2e037e72a7a436012fb1495668d2b9194d836765b58b01ba0bd9f5c4b888ee5ee715bdb458823a2a7822f1b299f4d1948')

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

pkgver() {
  cd mozilla-unified

  local version=$(<browser/config/version_display.txt)
  local date=$(date +%Y%m%d) # Without TZ=UTC, to match systemd timer
  local counter=1
  local rev=$(hg id -i -r. | sed 's/+$//')

  local last_rev=${pkgver##*+h} tmp=${pkgver#*+}; tmp=${tmp%+*}
  local last_date=${tmp%.*} last_counter=${tmp#*.}
  if [[ $date == $last_date ]]; then
    if [[ $rev == $last_rev ]]; then
      counter=$last_counter
    else
      counter=$((last_counter + 1))
    fi
  fi

  echo $version+$date.$counter+h$rev
}

prepare() {
  mkdir mozbuild
  cd mozilla-unified

  # Change install dir from 'firefox' to 'firefox-nightly'
  patch -Np1 -i ../firefox-install-dir.patch

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize=-O3
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

export MOZ_ENABLE_WAYLAND=1

# Branding
ac_add_options --with-branding=browser/branding/nightly
ac_add_options --enable-update-channel=nightly
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${_pkgname//-/}

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System Libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-libvpx
ac_add_options --with-system-webp
ac_add_options --with-system-libevent
ac_add_options --with-system-icu
ac_add_options --with-system-zlib
ac_add_options --with-system-jpeg

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests

# Disables Telemetry by Default
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

# Other
END

  if [[ x"${_pkgtype::1}" == "xh" ]] ; then
    echo >>../mozconfig "ac_add_options --enable-default-toolkit=cairo-gtk3-x11-wayland"
  else
    echo >>../mozconfig "ac_add_options --enable-default-toolkit=cairo-gtk3-wayland-only"
  fi
}

build() {
  cd mozilla-unified

  export MOZ_SOURCE_REPO="$_repo"
  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  # LTO/PGO needs more open files
  ulimit -n 4096

  if [[ x"${_build_pgo::1}" == "xt" ]] ; then
    # Do 3-tier PGO
    echo "Building instrumented browser..."
    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
    ./mach build

    echo "Profiling instrumented browser..."
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
    ./mach build
  else
    echo "Building browser..."
    cat >.mozconfig ../mozconfig - <<END
export AR=llvm-ar
export CC='clang'
export CXX='clang++'
export NM=llvm-nm
export RANLIB=llvm-ranlib
END
    ./mach build
  fi

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd mozilla-unified
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
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
END

  local distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  local i theme=nightly
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  install -Dvm644 ../identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.svg"

  install -Dvm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/firefox-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/}/SearchProvider
Version=2
END

  export SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE="$startdir/.crash-stats-api.token"
  if [[ -f $SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE ]]; then
    make -C obj uploadsymbols
  else
    cp -fvt "$startdir" obj/dist/*crashreporter-symbols-full.tar.zst
  fi
}

# vim:set sw=2 sts=-1 et:
