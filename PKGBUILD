# Maintainer: Alex <thetan1735@protonmail.com>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>



_pkgname=firefox
pkgname=$_pkgname-kde-opensuse-no-telemetry
pkgver=117.0.1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE, no telemetry"
arch=('i686' 'x86_64' 'aarch64')
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
             # system icu
             'icu'
             # system libvpx
             'libvpx'
             # gtk
             'gtk3'
             'libnotify'
             'libpulse'
            )

optdepends=('networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech'
            'pulseaudio: Audio support'
            'libnotify: Notification integration'
            'xdg-desktop-portal: Screensharing with Wayland')
provides=("firefox=${pkgver}")
conflicts=('firefox')
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
        mozconfig
        firefox.desktop
        vendor.js
        0001-Bug-1504834-Rough-progress-patch.patch
        0002-Bug-1504834-XULText-AA-fix-BE.patch
        0003-mozilla-bmo998749.patch.patch
        0004-mozilla-libavcodec58_91.patch.patch
        0005-mozilla-silence-no-return-type.patch-to-fix-build-er.patch
        0006-Bug-531915-mozilla-bmo531915.patch.patch
        0007-imported-patch-one_swizzle_to_rule_them_all.patch.patch
        0008-imported-patch-svg-rendering.patch.patch
        0009-Bug-1792159-Add-missing-includes-to-AtomicOperations.patch
        0010-mozilla-s390-context.patch.patch
        0011-bsc-991344-Rpi3-Firefox-crashes-after-a-few-seconds-.patch
        0012-mozilla-fix-aarch64-libopus.patch.patch
        0013-Bug-634334-call-to-the-ntlm_auth-helper-fails.patch
        0014-Make-PGO-use-toolchain.patch
        0015-bmo-1516803-force-one-LTO-partition-for-sandbox-when.patch
        0016-Fix-building-with-PGO-when-using-GCC.patch
        0017-LTO-Only-enable-LTO-for-Rust-when-complete-build-use.patch
        0018-Bug-1516081-Disable-watchdog-during-FDO-train.patch
        0019-Bug-559213-Support-system-av1.patch
        0020-Bug-847568-Support-system-harfbuzz.patch
        0021-Bug-847568-Support-system-graphite2.patch
        0022-Bug-1611386-Reenable-support-for-enable-system-sqlit.patch
        0023-Bug-1419151-Add-Unity-menubar-support.patch
        0024-Do-not-use-gconf-for-proxy-settings-if-not-running-w.patch
        0025-Add-KDE-integration-to-Firefox-toolkit-parts.patch
        0026-Add-KDE-integration-to-Firefox.patch
        0027-Imported-patch-firefox-branded-icons.patch.patch
        0028-Allow-Eme-for-arm-and-Aarch64.patch
        0029-Shut-up-warnings-about-future-Rust-version-incompati.patch
        0030-Partially-revert-Bug-1768632-Make-EnumSet-compile-fo.patch
        0031-Bug-1796523-Workaround-source-locations-for-function.patch
        0032-disable-data-reporting-at-compile-time.patch
)

validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
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

# change this to false if you do not want to run a PGO build for aarch64 or x86_64
_build_profiled_aarch64=true
_build_profiled_x86_64=true


prepare() {

  cd firefox-$pkgver

  cp "$srcdir/mozconfig" .mozconfig

  echo -n "$_google_api_key" >google-api-key
  echo "ac_add_options --with-google-location-service-api-keyfile=\"$PWD/google-api-key\"" >>.mozconfig

  echo -n "$_google_default_client_id $_google_default_client_secret" >google-oauth-api-key
  echo "ac_add_options --with-google-safebrowsing-api-keyfile=\"$PWD/google-oauth-api-key\"" >>.mozconfig

  echo -n "$_mozilla_api_key" >mozilla-api-key
  echo "ac_add_options --with-mozilla-api-keyfile=\"$PWD/mozilla-api-key\"" >>.mozconfig

  for patch in $srcdir/*.patch ; do
    echo "Applying $patch"
    patch -p1 -i "$patch"
  done
}

build() {

  #export CXXFLAGS="${CFLAGS}"
  cd firefox-$pkgver

  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_APP_REMOTINGNAME=$pkgname
  export CARGO_HOME="$srcdir"/.cargo
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  # LTO needs more open files
  ulimit -n 4096

  export CC='clang'
  export CXX='clang++'


  export STRIP=/bin/true


  export MOZ_ADDON_SIGNING=1
  export MOZ_REQUIRE_SIGNING=1
  export BUILD_OFFICIAL=0


  echo "Building instrumented browser..."

  if [[ $CARCH == 'aarch64' && $_build_profiled_aarch64 == true ]]; then

    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate
END

  elif [[ $CARCH == 'x86_64' && $_build_profiled_x86_64 == true ]]; then

    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END

  fi

  if [[ $CARCH == 'aarch64' && $_build_profiled_aarch64 == true || $CARCH == 'x86_64' && $_build_profiled_x86_64 == true ]]; then

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

    if [[ $CARCH == 'aarch64' ]]; then

      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto
ac_add_options --enable-profile-use
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END

    else

      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross,full
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END

    fi
  fi

  if [[ $CARCH == 'aarch64' && $_build_profiled_aarch64 == false || $CARCH == 'x86_64' && $_build_profiled_x86_64 == false ]]; then
    cat >.mozconfig ../mozconfig
  fi

  ./mach build

  echo "Building symbol archive..."
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

  cd firefox-$pkgver

  DESTDIR="$pkgdir" ./mach install

  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"

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

  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/}/SearchProvider
Version=2
END

}
sha256sums=('7ea4203b5cf9e59f80043597e2c9020291754fcab784a337586b5f5e1370c416'
            'SKIP'
            'fa18ee15eb60188b0f7cbfe46bf5b5656b12db70724d4c5542bc81a03e7dae6e'
            '4c93b2e1f1675e033ed7910fe5f379626a92903a940697430985bcfdf94afceb'
            'eaad0eee76f89e0a1a241742ec5c8ec9315b096f7b3e0ea302b253b926750aae'
            '10593c391762298c8f740d432e51224d031f17cf3689341497d3cc02bfa744f3'
            'eb19d9568e8d7705b2a0c4774d4f6a758a910c0e5cf427727feb5884a2a1ee98'
            '4322124dc370ac56063837370a8107e85ca6e0d4037ff71ece5e7b0f55ed8053'
            '691de24752efa64ebe8f1a77c31ee769bb359c49655352399cf345300c0c6cb6'
            'ea2339511a6be6d44406dd478623a41aa0de6a748a5267fe675f90abcb30971a'
            '2fdb6066cf348843f57b963571e0211acfb2f671896dfad650723129b62bd1af'
            'bba76c5e13952ef45362f8e53a5c030e0f5d722f8f266228787136a5312330ea'
            'f2fcd4ca82b833f5e5b7e991882e24f09463cd837242b18cf163bc751f2e21d5'
            '766faefbd4898049e9913589962bf839da6785d50f0631b4eac7316f16bf2ea6'
            '3aa459ef9295cd76d102a767a8910cc42cfc672bdde9ab98453465a37946024d'
            'e5e960afe0a2ed519b3a8d20e645b4defd0ff9920797bf9accdd7b235ab8637d'
            '32d40630a010ee91d2c35c814ef2f567ad7faf859f8198735829958cb055f53b'
            '1ffdcff3d4e31c5cceddadfa0111c27a34480594238cdf85866ee1073d922910'
            '26fe6a707517789f512fffd83009d20544987e944ad4b3d10ed30e8b566f96ba'
            '4007869a43897d45ba56b631195ff9ce96616cb160e9a3785f2b4c9313115095'
            '2400173d2c84573194c6af9031663a5b2332ccb4929b246b216c61c97d8b0a54'
            '04cf5528a4e211a2f33d74282013672ac1a585814c0de46419f2dc3c469a71a7'
            '72d30acbe1e8488c6bd3af2e0813223842a63b859d6e7aff66d2f23612b7ad8b'
            '8cd6457b71bf20023f25b66e78cdebb43205f26db03a6d88c64202cc51ba1b39'
            '039a07b1171a9fc1bd71a792c2ee152f774a1bf34a768eae72113b3ff5fd19e7'
            'fdab230f8c1c457277d921cf318771852288c665c01fd1b9f570e1b9be6dac25'
            'f129686f536941c820022a95b242c83f4de54facdac59b6eb16db46e84de0c7c'
            'a41b65c032a21298eed7d70e83dfbe3d28fe268963803d225914d2a21f97b22c'
            'dfb11575e7d43071c9046762408b7267507c645020678d57689d55d3f68c0c28'
            'b0bc4493dea4241a5a7e83ce705c25a867a22ff9d610cbbe50c031c65d8c83e8'
            'b941526ab077d21dc0e833ff2bd375eb06ff53d3898d3142ef917e3a7f3a67c7'
            '8fe583a722a48596c93634136fb2bea621b30311bc935447bf4dc0c472aac117'
            'eab658c30b83505825765f6a99aeaff693888e6bfa4e5b436349a79c43b322e0'
            '9b7bf3b170494a2a10b56b2d903902140d50919e1e4a32bcfd16feeb08fa402e'
            '7038651e09bd1f1cf2561ee977e6fcc58f7295ce821f419288da6d0b2bcc8feb'
            '0d7a0f8bd7f0a8f1319d79a433d848a3eb43e81f4a14f29d5c8602be49d93cb9'
            'cc558844f6b6d30e3e3d4d91b873a081281e0313d3c7d55bd4fe5df6bb381eec')
