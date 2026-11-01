# Maintainer: FennecTECH <fennectech@gmail.com>
pkgname=firestorm-bin
pkgver=7.2.5.81788
pkgrel=1
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life."
url="http://www.firestormviewer.org/"
license=('GPL')
arch=('x86_64')
depends=(apr-util dbus-glib glu gtk2 lib32-libidn lib32-util-linux 
	 lib32-zlib libbsd libgl libidn libjpeg-turbo
         libpng libxcrypt-compat libxss libxml2 mesa nss openal sdl
         vlc zlib)
optdepends=(
  'alsa-lib: for ALSA support'
  'pepper-flash: for inworld Flash support'
  'freealut: for OpenAL support'
#  'gstreamer: For video support - may need good, bad and ugly plugins'
  'gst-plugins-good: for parcle media'
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
install=firestorm.install
tardir="Phoenix-Firestorm-Releasex64_AVX2-${pkgver//./-}"
source=("https://downloads.firestormviewer.org/release/linux/${tardir}.tar.xz"
        firestorm.desktop
        firestorm.launcher)
b2sums=('2f9a2e4d2d12b1368fb43204413ad7dd206d322468818723c6b0c90165e27d3af8fd2ea9714dd892e06f0b36a9eb7a13f595db7964230abef43a22c6211cbc0a'
	'225364d45839e61dd2ed3f3120e0c42111e72c07821180aa60de422731c61b3fc55cfb9977065d067e76a007461c05543441a30fcd8f9b1454f4b2e06e03a608'
        '681c0d8b4cb4324249ad4fd20e7d906e55595fac1658bafbe310195bcefa6783264900908ef4fdab59c71eb4d9e79deb6a0e270469f756e4a9f43b47eff5662d')

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
