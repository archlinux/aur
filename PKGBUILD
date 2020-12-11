# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird: https://git.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/thunderbird

pkgname=thunderbird-beta
_pkgname=thunderbird
_pkgver=84.0
pkgver=${_pkgver}b3
pkgrel=1
pkgdesc='Standalone mail and news reader from mozilla.org - Bleeding edge version'
url='https://www.mozilla.org/thunderbird/'
arch=(x86_64)
license=(MPL GPL LGPL)
depends=(
  glibc gtk3 libgdk-3.so mime-types dbus libdbus-1.so dbus-glib alsa-lib nss
  hunspell sqlite ttf-font libvpx libvpx.so zlib bzip2 botan libwebp libevent
  libjpeg-turbo libffi nspr gcc-libs libx11 libxrender libxfixes libxext
  libxcomposite libxdamage pango libpango-1.0.so cairo gdk-pixbuf2 icu
  libicui18n.so libicuuc.so freetype2 libfreetype.so fontconfig
  libfontconfig.so glib2 libglib-2.0.so pixman libpixman-1.so gnupg
)
makedepends=(
  unzip zip diffutils python python-setuptools yasm nasm mesa imake libpulse
  inetutils xorg-server-xvfb autoconf2.13 rust clang llvm gtk2 cbindgen nodejs
  gawk perl findutils
)
optdepends=('libcanberra: sound support')
options=(!emptydirs !makeflags)
provides=("thunderbird=$pkgver")
conflicts=('thunderbird-beta-bin')
source=(https://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.xz{,.asc}
        thunderbird-beta.desktop
        vendor-prefs.js
        distribution.ini
        mozconfig.cfg)
validpgpkeys=(14F26682D0916CDD81E37B6D61B7B526D98F0353) # Mozilla Software Releases <release@mozilla.com>

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
  cd $_pkgname-$_pkgver

  echo "${noextract[@]}"

  printf "%s" "$_google_api_key" >google-api-key
  printf "%s" "$_mozilla_api_key" >mozilla-api-key
  cp ../mozconfig.cfg .mozconfig
  sed "s|@PWD@|${PWD@Q}|g" -i .mozconfig
}

build() {
  cd $_pkgname-$_pkgver
  if [[ -n "${SOURCE_DATE_EPOCH}" ]]; then
    export MOZ_BUILD_DATE=$(date --date "@${SOURCE_DATE_EPOCH}" "+%Y%m%d%H%M%S")
  fi
  ./mach create-mach-environment
  ./mach configure
  ./mach build
  ./mach buildsymbols
}

package() {
  cd $_pkgname-$_pkgver
  DESTDIR="$pkgdir" ./mach install

  install -Dm 644 ../vendor-prefs.js -t "$pkgdir/usr/lib/$pkgname/defaults/pref"
  install -Dm 644 ../distribution.ini -t "$pkgdir/usr/lib/$pkgname/distribution"
  install -Dm 644 ../$pkgname.desktop -t "$pkgdir/usr/share/applications"

  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 comm/mail/branding/thunderbird/default${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dm644 comm/mail/branding/thunderbird/TB-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/thunderbird-symbolic.svg"

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/$pkgname/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/$pkgname/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$pkgname" \
    "$pkgdir/usr/lib/$pkgname/thunderbird-bin"
}

sha256sums=('55ffd4ed6d4e828aded35d7ccc024b60e29b2631a1f06a318c3be995e51c0e48'
            'SKIP'
            'd7aa1bd77f74c255446eec4171e4360c7a6215dac1d29c8ee71ec1f2a03bda3d'
            'fa11b4736bbf53ec015f71cd42b1040b22d1a855c562b76927b3f0eccb925c85'
            'bc3aae2cc00dc9806f54606f98d967366a2ba7223f6a3ad1c658a653ebff5569'
            'bf77cebf208318f60ab50b3982e7cf257f0f37b486e3b6d6b208ee64205270da')
