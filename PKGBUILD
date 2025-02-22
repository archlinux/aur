# Maintainer: Alex Tharp <alex at toastercup dot io>
#
# NOTE: This package is not maintained by the Second Life team, even though I'm an employee.
# This is maintained/updated on a volunteer basis, and is not officially supported.
# Please report package issues on the AUR page and not to Linden Lab.

_appname=secondlife
pkgname="${_appname}-bin"
provides=("${_appname}")
conflicts=("${_appname}")
pkgver=7.1.12.13382132360
pkgrel=1
# TODO: point to an actual stable release once Linux support lands in `main`
_git_tag="Second_Life_Develop#88a2e54f-2025-02-18"
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
_git_tag_url_encoded="${_git_tag//#/%23}"
_tardir="Second_Life_Develop_${pkgver//./_}_x86_64"
source=(
  "https://github.com/secondlife/viewer/releases/download/${_git_tag_url_encoded}/${_tardir}.tar.xz"
  "${_appname}.desktop"
)
sha1sums=(
  "0790a640d803be9701e56f09a92c2b7400263cad"
  "29b22f8599db49ae1ca4021bc979ec143fa960b5"
)

package() {
  install -d "${pkgdir}/opt"
  cp -a "${srcdir}/${_tardir}" "${pkgdir}/opt/${_appname}"

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
