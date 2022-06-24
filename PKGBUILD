# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>


# For common issues regarding GCC and firefox see:
# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=45375

# enable this if you run out of memory during linking
#_lowmem=true

# build with PGO
_pgo=true

_pkgname=firefox
pkgname=$_pkgname-kde-opensuse
pkgver=101.0.1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://github.com/openSUSE/firefox-maintenance"
depends=('libxt' 'mime-types'
         'dbus-glib' 'hicolor-icon-theme'
         'libevent' 'nss>=3.28.3' 'nspr>=4.10.6' 'hunspell'
	 'sqlite' 'kmozillahelper' 'ffmpeg'
        )

makedepends=('unzip' 'zip' 'diffutils' 'yasm' 'mesa' 'imake'
             'xorg-server-xvfb' 'libpulse' 'inetutils' 'autoconf2.13'
             'cargo' 'mercurial' 'llvm' 'clang' 'rust' 'jack'
             'nodejs' 'cbindgen' 'nasm' 'xz'
             'python' 'python-zstandard' 'dump_syms'
             # system av1
             'dav1d' 'aom'
             # system harfbuzz
             'harfbuzz'
             # system graphite
             'graphite'
             # system webp
             'libwebp'
             # system libevent
             'libevent'
             # system icu
             'icu'
             # system libvpx
             'libvpx'
             # gtk
             'gtk3'
             'libnotify'
             'libpulse'
            )


# https://bugs.gentoo.org/792705
# needs fixes from GCC 11.2
makedepends+=('gcc>=11.2.0')


optdepends=('networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech'
            'pulseaudio: Audio support'
            'libnotify: Notification integration'
            'xdg-desktop-portal: Screensharing with Wayland')
provides=("firefox=${pkgver}")
conflicts=('firefox')
_patchrev=258c46cb700250b2f131d441e6470e5a23ee8a4b
options=('!emptydirs' !lto)
_patchurl=https://raw.githubusercontent.com/openSUSE/firefox-maintenance/$_patchrev
_repo=https://hg.mozilla.org/mozilla-unified
source=("hg+$_repo#tag=FIREFOX_${pkgver//./_}_RELEASE"
        mozconfig
        firefox.desktop
        vendor.js
        kde.js
	# Firefox patchset
	firefox-branded-icons-$_patchrev.patch::$_patchurl/firefox/firefox-branded-icons.patch
	firefox-kde-$_patchrev.patch::$_patchurl/firefox/firefox-kde.patch
	# Gecko/toolkit patchset
	mozilla-kde-$_patchrev.patch::$_patchurl/mozilla-kde.patch
	mozilla-nongnome-proxies-$_patchrev.patch::$_patchurl/mozilla-nongnome-proxies.patch
        # globalmenu patch:
        # to support globalmenu a patch from ubuntu is applied
        # source:
        # http://bazaar.launchpad.net/~mozillateam/firefox/firefox-trunk.head
        # /view/head:/debian/patches/unity-menubar.patch
	unity-menubar.patch
        # end
	add_missing_pgo_rule.patch
        pgo_fix_missing_kdejs.patch
        # use system harfbuzz
        0004-bmo-847568-Support-system-harfbuzz.patch
        # use system graphite2
        0005-bmo-847568-Support-system-graphite2.patch
        # use sytem av1
        0006-bmo-1559213-Support-system-av1.patch
        # reenable system sqlite
        5022efe33088.patch
        # Force disable elfhack to fix build errors
        build-disable-elfhack.patch
        # patches from gentoo:
        # https://dev.gentoo.org/~whissi/mozilla/patchsets/firefox-89-patches-01.tar.xz
        0020-Make-PGO-use-toolchain.patch
        # Fix MOZILLA#1516803
        # https://bugzilla.mozilla.org/show_bug.cgi?id=1516803
        0022-bmo-1516803-force-one-LTO-partition-for-sandbox-when.patch
        # PGO/LTO GCC patches
        0024-Fix-building-with-PGO-when-using-GCC.patch
        0027-LTO-Only-enable-LTO-for-Rust-when-complete-build-use.patch
        # end
        # Fix CSD when globalmenu is active #8
        fix_csd_window_buttons.patch
        # Workaround #14
        fix-wayland-build.patch
        # Fix building with cbdingen > 0.23.0 #22 MOZILLA#1773259
        fix_ftbfs_cbindgen_gt_0.23.patch

)

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
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  cd mozilla-unified

  cp "$srcdir/mozconfig" .mozconfig

  echo -n "$_google_api_key" >google-api-key
  echo "ac_add_options --with-google-location-service-api-keyfile=\"$PWD/google-api-key\"" >>.mozconfig

  echo -n "$_google_default_client_id $_google_default_client_secret" >google-oauth-api-key
  echo "ac_add_options --with-google-safebrowsing-api-keyfile=\"$PWD/google-oauth-api-key\"" >>.mozconfig

  echo -n "$_mozilla_api_key" >mozilla-api-key
  echo "ac_add_options --with-mozilla-api-keyfile=\"$PWD/mozilla-api-key\"" >>.mozconfig
  
  msg "Patching for KDE"
  patch -Np1 -i "$srcdir/mozilla-nongnome-proxies-$_patchrev.patch"
  patch -Np1 -i "$srcdir/mozilla-kde-$_patchrev.patch"

  patch -Np1 -i "$srcdir/firefox-kde-$_patchrev.patch"
  patch -Np1 -i "$srcdir/firefox-branded-icons-$_patchrev.patch"
  
  # Add globalmenu support
  patch -Np1 -i "$srcdir/unity-menubar.patch"

  # use system harfbuzz
  patch -Np1 -i "$srcdir"/0004-bmo-847568-Support-system-harfbuzz.patch
  # use system graphite2
  patch -Np1 -i "$srcdir"/0005-bmo-847568-Support-system-graphite2.patch
  # use sytem av1
  patch -Np1 -i "$srcdir"/0006-bmo-1559213-Support-system-av1.patch

  # reenable system sqlite
  patch -p1 -i "$srcdir"/5022efe33088.patch

  # Force disable elfhack to fix build errors
  patch -Np1 -i "$srcdir"/build-disable-elfhack.patch

  # Fix CSD when globalmenu is active #8
  patch -Np1 -i "$srcdir"/fix_csd_window_buttons.patch

  # Workaround #14
  patch -Np1 -i "$srcdir"/fix-wayland-build.patch

  # Fix building with cbdingen > 0.23.0 #22 MOZILLA#1773259
  patch -p1 -i "$srcdir"/fix_ftbfs_cbindgen_gt_0.23.patch

  if [ $_pgo ] ; then
    # Fix MOZILLA#1516803
    # sandbox needs to be built with --param lto-partitions=1 when
    # GCC LTO is enabled
    patch -Np1 -i "$srcdir"/0022-bmo-1516803-force-one-LTO-partition-for-sandbox-when.patch

    # PGO/LTO GCC patches
    patch -Np1 -i "$srcdir"/0020-Make-PGO-use-toolchain.patch
    patch -Np1 -i "$srcdir"/0024-Fix-building-with-PGO-when-using-GCC.patch
    patch -Np1 -i "$srcdir"/0027-LTO-Only-enable-LTO-for-Rust-when-complete-build-use.patch

    # add missing rule for pgo builds
    patch -Np1 -i "$srcdir"/add_missing_pgo_rule.patch

    # add missing file Makefile for pgo builds
    patch -Np1 -i "$srcdir"/pgo_fix_missing_kdejs.patch

    echo "ac_add_options --enable-lto" >> .mozconfig
  fi
}

build() {
  #export CXXFLAGS="${CFLAGS}"
  cd mozilla-unified
  export MOZ_SOURCE_REPO="$_repo"
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_APP_REMOTINGNAME=$pkgname
  export CARGO_HOME="$srcdir"/.cargo
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system

  # LTO needs more open files
  ulimit -n 4096

  export CC=gcc
  export CXX=g++
  export AR="gcc-ar"
  export NM="gcc-nm"
  export RANLIB="gcc-ranlib"

  export MOZ_MAKE_FLAGS="$MAKEFLAGS"
  export MOZ_SMP_FLAGS="$MAKEFLAGS"
  export STRIP=/bin/true

  if [[ -n $_lowmem || $CARCH == i686 ]]; then
    LDFLAGS+=" -Xlinker --no-keep-memory"
  fi

  if [[ -n $_pgo ]]; then
    export DISPLAY=:99
    export MOZ_PGO=1

    export TMPDIR="$srcdir/tmp"
    mkdir -p "$TMPDIR"

    xvfb-run \
      -a \
      -s "-extension GLX -screen 0 1280x1024x24" \
      ./mach build
  else
    ./mach build
  fi
  ./mach buildsymbols
}

package() {
  # The .so dependencies have to be added here so
  # pacman doesn't try to install the build time  dependencies
  # by trying to resolve so names.
  # Doing so makes pacman ask for which have to be installed even thou
  # they are already specificied in makedepends
  depends+=(
    # system av1
    'libdav1d.so' 'libaom.so'
    # system harfbuzz
    'libharfbuzz.so'
    # system icu
    'libicuuc.so'
    'libicui18n.so'
    # system vpx
    'libvpx.so'
    # gtk
    'libgtk-3.so'
  )
  cd mozilla-unified

  [[ "$CARCH" == "i686" ]] && cp "$srcdir/kde.js" obj-i686-pc-linux-gnu/dist/bin/defaults/pref
  [[ "$CARCH" == "x86_64" ]] && cp "$srcdir/kde.js" obj-x86_64-pc-linux-gnu/dist/bin/defaults/pref

  DESTDIR="$pkgdir" ./mach install

  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"
  install -Dm644 "$srcdir/kde.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/kde.js"

  _distini="$pkgdir/usr/lib/firefox/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  for i in 16 22 24 32 48 64 128 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done

  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"

  install -Dm644 "$srcdir/firefox.desktop" "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  #workaround for now
  #https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"
}
md5sums=('SKIP'
         '9530b0395a095c0b47ee42d0996ec163'
         'a26a061efb4def6572d5b319d657f1d6'
         '4c23d9c0a691d70919beb1dafbbecbd3'
         '05bb69d25fb3572c618e3adf1ee7b670'
         'b386ac38ffb7e545b9473e516455a25f'
         '1d5e9215530ef6778299b67dc6dba65e'
         'd8990ad2a2478aa9b3d8d997337c1b11'
         '0a5733b7a457a2786c2dd27626a1bf88'
         '3ff786d079642fcb0065b7e5c609d8c6'
         'fe24f5ea463013bb7f1c12d12dce41b2'
         '3c383d371d7f6ede5983a40310518715'
         'dc47b8b0582ca8e97d68e5636b72853c'
         '9e518b30cf2ff9afd0423c79d12ae7b2'
         '0c292d03c77bc377c2cdc5aa2df248d9'
         '548de130fc0f470bff0b6d994a0a91cd'
         'c7b492df4fbf42ffe8aea4c0afb89921'
         '316d71d9cec400890db2ee8c362e672f'
         'c6c0e47c9b517e5146a8925f442b811b'
         '943b9fe2ba474f7809a41622744f97f9'
         '31f950a94966287bfa6ccf03030781cc'
         'f49ac3b9f5146e33ce587e6b23eb1a86'
         '2cf74781f6b742d6b7e6f7251f49311a'
         'dc17d808361a7e61e294e40a0bb8371e')
