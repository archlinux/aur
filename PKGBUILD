# Maintainer : ksj <podhorsky.ksj@gmail.com>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-gtk3
pkgver=38.0.5
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('desktop-file-utils' 'alsa-lib' 'libxt' 'icu' 'gtk3' 'nss' 'libevent' 'hunspell'
         'startup-notification' 'libjpeg-turbo' 'libvpx' 'dbus-glib' 'hicolor-icon-theme'
         'gstreamer' 'sqlite')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'libpulse'
             'gst-plugins-base-libs' 'inetutils' 'gtk2')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video')
install=firefox.install
options=('!emptydirs' '!makeflags')
provides=('firefox')
conflicts=('firefox')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.bz2
        mozconfig firefox.desktop firefox-install-dir.patch vendor.js rhbz-966424.patch
        firefox-fixed-loading-icon.png firefox-build.patch firefox-build-prbool.patch
        firefox-enable-addons.patch xulrunner-24.0-jemalloc-ppc.patch xulrunner-24.0-s390-inlines.patch)

sha256sums=('4f53506d1e8a724a165ee509d9448fa7c9b7203183f53ae313063eb144a403b6'
            '2795239a53fee21c6182aa44e42eb2d827501d3e514676b9aa2d6d82fed6abdc'
            'd2a7610393ba259c35e3227b92e02ec91095a95189f56ac93ccdf6732772719c'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '4b50e9aec03432e21b44d18c4c97b2630bace606b033f7d556c9d3e3eb0f4fa4'
            '4f0046b39a8d98f6e4fc3360ec490cb2416e38c7b3e92699f7e511c206c2c961'
            '68e3a5b47c6d175cc95b98b069a15205f027cab83af9e075818d38610feb6213'
            'b218d44fd498bdc66919f98878a15720d953720c77f282ee8a70a0ae320698ed'
            '531db75865405b30ec7cd20f5e0f2da00bf346dbed144744e1b0d814bd5dcb12'
            '1e679adf2f853e94a965a3cfb9ddeeaa9e37a67799644108a269525b11600d00'
            'a1468e528d0362e4bcc4757881156d102b8fdcc76466f88e69774f71efe35a1b'
            '2c995f0d248e7f6fec1d7aa1e8d35d2d7e537afd9c122ffe582857980f641795')

prepare() {
  cd mozilla-release

  cp ../mozconfig .mozconfig
  
  patch -Np1 -i ../firefox-install-dir.patch
  patch -Np2 -i ../firefox-build.patch
  patch -Np2 -i ../xulrunner-24.0-jemalloc-ppc.patch
  patch -Np2 -i ../xulrunner-24.0-s390-inlines.patch
  patch -Np1 -i ../firefox-build-prbool.patch
  patch -Np2 -i ../rhbz-966424.patch
  patch -Np1 -i ../firefox-enable-addons.patch

  mkdir -p "$srcdir/path"

  # WebRTC build tries to execute "python" and expects Python 2
  ln -sf /usr/bin/python2 "$srcdir/path/python"

  # Use gold, as Mozilla can use some of its features, such as safe ICF
  #ln -s /usr/bin/ld.gold "$srcdir/path/ld"

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' configure

  # Fix tab loading icon (flickers with libpng 1.6)
  # https://bugzilla.mozilla.org/show_bug.cgi?id=841734
  # TODO: Remove this; Firefox 36 might use CSS animations for the loading icon
  # https://bugzilla.mozilla.org/show_bug.cgi?id=759252
	cp "$srcdir/firefox-fixed-loading-icon.png" \
    browser/themes/linux/tabbrowser/loading.png
}

build() {
  cd mozilla-release

  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"
  export MOZ_OPT_FLAGS='-O2 -g -pipe  -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches  -mtune=generic -Wformat-security -Wformat -Werror=format-security'
  export 'CFLAGS=-O2 -g -pipe  -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches  -mtune=generic -Wformat-security -Wformat -Werror=format-security'
  export 'CXXFLAGS=-O2 -g -pipe  -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches  -mtune=generic -Wformat-security -Wformat -Werror=format-security'
  export LDFLAGS=""
  export MOZ_SMP_FLAGS=-j2

  make -f client.mk build STRIP=/bin/true MOZ_MAKE_FLAGS=-j2 MOZ_SERVICES_SYNC=1
}

package() {
  cd mozilla-release
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/firefox.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"

  install -Dm644 ../firefox.desktop \
    "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"

  #workaround for now
  #https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"
}
