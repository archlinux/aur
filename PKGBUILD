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
pkgver=119.0.1
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
changeslog=$pkgname.changes

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
_patchrev=22b224bf3e8c1431d2d9d961ca351cf3c50fdc15
options=('!emptydirs' !lto)
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
        0032-Bug-1822730-Add-basic-blob-protocol-handling-for-blo.patch
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

prepare() {
  cd firefox-$pkgver

  cp "$srcdir/mozconfig" .mozconfig

  echo -n "$_google_api_key" >google-api-key
  echo "ac_add_options --with-google-location-service-api-keyfile=\"$PWD/google-api-key\"" >>.mozconfig

  echo -n "$_google_default_client_id $_google_default_client_secret" >google-oauth-api-key
  echo "ac_add_options --with-google-safebrowsing-api-keyfile=\"$PWD/google-oauth-api-key\"" >>.mozconfig

  echo -n "$_mozilla_api_key" >mozilla-api-key
  echo "ac_add_options --with-mozilla-api-keyfile=\"$PWD/mozilla-api-key\"" >>.mozconfig

  for patch in "$srcdir"/*.patch ; do
    echo "Applying $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  #export CXXFLAGS="${CFLAGS}"
  cd firefox-$pkgver
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
  cd firefox-$pkgver

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

  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/}/SearchProvider
Version=2
END

}
sha256sums=('48cc43cab060e97467e9a17617f511a177e7b91b7e77e408425351a2cbb07f70'
            'SKIP'
            'be65b2421999ad5c8ffa363dc009ce2cd291badc422fbb456967616bad3e2e19'
            '4c93b2e1f1675e033ed7910fe5f379626a92903a940697430985bcfdf94afceb'
            'eaad0eee76f89e0a1a241742ec5c8ec9315b096f7b3e0ea302b253b926750aae'
            'c3c785256e7497118e9e19de4c1748664e8df5930a436040f029023a1190a9a5'
            'eb19d9568e8d7705b2a0c4774d4f6a758a910c0e5cf427727feb5884a2a1ee98'
            '4322124dc370ac56063837370a8107e85ca6e0d4037ff71ece5e7b0f55ed8053'
            'a8aeb8b73abe711752ebf1a561fb4af736854be5c298441b8de7a1148a47a416'
            'f1b6cdce0e35bce959c325ea9f1316fea062923bdad9091d58050bee21cc9102'
            '999f0f5c198f00943894639d9dd4157f3e078a40e1f8a815aef2dacd5158a67c'
            'bba76c5e13952ef45362f8e53a5c030e0f5d722f8f266228787136a5312330ea'
            'f2fcd4ca82b833f5e5b7e991882e24f09463cd837242b18cf163bc751f2e21d5'
            '766faefbd4898049e9913589962bf839da6785d50f0631b4eac7316f16bf2ea6'
            'ccb405fe8a3cae43b7211807eab90baf4ae99d9e09612304e6b3e52474f9434d'
            '516f6f38c442208c79f4c3d8734520ebe026607dc2d88c6b4383e7893522313b'
            '32d40630a010ee91d2c35c814ef2f567ad7faf859f8198735829958cb055f53b'
            '1ffdcff3d4e31c5cceddadfa0111c27a34480594238cdf85866ee1073d922910'
            '316c6ed1a85cee7ec1e00b6b3b869dbf47b81c23e8384d9f704f69e99a21c2e9'
            '5ee703cddba6045a03ee882ff70423fe185d009e2c912fc49ef66f7703ea46fe'
            '2400173d2c84573194c6af9031663a5b2332ccb4929b246b216c61c97d8b0a54'
            '77a4635a30d54f187efaae5ac1f1cb029445b1317f148053206ebeb6a3255ae6'
            '72d30acbe1e8488c6bd3af2e0813223842a63b859d6e7aff66d2f23612b7ad8b'
            '1b9b4ac7550b33f2dcce3ef7d64cdc52682cc78ce397aba9ff71cca93b1282be'
            'a319b263cd437a2a817845a0670137e8aef7826e768db8454994ecd2af01c247'
            '62e4d94c648a48313d3716a85c5503f99d02674cc97be6b86fdddbc397cd0999'
            '6684d5c564a4d4a8a2b90a51890abae719f419f81baae057b41e9b4cfba07c34'
            'fc53e7bcaa3ebcd0bb5e6562f57561dc23727690529cae97c86560fed05e05c0'
            'dfb11575e7d43071c9046762408b7267507c645020678d57689d55d3f68c0c28'
            'c4258daf80395735546d2e12214b77a14207e09be16372030322e459235a37ea'
            '6545e1406fe6ee307ea876dffb41ae5453469d388ff12941ab210d5e372462b6'
            '056dd0b79d0e1992dd6cdfe1553e5048d8c4cc8baf8812d69f9e2e55000467bd'
            '76f83f143ea043fa07e8db8e39163a17b5889ed6cdfe2e88b95440d7c4f8ef3e'
            'd747ba2ee13eda08f2d52006333f81d845b82b1b3e1c099d96a5de9aeea6ac0e'
            '7038651e09bd1f1cf2561ee977e6fcc58f7295ce821f419288da6d0b2bcc8feb'
            '0d7a0f8bd7f0a8f1319d79a433d848a3eb43e81f4a14f29d5c8602be49d93cb9'
            'ca63e1a8b93eed45fe1b6dc4da087d18b866570d99cfc6abfb8a7d3187d98e83')
