# Maintainer: FennecTECH <fennectech@gmail.com>
pkgname=firestorm-bin
pkgver=7.2.5.81788
pkgrel=2
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life."
url="http://www.firestormviewer.org/"
license=('GPL')
arch=('x86_64')
depends=(alsa-lib at-spi2-core cairo dbus expat fontconfig glib2 glu
         libcups libgl libx11 libxcb libxcomposite libxcrypt-compat
         libxdamage libxext libxfixes libxkbcommon libxrandr mesa nspr
         nss pango systemd-libs util-linux-libs hicolor-icon-theme)
# Libraries loaded at runtime only if present, plus the 32-bit runtime
# for the Vivox voice client (SLVoice), which is only used on OpenSim grids.
# Second Life voice uses the 64-bit WebRTC library instead.
optdepends=(
  'gst-plugins-good: for in-world media playback (GStreamer)'
  'gst-plugins-bad: additional media codecs'
  'gst-plugins-ugly: additional media codecs'
  'gst-libav: additional media codecs'
  'libpulse: for PulseAudio audio support'
  'pipewire: for PipeWire audio support'
  'jack: for JACK audio support'
  'libnotify: for desktop notifications'
  'gtk3: for the native file picker'
  'xdg-utils: for opening links in your web browser'
#  'lib32-glibc: for OpenSim voice (Vivox)'
#  'lib32-gcc-libs: for OpenSim voice (Vivox)'
#  'lib32-util-linux: for OpenSim voice (Vivox)'
#  'lib32-zlib: for OpenSim voice (Vivox)'
#  'lib32-libidn11: for OpenSim voice (Vivox, AUR)'
)

install=firestorm.install
tardir="Phoenix-Firestorm-Releasex64_AVX2-${pkgver//./-}"
source=("https://downloads.firestormviewer.org/release/linux/${tardir}.tar.xz"
        firestorm.desktop
        firestorm.launcher)
b2sums=('2f9a2e4d2d12b1368fb43204413ad7dd206d322468818723c6b0c90165e27d3af8fd2ea9714dd892e06f0b36a9eb7a13f595db7964230abef43a22c6211cbc0a'
	'225364d45839e61dd2ed3f3120e0c42111e72c07821180aa60de422731c61b3fc55cfb9977065d067e76a007461c05543441a30fcd8f9b1454f4b2e06e03a608'
        '86c8ea09226dceaa40998ea9393bdd1d453105648a7350d9640df0c2e1911e2742bff4b72bc0cb06d2707007029ce3b5ccec84b11a371e8f89c4f4941e5ec152')

prepare() {
  cd "${srcdir}/${tardir}"
  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

package() {
  install -d "${pkgdir}/usr/lib"
  cp -a "${srcdir}/${tardir}" "${pkgdir}"/usr/lib/firestorm
  cd "${pkgdir}/usr/lib/firestorm"

  find app_settings skins -type f -execdir chmod 644 "{}" +

  # find and remove broken symlinks
  find -L . -type l -delete

  # Install desktop file
  install -D -m644 "${srcdir}"/firestorm.desktop \
          "$pkgdir"/usr/share/applications/firestorm.desktop

  # Install icon file
  install -D -m644 firestorm_icon.png \
          "$pkgdir"/usr/share/pixmaps/firestorm.png

  # Install launcher
  install -D -m755 "${srcdir}"/firestorm.launcher \
          "$pkgdir"/usr/bin/firestorm
}
