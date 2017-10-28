# Maintainer: Isabell Cowan <izzi@izzette.com>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>

# ------------------------ #
# --- BUILD PARAMETERS --- #
# ------------------------ #

# enable this if you run out of memory during linking
_lowmem=false

# enable this to try to build with PGO (probably will fail to build)
_pgo=false

# enable this to try to use the system pixman (probably will fail at link time)
_system_pixman=false

# enable this to build with ccache
_ccache=false

# enable this to build for debug
_debug=false

# Use optimization flags (required if -D_FORTIFY_SOURCE is set and non-zero).
# Warning, Firefox may crash if set to anything but -O2.
_optimize="-O2"

# Upstream name, version, and source URL
_realname='firefox'
_pkgver=57.0b12
_mozffurl="http://archive.mozilla.org/pub/$_realname/releases/$_pkgver/source/$_realname-$_pkgver.source.tar.xz"

# Debian Firefox trunk Debian source revision and URL (for Unity (global) menubar patch).
_debianrev=2113
_debianurl="https://bazaar.launchpad.net/~mozillateam/$_realname/$_realname-trunk.head/tarball/$_debianrev"

# openSUSE Firefox source revision and URL (for openSUSE patches).
_opensuserev=932b3ad009d5
_opensusebaseurl="http://www.rosenauer.org/hg/mozilla/raw-file/$_opensuserev"

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff

# Directory where things will be built
if [[ "$CARCH" == 'i686' && "$CHOST" == i*86-*-linux-gnu ]]; then
  _builddir=obj-i686-pc-linux-gnu
elif [[ "$CARCH" == 'x86_64' && "$CHOST" == x86_64-*-linux-gnu ]]; then
  _builddir=obj-x86_64-pc-linux-gnu
else
  error "Please add the correct _builddir variable for your toolchain!"
  exit 1
fi


# ------------------------- #
# --- PATCH INFORMATION --- #
# ------------------------- #

# To support global menu a patch from Ubuntu is applied.
# source (replace ${_debianrev} with the revision above):
# https://bazaar.launchpad.net/~mozillateam/firefox/firefox-trunk.head/revision/${_debianrev}#debian/patches/unity-menubar.patch

# To integrate better with KDE Plasma 5 patches for openSUSE are applied.
# source (replace ${_opensuserev} with the revision above):
# http://www.rosenauer.org/hg/mozilla/file/${_opensuserev}


# ------------------- #
# --- SOURCE INFO --- #
# ------------------- #

pkgname=("$_realname-kde-opensuse-beta")
pkgver="$_pkgver"
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with openSUSE patches to integrate better with KDE Plasma 5"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://build.opensuse.org/package/show/mozilla:Factory/MozillaFirefox"
depends=('gtk3' 'gtk2' 'mozilla-common' 'libxt'
         'startup-notification' 'mime-types' 'dbus-glib'
         'ffmpeg' 'nss>=3.33' 'nspr>=4.17' 'hunspell' 'sqlite'
         'ttf-font' 'libpulse' 'hicolor-icon-theme' 'libvpx'
         'icu' 'libevent' 'kmozillahelper')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm'
             'mesa' 'imake' 'gconf' 'inetutils' 'autoconf2.13'
             'rust' 'clang' 'llvm' 'jack')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'firefox-beta-i18n: Localization support')
provides=("firefox=${pkgver}")
conflicts=('firefox')
options=('!emptydirs')
# shellcheck disable=SC2140
source=("$_mozffurl"
        "firefox-trunk+r$_debianrev.debian.tar.gz"::"$_debianurl"
        "mozilla-kde_g$_opensuserev.patch"::"$_opensusebaseurl/mozilla-kde.patch"
        "mozilla-nongnome-proxies_g$_opensuserev.patch"::"$_opensusebaseurl/mozilla-nongnome-proxies.patch"
        "firefox-branded-icons_g$_opensuserev.patch"::"$_opensusebaseurl/firefox-branded-icons.patch"
        "firefox-kde_g$_opensuserev.patch"::"$_opensusebaseurl/firefox-kde.patch"
        "firefox-no-default-ualocale_g$_opensuserev.patch"::"$_opensusebaseurl/firefox-no-default-ualocale.patch"
        'native-menu-doc-listener.patch'
        'firefox-kde-opensuse-patch.patch' 'firefox-no-default-ualocale-opensuse-patch.patch' 'mozilla-kde-opensuse-patch.patch'
        'browser-kde-xul.patch'
        'add-missing-pgo-rule.patch' 'pgo-fix-missing-kdejs.patch'
        'wifi-disentangle.patch' 'wifi-fix-interface.patch'
        'no-crmf.patch'
        'firefox-install-dir.patch'
        'mozconfig'
        'vendor.js' 'kde.js'
        'firefox-fixed-loading-icon.png'
        'firefox.desktop')
sha256sums=('363981c9008a0ed66db9fcce3d5f84aca348391fe433e0f8bfd6f291e7fb8dad'
            'SKIP'  # Debian source tarball is generated each time it is requested.
            'c4c0a726115eca89ab82a85b364cef6cc897f58317b2890f214510810a30cfa3'
            'ef0f90c9134ef05b950f06a3ffbd699c2e5a5f99a4cdf9868e799534d68c204f'
            'c85a37e71f2bd511fac88d41ca0618ee375c49fc86bc2beddf6dc17c3f17508d'
            'f672e60e22869381e9c4cdd90353a053a0171778eca40d4664bc733822fd535f'
            'b941790009bb9eda46c2d96fb0d1c83b0fe2d1acf74754ab08e6b18c1e0c6b16'
            '70bdf9e58397e6483b7a4d925176be74defbde0221cc3d5f253ec4ede55e6f21'
            'ecb7c3ae3f52ee9b430c1e8e69370b1dedb06674e1fcdc856d60942680bf7b62'
            'f3c50e4ec8d58b23530d87a3162e0b33af58ea73b35dc51bd29b1fad0d26f43f'
            'fd58b8fa5716c5724885af280b15ec3915fa3d48b0991a0c92af7a1b414fd665'
            '8da046206e98649a371ce8e9b3dffc9532f78e963f764c866bc4e021b8b6fb5a'
            'f9067f62a25a7a77276e15f91cc9e7ba6576315345cfc6347b1b2e884becdb0c'
            '2797d1e61031d24ee24bf682c9447b3b9c1bca10f8e6cbd597b854af2de1ec54'
            'f068b84ad31556095145d8fefc012dd3d1458948533ed3fff6cbc7250b6e73ed'
            'e98a3453d803cc7ddcb81a7dc83f883230dd8591bdf936fc5a868428979ed1f1'
            'fb85a538044c15471c12cf561d6aa74570f8de7b054a7063ef88ee1bdfc1ccbb'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '3a379cafc979bb2cea4380b774a69ac5a79919291060d38464f94b479c4d19a0'
            '93c5df00f409988bbfa890ac175103476ead3af68f7501973ee70bd11dc472f8'
            'b8cc5f35ec35fc96ac5c5a2477b36722e373dbb57eba87eb5ad1276e4df7236d'
            '68e3a5b47c6d175cc95b98b069a15205f027cab83af9e075818d38610feb6213'
            '75c526e9669b91b4fe5dcea650a1e8419220abb2e9564184f0d984c71eae82e8')

if [[ ! -z "$_system_pixman" ]] && $_system_pixman; then
  depends+=('pixman')
fi
if [[ ! -z "$_pgo" ]] && $_pgo; then
  makedepends+=('xorg-server-xvfb')
fi
if [[ ! -z "$_ccache" ]] && $_ccache; then
  makedepends+=('ccache')
fi
if [[ ! -z "$_debug" ]] && $_debug; then
  options+=('debug' '!strip')
else
  options+=('!debug' 'strip')
fi


# ---------------------- #
# --- BUILD ROUTINES --- #
# ---------------------- #

prepare() {
  warning "Building Firefox takes roughly 10GiB of space, more if built with debugging symbols"
  warning "Building Firefox can take many hours (1-10) depending on your system"
  warning "Firefox is much more likely to crash if build with non-standard CXXFLAGS"
  warning "Firefox will be much more reliable if built from a clean chroot"
  warning "You have 30 seconds to reconsider your build environment"
  sleep 30

  cd "$srcdir/$_realname-$pkgver"

  msg2 "Creating API key files"
  echo -n "$_google_api_key" > google-api-key
  echo -n "$_google_default_client_id $_google_default_client_secret" > google-oauth-api-key
  echo -n "$_mozilla_api_key" > mozilla-api-key

  msg2 "Creating .mozconfig (configure flags)"
  {
    cat "$srcdir/mozconfig"
    if [[ ! -z "$_optimize" ]]; then
      echo "ac_add_options --enable-optimize='${_optimize//\'/\'\\\'\'}'"
    fi
    echo "ac_add_options --with-google-api-keyfile='${PWD//\'/\'\\\'\'}/google-api-key'"
    echo "ac_add_options --with-google-api-keyfile='${PWD//\'/\'\\\'\'}/google-oauth-api-key'"
    echo "ac_add_options --with-mozilla-api-keyfile='${PWD//\'/\'\\\'\'}/mozilla-api-key'"
    if [[ ! -z "$_system_pixman" ]] && $_system_pixman; then
      echo "ac_add_options --enable-system-pixman"
    fi
    if [[ ! -z "$_ccache" ]] && $_ccache; then
      echo "ac_add_options --enable-ccache"
    fi
    if [[ ! -z "$_debug" ]] && $_debug; then
      echo "ac_add_options --enable-debug"
    else
      echo "export STRIP_FLAGS='--strip-debug'"
    fi
  } > .mozconfig

  msg2 "Fixing openSUSE patches for Firefox $pkgver"
  mkdir -p "$srcdir/patched-patches"
  cd "$srcdir/patched-patches"
  for patch in mozilla-kde firefox-kde firefox-no-default-ualocale; do
    cp "$srcdir/${patch}_g$_opensuserev.patch" "$patch.patch"
    patch -Ni "$srcdir/$patch-opensuse-patch.patch"
  done

  cd "$srcdir/$_realname-$pkgver"

  msg2 "Applying Unity (global) menubar patch"
  patch -Np1 -i "$srcdir/~mozillateam/firefox/firefox-trunk.head/debian/patches/unity-menubar.patch"
  patch -Np1 -i "$srcdir/native-menu-doc-listener.patch"

  msg2 "Applying openSUSE patches"
  patch -Np1 -i "$srcdir/mozilla-nongnome-proxies_g$_opensuserev.patch"
  patch -Np1 -i "$srcdir/patched-patches/mozilla-kde.patch"
  cp \
     browser/base/content/browser.xul \
     browser/base/content/browser-kde.xul
  patch -Np1 -i "$srcdir/browser-kde-xul.patch"
  patch -Np1 -i "$srcdir/firefox-branded-icons_g$_opensuserev.patch"
  patch -Np1 -i "$srcdir/patched-patches/firefox-kde.patch"
  patch -Np1 -i "$srcdir/patched-patches/firefox-no-default-ualocale.patch"

  msg2 "Applying Arch Linux (vendor) specific patches"
  patch -Np1 -i "$srcdir/add-missing-pgo-rule.patch"
  patch -Np1 -i "$srcdir/pgo-fix-missing-kdejs.patch"
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1371991
  patch -Np1 -i "$srcdir/no-crmf.patch"
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i "$srcdir/wifi-disentangle.patch"
  patch -Np1 -i "$srcdir/wifi-fix-interface.patch"
  patch -Np1 -i "$srcdir/firefox-install-dir.patch"

  msg2 "Creating additional PATH element to python2 (as python)"
  # WebRTC build tries to execute "python" and expects Python 2
  mkdir -p "$srcdir/path"
  ln -sf /usr/bin/python2 "$srcdir/path/python"

  msg2 "Replacing loading icon with fixed one"
  # Fix tab loading icon (flickers with libpng 1.6)
  # https://bugzilla.mozilla.org/show_bug.cgi?id=841734
  # TODO: Remove this; Firefox 34 might use CSS animations for the loading icon
  # https://bugzilla.mozilla.org/show_bug.cgi?id=759252
  cp "$srcdir/firefox-fixed-loading-icon.png" \
     browser/themes/linux/tabbrowser/loading.png

  touch sourcestamp.txt
}

build() {
  cd "$srcdir/$_realname-$pkgver"

  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"

  # Build fails with -D_FORTIFY_SOURCE if optimizations are not in CPPFLAGS
  if [[ -z "${CPPFLAGS/*-D_FORTIFY_SOURCE*/}" && ! -z "$_optimize" ]]; then
    CPPFLAGS+=" $_optimize"
  fi

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # Prevent ENOMEM during linking.
  if [[ ! -z "$_lowmem" ]] && $_lowmem || [[ "$CARCH" == i*86 ]]; then
    LDFLAGS+=" -Xlinker --no-keep-memory"
  fi

  if [[ ! -z "$_pgo" ]] && $_pgo; then
    export MOZ_PGO=1
    BUILDCMD=(xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" ./mach build)
  else
    BUILDCMD=(./mach build)
  fi

  msg2 "Building Firefox"
  "${BUILDCMD[@]}"

  msg2 "Generating Firefox symbols"
  ./mach buildsymbols

  msg2 "Adding KDE Plasma 5 script to default preferences"
  cp "$srcdir/kde.js" "$_builddir/dist/bin/defaults/pref"/
}

package() {
  cd "$srcdir/$_realname-$pkgver"

  msg2 "Installing Firefox"
  DESTDIR="$pkgdir" ./mach install

  msg2 "Copying Firefox symbols zip into start directory"
  find . -name '*crashreporter-symbols-full.zip' -exec cp -fvt "$startdir" {} +

  msg2 "Installing KDE Plasma 5 script"
  install -Dm644 "$srcdir/kde.js" \
      "$pkgdir/usr/lib/firefox/browser/defaults/preferences/kde.js"

  msg2 "Installing Arch Linux (vendor) script"
  install -Dm644 "$srcdir/vendor.js" \
      "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"

  msg2 "Installing distribution metadata file"
  install -dm755 "$pkgdir/usr/lib/firefox/distribution"
  cat > "$pkgdir/usr/lib/firefox/distribution/distribution.ini" <<EOF
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=${pkgname[0]}
app.partner.archlinux=archlinux
EOF

  msg2 "Installing Firefox branded icons"
  for i in 16 22 24 32 48 256; do
      install -Dm644 "browser/branding/official/default$i.png" \
          "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png \
      "$pkgdir/usr/share/icons/hicolor/64x64/apps/firefox.png"
  install -Dm644 browser/branding/official/mozicon128.png \
      "$pkgdir/usr/share/icons/hicolor/128x128/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
      "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
      "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"

  msg2 "Installing desktop entry"
  install -Dm644 "$srcdir/firefox.desktop" \
      "$pkgdir/usr/share/applications/firefox.desktop"

  msg2 "Replacing Firefox dictionaries with system dictionaries"
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"

  msg2 "Linking usr/lib/firefox/firefox-bin to firefox"
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"

  msg2 "Forcing use of system SSL certificates"
  ln -srf "$pkgdir/usr/lib/libnssckbi.so" \
    "$pkgdir/usr/lib/$_realname/libnssckbi.so"
}

# vim: set ts=2 sw=2 et syn=sh ft=sh:
