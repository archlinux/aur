# Maintainer: karboncore
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>

pkgname=thunderbird-globalmenu
pkgver=140.0
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
  botan2
  libwebp libwebp.so libwebpdemux.so
  libevent
  libjpeg-turbo
  libffi libffi.so
  nspr
  gcc-libs
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
  icu libicui18n.so libicuuc.so
)
makedepends=(
  unzip zip diffutils python nasm mesa libpulse libice libsm
  rust clang llvm cbindgen nodejs lld
  gawk perl findutils libotr wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi
)
options=(!emptydirs !makeflags !lto)
commit=https://gitlab.archlinux.org/archlinux/packaging/packages/thunderbird/-/raw/329bd1f8bfdde4ab87bf67ecbdc119cb69a73e95
source=(https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}/source/thunderbird-${pkgver}.source.tar.xz{,.asc}
        $commit/vendor-prefs.js
        $commit/distribution.ini
        $commit/mozconfig.cfg
        $commit/metainfo.patch
        $commit/org.mozilla.Thunderbird.desktop
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

  # Make icon transparent
  sed -i '/^<rect/d' comm/mail/branding/thunderbird/TB-symbolic.svg

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

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  ./mach configure
  ./mach build
  ./mach buildsymbols
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

sha512sums=('2e9a5fb44b21eba3e3295205142bfad666a65f9eea43118388968320597a940cf3c5675fbcf458fbbaa9e1bb85fe8a663feda6461b7e23f7103c5bb7a1103bd4'
            'SKIP'
            '6918c0de63deeddc6f53b9ba331390556c12e0d649cf54587dfaabb98b32d6a597b63cf02809c7c58b15501720455a724d527375a8fb9d757ccca57460320734'
            '5cd3ac4c94ef6dcce72fba02bc18b771a2f67906ff795e0e3d71ce7db6d8a41165bd5443908470915bdbdb98dddd9cf3f837c4ba3a36413f55ec570e6efdbb9f'
            '3a6957380243716065e9dff66cbbee8c5aa6b34b5b19bc6193a23407d33f6e4c23bfca55b929bee4739bdd2c47838cc0fd6667b188de066b795ab55e3bf275a6'
            '7e43b1f25827ddae615ad43fc1e11c6ba439d6c2049477dfe60e00188a70c0a76160c59a97cc01d1fd99c476f261c7cecb57628b5be48874be7cf991c22db290'
            'fffeb73e2055408c5598439b0214b3cb3bb4e53dac3090b880a55f64afcbc56ba5d32d1187829a08ef06d592513d158ced1fde2f20e2f01e967b5fbd3b2fafd4'
            )

provides=(thunderbird)
conflicts=(thunderbird)

source+=(unity-menubar.patch)
sha512sums+=(ab5ded12b555d21fabf9f4aafc91f2b109074dff746edd67252b1a9b9d37fc6f16c40961c69acefa69132abf902b31142c7bc3e32a968a09b47eeb1e5b97b314)
