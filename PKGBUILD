# Maintainer: karboncore
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>

pkgname=thunderbird-globalmenu
pkgver=148.0
pkgrel=4
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
  # icu libicui18n.so libicuuc.so
)
makedepends=(
  unzip zip diffutils python nasm mesa libpulse libice libsm
  rust clang llvm cbindgen nodejs lld
  gawk perl findutils libotr wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi
)
options=(!emptydirs !makeflags !lto)
commit=https://gitlab.archlinux.org/archlinux/packaging/packages/thunderbird/-/raw/baade618ed414ac56965bfd4d408e9fe95694307
source=(https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}/source/thunderbird-${pkgver}.source.tar.xz{,.asc}
        $commit/0023-bmo-2006630-remove-gitmodules-and-gitattributes-from-cargo-checksum-files.patch
        $commit/0024-bgo-969412-glibc-2.43.patch
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

sha512sums=('ec5e586206ef217f37eb6985356994e7e7c9db6090f57d5b4c43a3a5dc0e1f5a56c0e7080d86fb895446845f9c9b948284f7417afebcf6e6120eca0e1ed238f3'
            'SKIP'
            '0c21ea237ed8386f6152fc4902ef230e975c389c08f2c3eb1b6c8c3942ac9e8c20ab5448dd2680825a86cb39628e968d6c50c36569b89140ccb55294ae8e3435'
            '470f37b6401c9a031d11b56ed94dacc3f3e36e86c27931c5924ec8c3ad8f9676970d7d29af8f288ac88081a2a785b088365412128076559e1ba4df1546026dc8'
            '6918c0de63deeddc6f53b9ba331390556c12e0d649cf54587dfaabb98b32d6a597b63cf02809c7c58b15501720455a724d527375a8fb9d757ccca57460320734'
            '5cd3ac4c94ef6dcce72fba02bc18b771a2f67906ff795e0e3d71ce7db6d8a41165bd5443908470915bdbdb98dddd9cf3f837c4ba3a36413f55ec570e6efdbb9f'
            'f528f2645c44648a8a42015923e51b8626616e2c66cc3ff870c27223002c802c15616e570d639f9c79b3affa4b7f9e9f2c42c780bbcb42a55bd87edafa8352c5'
            '7e43b1f25827ddae615ad43fc1e11c6ba439d6c2049477dfe60e00188a70c0a76160c59a97cc01d1fd99c476f261c7cecb57628b5be48874be7cf991c22db290'
            'fffeb73e2055408c5598439b0214b3cb3bb4e53dac3090b880a55f64afcbc56ba5d32d1187829a08ef06d592513d158ced1fde2f20e2f01e967b5fbd3b2fafd4'
            )

provides=(thunderbird)
conflicts=(thunderbird)

source+=(https://github.com/Lexi-Ewald/unity-menubar/raw/a4ee19d6d7c10875e0f1831481a836262de2cadb/unity-menubar.patch)
sha512sums+=(1a0e1be20d43ce91babb36df6b33401237adda3fa582d24fba39a94bacde6f09859a9ec5c9ee35d76fe6fa14a0476ea364d533d62ddac9a73c1563db6d794876)
