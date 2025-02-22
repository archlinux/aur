# Maintainer: Alex Tharp <alex at toastercup dot io>
#
# NOTE: This package is not maintained by the Second Life team, even though I'm an employee.
# This is maintained/updated on a volunteer basis, and is not officially supported.
# Please report package issues on the AUR page and not to Linden Lab.

_appname=secondlife
pkgname="${_appname}-bin"
provides=("${_appname}")
conflicts=("${_appname}")
pkgver=7.1.12.13164555058
pkgrel=1
pkgdesc="Second Life's official client"
url="https://github.com/secondlife/viewer"
license=("LGPL-2.1-or-later")
arch=("x86_64")
depends=(
  "apr-util"
  "dbus-glib"
  "glib2>=2.35"
  "glu"
  "lib32-libidn"
  "lib32-libsndfile"
  "lib32-util-linux"
  "lib32-zlib"
  "libbsd"
  "libgl"
  "libidn"
  "libjpeg-turbo"
  "libpng"
  "libxcrypt-compat"
  "libxml2"
  "libxss"
  "mesa"
  "nss"
  "openal"
  "sdl"
  "vlc"
  "zlib"
)
optdepends=(
  "alsa-lib: for ALSA support"
  "freealut: for OpenAL support"
  "gst-plugins-bad: for video support"
  "gst-plugins-good: for video support"
  "gst-plugins-ugly: for video support"
  "gstreamer: For video support - may need good, bad and ugly plugins"
  "lib32-alsa-lib: for ALSA support"
  "lib32-freealut: for OpenAL support"
  "lib32-libidn11: for legacy Vivox voice support - will soon be fully replaced by WebRTC"
  "libpulse: for PulseAudio support"
  "nvidia-utils: for NVIDIA support"
)
tardir="Second_Life_Develop_${pkgver//./_}_x86_64"
# TODO: use stable branch build once Linux support lands in `main`
source=(
  "https://github.com/secondlife/viewer/releases/download/Second_Life_Release%23f624d089-Develop/Second_Life_Develop_7_1_12_13164555058_x86_64.tar.xz"
  "${_appname}.desktop"
)
sha1sums=(
  "a44c366ba5e703436bfc237fcca3a15560c98548"
  "116accb035955fc7818e8f45d7eecba6bef4808f"
)

package() {
  install -d "${pkgdir}/opt"
  cp -a "${srcdir}/${tardir}" "${pkgdir}/opt/${_appname}"

  cd "${pkgdir}/opt/${_appname}"
  find "app_settings" "skins" -type f -execdir chmod 644 "{}" +

  # Comment out lines that attempt to install desktop entry + protocol handler on each run
  sed -i 's|^\(\s*\./etc/register_secondlifeprotocol.sh\)|#\1|' "secondlife"
  sed -i 's|^\(\s*\./etc/refresh_desktop_app_entry.sh\)|#\1|' "secondlife"

  install -D -m644 "${srcdir}/${_appname}.desktop" "$pkgdir/usr/share/applications/${_appname}.desktop"
  install -D -m644 "secondlife_icon.png" "$pkgdir/usr/share/pixmaps/${_appname}.png"

  # TODO: upstream is missing the main LGPL license file:
  # https://github.com/secondlife/viewer/blob/4235af0/indra/newview/viewer_manifest.py#L1217
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "licenses.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_appname}/secondlife" "${pkgdir}/usr/bin/${_appname}"
}
