# Maintainer: Alex Tharp <alex@toastercup.io>
_appname=firestorm-next
pkgname="${_appname}-bin"
pkgver=7.1.1.72630
pkgrel=1
pkgdesc="[PRE-RELEASE] Firestorm is a feature-packed third-party viewer for Second Life. This is the *alpha* release that currently features PBR support. **USE AT YOUR OWN RISK**"
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
install="${_appname}.install"
tardir="Phoenix-Firestorm-Alphax64-${pkgver//./-}"
source=("https://downloads.firestormviewer.org/test/linux/${tardir}.tar.xz"
        "${_appname}.desktop"
        "${_appname}.launcher")
md5sums=('0051a964c93d0985aee532e87efb6f5c'
         '99e23c7ed9d17a4062fcfe0b4dd77272'
         '6a56b1a0df5960481ad40ed40dca8f91')

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
  cp -a "${srcdir}/${tardir}" "${pkgdir}/usr/lib/${_appname}"
  cd "${pkgdir}/usr/lib/${_appname}"

  find app_settings skins -type f -execdir chmod 644 "{}" +

  # find and remove broken symlinks
  find -L . -type l -delete

  # Install desktop file
  install -D -m644 "${srcdir}/${_appname}.desktop" \
          "$pkgdir/usr/share/applications/${_appname}.desktop"

  # Install icon file
  install -D -m644 firestorm_icon.png \
          "$pkgdir/usr/share/pixmaps/${_appname}.png"

  # Install launcher
  install -D -m755 "${srcdir}/${_appname}.launcher" \
          "$pkgdir/usr/bin/${_appname}"
}
