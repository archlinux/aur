# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: neeshy <neeshy@tfwno.gf>
# Contributor: Charadon <dev at iotib dot net>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

pkgname=serpent-browser
pkgver=2020.11.25
pkgrel=1
pkgdesc="Unbranded version of Basilisk web browser"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://www.basilisk-browser.org/"
license=(MPL GPL LGPL)
depends=(gtk2 gtk3 libxt mailcap nss alsa-lib icu ttf-font libpulse)
makedepends=(unzip zip python2 yasm mesa autoconf2.13)
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
provides=(basilisk)
conflicts=(basilisk)
options=(!emptydirs !makeflags)

source=("${pkgname%-git}::git+https://repo.palemoon.org/MoonchildProductions/Basilisk.git#tag=v${pkgver}"
        serpent-browser.desktop
        "git+https://repo.palemoon.org/MoonchildProductions/UXP.git")
sha256sums=('SKIP'
            'ba1502352e069f6945519228ef776e4c2eadaf5165132ec9edcbe71135b7c848'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  git submodule init
  git config 'submodule.platform.url' "${srcdir}/UXP"
  git submodule update


  cat > .mozconfig << EOF
mk_add_options AUTOCLOBBER=1
ac_add_options --enable-application=basilisk
mk_add_options PYTHON=/usr/bin/python2
mk_add_options AUTOCONF=/usr/bin/autoconf-2.13
 
# Please see https://www.palemoon.org/redist.shtml for restrictions when using the official branding.
# Build options taken from official Basilisk binary from its about:buildconfig
 
ac_add_options --enable-default-toolkit=cairo-gtk3
ac_add_options --enable-jemalloc
ac_add_options --enable-strip
ac_add_options --with-pthreads
ac_add_options --enable-update-channel=release
ac_add_options --enable-av1
ac_add_options --enable-eme
ac_add_options --disable-official-vendor
ac_add_options --enable-optimize="-O2 -msse2 -mfpmath=sse"
ac_add_options --disable-necko-wifi
ac_add_options --disable-dbus
ac_add_options --disable-gconf
ac_add_options --disable-gio
ac_add_options --disable-debug-symbols 
ac_add_options --disable-tests
ac_add_options --prefix=/usr
export MOZILLA_OFFICIAL=0
mk_add_options MOZ_MAKE_FLAGS="-j$(nproc)"
EOF
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  make -f client.mk build
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  make -f client.mk DESTDIR="$pkgdir" install

  local _i
  for _i in 16 32 48; do
    install -Dm644 "basilisk/branding/unofficial/default$_i.png" \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/basilisk.png"
  done
  install -Dm644 basilisk/branding/unofficial/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/basilisk.png"
  install -Dm644 basilisk/branding/unofficial/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/basilisk.png"
  install -Dm644 basilisk/branding/unofficial/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/basilisk.png"
  install -Dm644 basilisk/branding/unofficial/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/basilisk.png"

  install -Dm644 "$srcdir/serpent-browser.desktop" \
    "$pkgdir/usr/share/applications/serpent-browser.desktop"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf basilisk "$pkgdir/usr/lib/basilisk-$(< basilisk/config/version.txt)/basilisk-bin"
}
