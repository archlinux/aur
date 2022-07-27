# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-bin
pkgver=6.5.6.66221
pkgrel=1
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life."
url="http://www.firestormviewer.org/"
license=('GPL')
arch=('x86_64')
depends=(apr-util dbus-glib glu gtk2 lib32-libidn lib32-libsndfile
         lib32-util-linux lib32-zlib libbsd libgl libidn libjpeg-turbo
         libpng libxcrypt-compat libxss libxml2 mesa nss openal sdl
         vlc zlib)
optdepends=(
  'alsa-lib: for ALSA support'
  'pepper-flash: for inworld Flash support'
  'freealut: for OpenAL support'
  'gstreamer: For video support - may need good, bad and ugly plugins'
  'lib32-gst-plugins-good: for voice support'
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
install=firestorm.install
tardir="Phoenix_Firestorm-Releasex64_x86_64_${pkgver}"
source=("https://downloads.firestormviewer.org/linux/Phoenix_Firestorm-Releasex64_x86_64_$pkgver.tar.xz"
        firestorm.desktop
        firestorm.launcher)
b2sums=('a895b728be610680375e1c63f22b789286515920888aa8f3f06db478e15e39ad269d018b746fafd2b99458d66acf7542bfdec7e309f3258e13fef55ae60a5a25'
        'd9343e4f93fc549fa3dc98bef3bfcd96ffae11e0fbdcc0ef604312e5fa1e0b5217a44e0988dac24fe2ce556c2737322ac66c8cc026aee471d2263743c4287f30'
        '5b9342aa587e12bd03e8abd24e5d2d9c53cdddee949409045d20931b572d317de23c1eaea6efabe67683ca435bde428c0ab0706760eff0acf9b301f42abe38c4')

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
