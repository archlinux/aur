
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=banshee
pkgver=2.6.2
pkgrel=9
pkgdesc="Music management and playback for GNOME"
arch=('i686' 'x86_64')
url="http://banshee.fm/"
license=('MIT')
depends=(libxxf86vm gst-plugins-base-libs mono-addins dbus-sharp-glib webkitgtk2 libsoup-gnome gdata-sharp taglib-sharp-git gudev-sharp gkeyfile-sharp gconf-sharp libmtp libgpod mono-zeroconf hicolor-icon-theme media-player-info gst-plugins-bad mono-upnp gst-plugins-good gvfs)
makedepends=('intltool' 'gnome-doc-utils' 'gtk-sharp-beans' 'gnome-common')
optdepends=('gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
            'brasero: CD burning')
source=(http://download.gnome.org/sources/$pkgname/2.6/$pkgname-$pkgver.tar.xz
        Initial-port-to-GStreamer-1.0.patch
        Remove-build-time-enable-gapless-playback-option.patch
	Don-t-use-the-new-decoded-pad-signal-of-decodebin.patch
	Use-new-style-GStreamer-1.0-raw-audio-caps-in-the-WA.patch
	sqlite_fix.patch
        Remove-IDBusExportable-inheritance-from-exported-int.patch
        Use-dbus-2.patch)
md5sums=('12dbb8a996783f7081d538062a8589b7'
         '16cbe2ef60e6f9b22015585bb3209648'
         '0bf7ee4241b12538779c9ecc401d142a'
         'f87534f54029794bd7be2a123ab01300'
         'd092827720e4a11549587eb3131123ae'
         '2677e6edc2e0d2ce8994adc852dda362'
         '3b28f10e167c0aae27157dcc3b828b67'
         '2c4436f7aba58fdd0c5a38d709d73e5c')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../Initial-port-to-GStreamer-1.0.patch
  patch -p1 -i ../Remove-build-time-enable-gapless-playback-option.patch
  patch -p1 -i ../Don-t-use-the-new-decoded-pad-signal-of-decodebin.patch
  patch -p1 -i ../Use-new-style-GStreamer-1.0-raw-audio-caps-in-the-WA.patch
  patch -p1 -i ../sqlite_fix.patch
  patch -p1 -i ../Remove-IDBusExportable-inheritance-from-exported-int.patch
  patch -p1 -i ../Use-dbus-2.patch

  NOCONFIGURE=1 ./autogen.sh
# Fix build with mono 4.0 (Fedora)
  sed -i "s#mono/2.0#mono/4.5#g" configure
  sed -i "s#Mono 2.0#Mono 4.5#g" configure
}

build() {
  export MONO_SHARED_DIR="$srcdir/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd $pkgname-$pkgver
  MCS=/usr/bin/mcs ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-docs \
              --disable-static \
              --disable-scrollkeeper \
              --disable-schemas-install \
              --disable-boo \
              --with-vendor-build-id=ArchLinux
  make
}

package() {
  export MONO_SHARED_DIR="$srcdir/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
