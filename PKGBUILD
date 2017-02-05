# Maintainer: Matt/ilikenwf <parwok@gmail.com>
# based on firefox-dev
# Contributor: <jnbek1972 at gmail dot com>
# Contributor: <raku at rakutiki.tv>
pkgname=waterfox-git
pkgver=51.0.1+55eacc009b
_realpkgver=49.0b10
_rcbuild=1
pkgrel=1
pkgdesc="64-Bit optimized Firefox fork, no data collection, allows unsigned extensions"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.waterfoxproject.org/"
depends=('gtk2' 'gtk3' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'ffmpeg2.8' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'ttf-font')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf'
             'xorg-server-xvfb' 'libpulse' 'inetutils' 'rust' 'autoconf2.13' 'clang' 'llvm')
provides=("waterfox=$pkgver")
conflicts=("waterfox waterfox-bin")
install=waterfox.install
options=('!emptydirs' '!makeflags')
source=(git://github.com/MrAlex94/Waterfox
        mozconfig
        waterfox.desktop
        firefox-install-dir.patch
        unused_missing.patch
        rhbz-966424.patch
        vendor.js
		)
sha512sums=('SKIP'
            '414c41f5b7710b49514a889effa452905761c5dc1810452bb6b2b1cdb1b600d0ef19756ea13b20b068026deaf3b7e9e602fff685b89066d1e278bcffd50b3d8b'
            '93937770fa66d63f69c6283ed1f19ac83b9c9c4f5cc34e79d11ac31676462be9f7f37bcd35e785ceb8c7d234a09236d1f26b21e551b622854076fb21bcda44d3'
            '266989b0c4a37254a40836a6193284a186230b48716907e4d249d73616f58382b258c41baa8c1ffc98d405f77bfafcd3438f749edcf391c7bd22185399adf4bd'
            '87225692ee6e643cd9d291608174c68e25b00818086d641847111924c457414faadf3ed6d10fddafd5bd4bc54eeea2055b7136ffeabadec8644a60e819e9356f'
            '0d69183bbfdceee89b3059c913c95e316c03b14b6b302675e16a03c32b74f30b7058344d8c6f2f5a4cfd33db9c7e6f52bf0f52d1c047a224b75e1745d0711c07'
            'd927e5e882115c780aa0d45034cb1652eaa191d95c15013639f9172ae734245caae070018465d73fdf86a01601d08c9e65f28468621422d799fe8451e6175cb7')
            
# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff

pkgver() {
	cd Waterfox
	echo $(cat browser/config/version.txt)"+"$(git rev-parse --short HEAD)
}

prepare() {
  cd Waterfox

  cp ../mozconfig .mozconfig
  patch -Np1 -i ../firefox-install-dir.patch
  patch -Np1 -i ../unused_missing.patch
  patch -Np0 -i ../rhbz-966424.patch

  echo -n "$_mozilla_api_key" >mozilla-api-key
  echo "ac_add_options --with-mozilla-api-keyfile=\"$PWD/mozilla-api-key\"" >>.mozconfig

  mkdir -p "$srcdir/path"

  # Fix tab loading icon (doesn't work with libpng 1.6)
  # https://bugzilla.mozilla.org/show_bug.cgi?id=841734
  #cp "$srcdir/firefox-fixed-loading-icon.png" \
  #  browser/themes/linux/tabbrowser/loading.png
}

build() {
  cd Waterfox

  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"

  make -f client.mk build -j8
}

package() {
  cd Waterfox
  mkdir -p "$pkgdir"
  DESTDIR="$pkgdir" make -f client.mk install

  install -Dm644 ../vendor.js "$pkgdir/opt/waterfox/browser/defaults/preferences/vendor.js"

  for i in 16 32 48; do
      install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox/browser/chrome/icons/default/default$i.png" \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox.png"
  done

  install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox/browser/icons/mozicon128.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/waterfox.png"
  install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox/browser/icons/mozicon128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/waterfox.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox.png"

  install -Dm644 ../waterfox.desktop \
    "$pkgdir/usr/share/applications/waterfox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/opt/waterfox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/opt/waterfox"
  ln -s /usr/share/hyphen "$pkgdir/opt/waterfox"
}

