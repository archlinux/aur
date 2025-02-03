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
pkgver=131.0.2
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
             'xorg-server-xvfb' 'libpulse' 'inetutils'
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
        0023-Do-not-use-gconf-for-proxy-settings-if-not-running-w.patch
        0024-Add-KDE-integration-to-Firefox-toolkit-parts.patch
        0025-Add-KDE-integration-to-Firefox.patch
        0026-Imported-patch-firefox-branded-icons.patch.patch
        0027-Allow-Eme-for-arm-and-Aarch64.patch
        0028-Shut-up-warnings-about-future-Rust-version-incompati.patch
        0029-Bug-1796523-Workaround-source-locations-for-function.patch
        0030-Bug-1822730-Add-basic-blob-protocol-handling-for-blo.patch
        0031-Bug-1862601-Part-12-Add-new-line-break-classes.-r.patch
        0032-Map-linearly-from-cubeb-volume-to-pa-volume.patch
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
sha256sums=('040e834ac94dd5246f9d77a66f7b43c43c62f538d00b5f94597534dc1db77616'
            'SKIP'
            'db4650fb8ef2702f14b5075958b9212d6c74a1809a5ccf34de03281738a01b94'
            '4c93b2e1f1675e033ed7910fe5f379626a92903a940697430985bcfdf94afceb'
            'eaad0eee76f89e0a1a241742ec5c8ec9315b096f7b3e0ea302b253b926750aae'
            '85a20354e1323287728e2d73ef5c5cbb98bfa8e5f8bea1a963cf9a0aa9fbeb51'
            '160a30005fc1ed97be5a7ed58297be7bc14f61aad74a7c84624428ff7c5b1bc5'
            '4322124dc370ac56063837370a8107e85ca6e0d4037ff71ece5e7b0f55ed8053'
            '16fb622422340da9ac0c070a9569d48791b5436409c5c454b4010375f4f7a375'
            '2fde308b0d83a3700cfe8c528a46b7375f23b84b7b29a85148b7019615114529'
            '9014c66f6e8b1166ab06d9ffdeeb1e4e40efa6b9ade6aadaa5743024d5f23fbd'
            'bba76c5e13952ef45362f8e53a5c030e0f5d722f8f266228787136a5312330ea'
            'f2fcd4ca82b833f5e5b7e991882e24f09463cd837242b18cf163bc751f2e21d5'
            '766faefbd4898049e9913589962bf839da6785d50f0631b4eac7316f16bf2ea6'
            '6e04f5789f02b0f6be550b3bbe14f64e61017d35edb0478deef6e4140d5551e4'
            '82ea32493f000809883733aa97736c460272e73083744e0a9abae25b7245390c'
            '6145dc18238fca575dbbe65a3c244984cb132c0a08a02520af036bf77144b7c1'
            '1ffdcff3d4e31c5cceddadfa0111c27a34480594238cdf85866ee1073d922910'
            '3144c2f38c9e60ba00f231e7a8051ca41cdc5d9f542c0144f4549f525a8c129f'
            'eff8c7538751a35acf3ce60f5ef6cce5d8da99ac06f1086753a805e6e8440235'
            '35439d1e7993d7bab562986e49f60f3adc5052dba1947bc22f8fd1782627f23e'
            '850c6d35cc105fe9dccd6c2d5d84b8129c5e8278a955d2bdc1314c94d8d85388'
            '54463246e5cfb36846907ea7924b3e43546ff55980de16517f4ff52e999765de'
            '41274c679fc7f2bf3063c9080e1a5623b2e48197d00c5dc62e2f4bb77ff0eacf'
            '09857996ec01ad6032d8fcc2839a24e72df87d429ecc71a6a696db8e09257349'
            'dc748dc8317321653bfedebc745a2b66e0e5d6fa28f3637f619f92f613d417b3'
            'afc3cce56cb97056b04834f4c68100501b392eaf8875705b4a629b8f65a97925'
            'a983f79d0a9c8b17ce3271250dd61e49a2ea9e70bf526f4f586fb5e17c01fcba'
            '79aec751d2b27f4b2f0f8f564ebd1807fe13675b945a0e0b418e6e0286ad95fb'
            '2bb09d401122c1655cf4f02e5ceca9b3d7513655be39a7c790a2246113cce608'
            'e50879fcb094faf6529d03564aae37d608de81cb07c86907711b971bb043968d'
            'efa70f70f0de91a12ce09813eb5040cacad1863fe40d43141835fd809f3f5fcf'
            '9416982b18858969f261328e06f7d643388894fac02a8228eca99ad887618411'
            '90388731ebba0f0f6f3e2fbc4d9df38fdd60149169be6d58a5c2e21dc81b7629'
            '8531ed52332e4290b4c1c9552236689cc8b250855ae20365eac44e1cbc7a9504'
            'c7566f95d29d5dc0de6f4ccabd87f5e93a1c91dedbabfe7ce7e3193f02ba10a5'
            '660df6bd974713b2b4558e62a483624c35a61f4bbec53acf07cf0641c5c9edcc')
