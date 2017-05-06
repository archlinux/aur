# Maintainer: André Silva <emulatorman@riseup.net>
# Maintainer: Márcio Silva <coadde@riseup.net>

# We're getting this from Debian Sid
_pkgname=seamonkey
pkgname=iceape
epoch=1
_brandingver=2.39
_brandingrel=3
pkgver=2.46
pkgrel=4
pkgdesc="A libre version of Debian Iceape, the internet suite based on SeaMonkey."
arch=(i686 x86_64 armv7h)
license=(MPL GPL LGPL)
depends=(alsa-lib dbus-glib desktop-file-utils gtk2 gtk3 hunspell libevent libnotify libvpx libxt mime-types mozilla-common mozilla-searchplugins nss sqlite startup-notification libpulse icu=59.1 gconf)
makedepends=(unzip zip pkg-config python2 librsvg-stable wireless_tools yasm mesa autoconf2.13 quilt imake python3 gst-plugins-base)
optdepends=('gst-plugins-base: vorbis decoding, ogg demuxing'
            'gst-plugins-bad: aac, vp8 and opus decoding'
            'gst-plugins-good: webm and mp4 demuxing'
            'gst-plugins-ugly: h.264 decoding')
replaces=("$_pkgname")
conflicts=("$_pkgname")
provides=("$_pkgname")
install=$pkgname.install
url="https://wiki.parabola.nu/$pkgname"
source=("https://archive.mozilla.org/pub/mozilla.org/$_pkgname/releases/$pkgver/source/$_pkgname-$pkgver.source.tar.xz"
        "https://github.com/coadde/$pkgname/raw/master/tarballs/${pkgname}_$_brandingver-$_brandingrel.branding.tar.xz"
        "https://github.com/coadde/$pkgname/raw/master/tarballs/${pkgname}_$_brandingver-$_brandingrel.branding.tar.xz.sig"
        mozconfig
        $pkgname.desktop
        $pkgname-2.0-lang.patch
        libre.patch
        rhbz-966424.patch
        xulrunner-27.0-build-arm.patch
        add-bracket-for-sed-4.3-compliance.patch)
sha256sums=('39c84ce6fa1ed7c30152473e0dcd858df07437e84b29e5a18973db437a28a912'
            'ed6f0aab804235a8ea32631b8d8d664329e9507f7aa6fb016c87042bace51a44'
            'SKIP'
            '34876d8d34fc15b21b6343b834b2328b164d23142cae3adc36395bfbeb0ea21d'
            '46ac418fe26937460a36a593d71c8f5cef1288c9e747cac4ec4ca92db56da45d'
            'ab19d10fbd6258aec37ab5e5efb12429814b2c24a1193284a48dd654311b4e2e'
            '8a8db47b7c6a12c030ccf6b54fa926a02d27199bf6ee5aa0b059ebda33d657ac'
            '746cb474c5a2c26fc474256e430e035e604b71b27df1003d4af85018fa263f4a'
            'bc83b8a51c81a401da2fbe1f7cd0843248c32607d3a51119585df074d797922e'
            '705223f37b0016fe9fcf4e89d7cbed4ae0c192a5e3e1b7055ba0a9577da14077')
validpgpkeys=(
              'C92BAA713B8D53D3CAE63FC9E6974752F9704456' # André Silva
              '684D54A189305A9CC95446D36B888913DDB59515' # Márcio Silva
)

if [[ "$CARCH" == arm* ]]; then
  highmem=1
fi

prepare() {
  cd "$_pkgname-$pkgver"

  install -m755 -d $pkgname
  mv -v "$srcdir"/$pkgname-$_brandingver/{branding,extras,patches} $pkgname

  export QUILT_PATCHES=$pkgname/patches
  export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
  export QUILT_DIFF_ARGS='--no-timestamps'

  quilt push -av

#  patch -Np1 -i "$srcdir/$pkgname-2.0-lang.patch"
  patch -Np1 -i "$srcdir/libre.patch"

  # set up a simple non-animated throbber from the icon
  for throbber_target_gif in suite/themes/{classic,modern}/communicator/brand/throbber{,16}-anim.png; do
    install -m644 $pkgname/extras/Throbber-small.gif $throbber_target_gif
  done
  for throbber_target_png in suite/themes/{classic,modern}/communicator/brand/throbber{,16}-single.png; do
    install -m644 $pkgname/extras/Throbber-small.png $throbber_target_png
  done

  install -m644 $pkgname/extras/preview.png suite/themes/classic

  # Convert svg file to png and replace seamonkey to iceape icons
  _brandingdir=$pkgname/branding
  brandingdir=suite/branding/nightly
  for i in 16 48; do
    rsvg-convert -w $i -h $i $_brandingdir/${pkgname}_icon_plain.svg \
      -o $brandingdir/icons/gtk/default$i.png
    rsvg-convert -w $i -h $i $_brandingdir/${pkgname}_icon_plain.svg \
      -o $brandingdir/icons/gtk/main-window$i.png
  done

  for i in 32 48 64; do
    rsvg-convert -w $i -h $i $_brandingdir/${pkgname}_icon_plain.svg \
      -o $brandingdir/content/icon$i.png
  done

  rsvg-convert -w 32 -h 32 $_brandingdir/${pkgname}_icon_plain.svg \
    -o $brandingdir/icons/gtk/default.png

  rsvg-convert -w 32 -h 32 $_brandingdir/${pkgname}_icon_plain.svg \
    -o $brandingdir/icons/gtk/main-window.png

  rsvg-convert -w 128 -h 128 $_brandingdir/${pkgname}_icon_plain.svg \
    -o $brandingdir/icons/gtk/${pkgname}.png

  rsvg-convert -w 200 -h 200 $_brandingdir/${pkgname}_icon_plain.svg \
    -o $brandingdir/content/logo.gif

  rsvg-convert -w 300 -h 280 $_brandingdir/${pkgname}_logo_plain.svg \
    -o $brandingdir/content/about.png

  rsvg-convert -w 1138 -h 1152 $_brandingdir/${pkgname}_background_plain.svg \
    -o $brandingdir/content/messenger-start-bg.png

  # Create app-icons folder for iceape*.png icons
  install -m755 -d $_brandingdir/app-icons

  # Icons for /usr/share/icons/hicolor
  for i in 16 32 48 64 128; do
    rsvg-convert -w $i -h $i $_brandingdir/${pkgname}_icon_plain.svg \
      -o $_brandingdir/app-icons/$pkgname${i}.png
  done

  cp "${srcdir}/mozconfig" .mozconfig

  # FS#48404
  #echo "ac_add_options --enable-gstreamer=1.0" >> .mozconfig

  # https://bugs.archlinux.org/task/41689
  patch -Np1 -d mozilla -i "$srcdir/rhbz-966424.patch"

  # Don't exit with error when some libs are missing which we have in
  # system.
  sed -i '/^MOZ_PKG_FATAL_WARNINGS/s@= 1@= 0@' suite/installer/Makefile.in

  # configure script misdetects the preprocessor without an optimization level
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' configure

  # 2.26 build fix from wgnie (blfs ch 37)
  sed -i 's/$(MOZ_ZLIB_CFLAGS)/& $(MOZ_PIXMAN_CFLAGS)/' config/config.mk

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1329272
  patch -Np1 -i ../add-bracket-for-sed-4.3-compliance.patch

  # ARM-specific changes
  if [[ "$CARCH" == arm* ]]; then
    cat >> .mozconfig <<- EOF
	ac_add_options --disable-elf-hack
	EOF

    LDFLAGS+=" -Wl,--no-keep-memory -Wl,--reduce-memory-overheads"
    patch -p2 -d mozilla -i "$srcdir/xulrunner-27.0-build-arm.patch"
  fi
}

build() {
  cd "$_pkgname-$pkgver"

  export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/$pkgname-$pkgver"
  export MOZ_MAKE_FLAGS="$MAKEFLAGS"
  unset MAKEFLAGS
  unset CPPFLAGS

  # GCC 6
  CFLAGS+=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"
  CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"

  make -j1 -f client.mk build
}

package() {
  cd "$_pkgname-$pkgver"

  make -j1 -f client.mk DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/lib/$pkgname-$pkgver/{dictionaries,hyphenation,searchplugins}
  ln -sf /usr/share/hunspell "$pkgdir/usr/lib/$pkgname-$pkgver/dictionaries"
  ln -sf /usr/share/hyphen "$pkgdir/usr/lib/$pkgname-$pkgver/hyphenation"
  ln -sf /usr/lib/mozilla/searchplugins "$pkgdir/usr/lib/$pkgname-$pkgver/searchplugins"

  install -m755 -d "$pkgdir/usr/share/applications"
  install -m755 -d "$pkgdir/usr/share/pixmaps"

  _brandingdir=$pkgname/branding
  brandingdir=suite/branding/nightly
  install -m644 $brandingdir/icons/gtk/iceape.png \
                "$pkgdir/usr/share/pixmaps/"

  for i in 16 32 48 64 128; do
      install -Dm644 $_brandingdir/app-icons/$pkgname$i.png "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dm644 $_brandingdir/${pkgname}_icon_plain.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  install -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/"

  rm -r "$pkgdir"/usr/{include,lib/$pkgname-devel-$pkgver,share/idl}
}
