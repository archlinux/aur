# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>
# Maintainer: blaale
# NOTE: Modification of thunderbird PKGBUILD found in abs

pkgname=thunderbird-ubuntu
pkgver=38.2.0
pkgrel=1
pkgdesc="Standalone Mail/News reader with ubuntu patches"
arch=('i686' 'x86_64')
license=('MPL' 'GPL')
url="http://www.mozilla.org/thunderbird/"
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
makedepends=('unzip' 'zip' 'python2' 'wireless_tools' 'yasm' 'mesa' 'libpulse')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=${pkgver}")
conflicts=('thunderbird')
install=thunderbird.install
source=(https://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.bz2
        mozconfig
        thunderbird.desktop
        thunderbird-install-dir.patch
        vendor.js
        unity-menubar.patch)
options=('!emptydirs' '!makeflags')
sha256sums=('4881cf0a721a9d0204a6cff01e20a6c54010f4b576df2820cd699d17892ac2d0'
            '6d60c77705baae25dc9324765c420e8623173390e8d2abea66f3d0d30ce388e4'
            '3fba13d88aeb003ab0811ef739463858172ce0662a1c7d62835df3d83ddbb8fb'
            '24599eab8862476744fe1619a9a53a5b8cdcab30b3fc5767512f31d3529bd05d'
            '3a9697374cb990aa271523a3c7483e04a66491731b60b5e400d51f6fe7ca02fd'
            '3634df845fbc44747735172a3f6ebfce4a7627c290cdb724e1ceb3734a4cae7a')

prepare() {
  cd comm-esr${pkgver%%.*}
  patch -Np1 -i ../thunderbird-install-dir.patch

  cp "$srcdir/mozconfig" .mozconfig

  # patch in support for ubuntu unity menubar.
  patch -Np1 -i ../unity-menubar.patch

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' mozilla/configure
}

build() {
  cd comm-esr${pkgver%%.*}

  export PYTHON="/usr/bin/python2"

  make -f client.mk build
}

package() {
  cd comm-esr${pkgver%%.*}
  make -f client.mk DESTDIR="$pkgdir" install

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/thunderbird/defaults/preferences/vendor.js"

  for i in 16 22 24 32 48 256; do
      install -Dm644 other-licenses/branding/thunderbird/mailicon$i.png \
          "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/thunderbird.png"
  done

  install -Dm644 ../thunderbird.desktop \
      "$pkgdir/usr/share/applications/thunderbird.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/thunderbird/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "$pkgdir/usr/lib/thunderbird/dictionaries"
  ln -sf /usr/share/hyphen "$pkgdir/usr/lib/thunderbird/hyphenation"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf thunderbird "$pkgdir/usr/lib/thunderbird/thunderbird-bin"

  # Remove development stuff
  rm -r "$pkgdir"/usr/{include,lib/thunderbird-devel-*,share/idl}
}
