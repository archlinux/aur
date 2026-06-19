# Maintainer: karboncore
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>

pkgname=thunderbird-globalmenu
pkgver=152.0
pkgrel=1
pkgdesc='Standalone mail and news reader from mozilla.org'
url='https://www.thunderbird.net/'
arch=(x86_64)
license=('MPL-2.0' 'GPL-2.0-only' 'LGPL-2.1-only')
depends=(
  glibc
  gtk3 libgdk-3.so libgtk-3.so
  mime-types
  dbus libdbus-1.so
  dbus-glib
  alsa-lib
  nss
  hunspell
  sqlite
  ttf-font
  libvpx libvpx.so
  zlib
  bzip2 libbz2.so
  botan
  libwebp libwebp.so libwebpdemux.so
  libevent
  libjpeg-turbo
  libffi libffi.so
  nspr
  libgcc
  libstdc++
  libx11
  libxrender
  libxfixes
  libxext
  libxcomposite
  libxdamage
  pango libpango-1.0.so
  cairo
  gdk-pixbuf2
  freetype2 libfreetype.so
  fontconfig libfontconfig.so
  glib2 libglib-2.0.so
  pixman libpixman-1.so
  gnupg
  json-c
  libcanberra
  ffmpeg
  # icu libicui18n.so libicuuc.so
)
makedepends=(
  unzip zip diffutils python nasm mesa libpulse libice libsm
  rust clang llvm cbindgen nodejs lld
  gawk perl findutils libotr wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi
)
options=(!emptydirs !makeflags !lto)
commit=https://gitlab.archlinux.org/archlinux/packaging/packages/thunderbird/-/raw/ea644662c7ce301d77ec2d4cc1f90a060814ab91
source=(https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}/source/thunderbird-${pkgver}.source.tar.xz{,.asc}
        $commit/clang22-wasm32-wasip1.patch
        $commit/vendor-prefs.js
        $commit/distribution.ini
        $commit/mozconfig.cfg
        $commit/metainfo.patch
        $commit/org.mozilla.Thunderbird.desktop
        $commit/missing-include.patch
)
validpgpkeys=(
  14F26682D0916CDD81E37B6D61B7B526D98F0353 # Mozilla Software Releases <release@mozilla.com>
  4360FE2109C49763186F8E21EBE41E90F6F12F6D # Mozilla Software Releases <release@mozilla.com>
)

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff

prepare() {
  cd thunderbird-$pkgver

  echo "${noextract[@]}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  sed -e 's|73114a5c28472e77082ad259113ffafb418ed602c1741f26da3e10278b0bf93e|a88d6cc10ec1322b53a8f4c782b5133135ace0fdfcf03d1624b768788e17be0f|' \
    -i third_party/rust/mp4parse/.cargo-checksum.json
  sed -e 's|880c982df0843cbdff38b9f9c3829a2d863a224e4de2260c41c3ac69e9148ad4|239b3e4d20498f69ed5f94481ed932340bd58cb485b26c35b09517f249d20d11|' \
    -i third_party/rust/bindgen/.cargo-checksum.json
  # Clear cargo checksums for glslopt - the glibc-2.43 patch modifies files in both
  # third_party and comm/third_party copies; clearing is simpler than computing exact hashes
  sed -i -e 's/\("files":{\)[^}]*/\1/' \
    third_party/rust/glslopt/.cargo-checksum.json
  sed -i -e 's/\("files":{\)[^}]*/\1/' \
    comm/third_party/rust/glslopt/.cargo-checksum.json
  # https://bugzilla.mozilla.org/show_bug.cgi?id=2041134
  sed -i 's/log\.warn(/log.warning(/' \
    comm/build/moz.configure/gecko_source.configure
  # Make icon transparent
  sed -i '/^<rect/d' comm/mail/branding/thunderbird/TB-symbolic.svg

  # Set BOTAN_VERSION from system-botan
  _botan_ver=$(pkg-config --modversion botan-3)
  sed -i "s|crypto_backend_version = CONFIG\[\"BOTAN_VERSION\"\]|crypto_backend_version = CONFIG[\"BOTAN_VERSION\"] or \"${_botan_ver}\"|" \
    comm/third_party/rnp/moz.build

  printf "%s" "$_google_api_key" >google-api-key
  printf "%s" "$_mozilla_api_key" >mozilla-api-key
  cp ../mozconfig.cfg .mozconfig
  sed "s|@PWD@|${PWD@Q}|g" -i .mozconfig
}

build() {
  cd thunderbird-$pkgver
  if [[ -n "${SOURCE_DATE_EPOCH}" ]]; then
    export MOZ_BUILD_DATE=$(date --date "@${SOURCE_DATE_EPOCH}" "+%Y%m%d%H%M%S")
  fi
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none
  export MOZBUILD_STATE_PATH="${srcdir}/mozbuild"
  export MOZ_NOSPAM=1

  # Set remoting name to fix the missing wayland icon
  export MOZ_APP_REMOTINGNAME=org.mozilla.Thunderbird

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  ./mach configure
  ./mach build
}

package() {
  optdepends=(
    'hunspell-en_us: Spell checking, American English'
    'libotr: OTR support for active one-to-one chats'
    'libnotify: Notification integration'
  )

  cd thunderbird-$pkgver
  DESTDIR="$pkgdir" ./mach install

  install -Dm 644 ../vendor-prefs.js -t "$pkgdir/usr/lib/thunderbird/defaults/pref"
  install -Dm 644 ../distribution.ini -t "$pkgdir/usr/lib/thunderbird/distribution"
  install -Dm 644 ../org.mozilla.Thunderbird.desktop -t "$pkgdir/usr/share/applications"
  install -Dm 644 comm/mail/branding/thunderbird/net.thunderbird.Thunderbird.appdata.xml \
    "$pkgdir/usr/share/metainfo/net.thunderbird.Thunderbird.appdata.xml"

  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 comm/mail/branding/thunderbird/default${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/org.mozilla.Thunderbird.png"
  done
  install -Dm644 comm/mail/branding/thunderbird/TB-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/thunderbird-symbolic.svg"

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/thunderbird/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/thunderbird/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/thunderbird" <<END
#!/bin/sh
exec /usr/lib/thunderbird/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/thunderbird" \
    "$pkgdir/usr/lib/thunderbird/thunderbird-bin"
}

sha512sums=('51b950af634e7c7dfb7c043d69f925ed6d50d4c44341761e7e3ef02d5db28d2c539cd8d9286195e3facf84869f57b12a58760105b5195c449b4e1e4c9b6200d2'
            'SKIP'
            'b7097f0d620be87047f6f11f152bd096dc144b1745fe30dc75db7d7050242c4178382f7e504cc10ad3545a3455174ca17a83fa3113443dffe660f28de006cb0e'
            '6918c0de63deeddc6f53b9ba331390556c12e0d649cf54587dfaabb98b32d6a597b63cf02809c7c58b15501720455a724d527375a8fb9d757ccca57460320734'
            '5cd3ac4c94ef6dcce72fba02bc18b771a2f67906ff795e0e3d71ce7db6d8a41165bd5443908470915bdbdb98dddd9cf3f837c4ba3a36413f55ec570e6efdbb9f'
            'f528f2645c44648a8a42015923e51b8626616e2c66cc3ff870c27223002c802c15616e570d639f9c79b3affa4b7f9e9f2c42c780bbcb42a55bd87edafa8352c5'
            '8373d45b594edea2aafd00151468e5c9491b1baa078882fea76669352d64843d5bdaa8ad87b0a9549e452aef7f246a5919b4b1e4c0c1deaf6ea65bc2dd120a32'
            'fffeb73e2055408c5598439b0214b3cb3bb4e53dac3090b880a55f64afcbc56ba5d32d1187829a08ef06d592513d158ced1fde2f20e2f01e967b5fbd3b2fafd4'
            '0736eadd278f034d3000dd0947ef75c2eff60fbba520931481984dfcdd83ca5cdfaa30257ad9b38ae82ab55d7fcf5b6025091a5618896c75f2a1ef461da3a5a5'
            )

provides=(thunderbird)
conflicts=(thunderbird)

source+=(https://github.com/Lexi-Ewald/unity-menubar/raw/9a69a0967c32991d488f3b47bb287ecf38aa1f55/unity-menubar.patch)
sha512sums+=(878952fe51cea206529d6e0b438c3a40e83e0318702ed2750d636bc2f05bedf0e33e664c3506a3a5f1e9f73549431bdb3ecfb3089240734f55ab26dc2d896cfc)
