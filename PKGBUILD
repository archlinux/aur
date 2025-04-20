# Maintainer: Alex Tharp <alex at toastercup dot io>
_appname="coolvlviewer"
pkgname="${_appname}"
provides=("${_appname}")
conflicts=("${_appname}")
pkgver=1.32.2.44
pkgrel=1
pkgdesc="A third-party viewer for Second Life and OpenSim grids (built from source)"
url="http://sldev.free.fr"
license=("GPL-2.0-or-later")
arch=("x86_64")
depends=(
  "apr-util"
  "atk"
  "gconf"
  "glib2>=2.32"
  "glu"
  "lib32-libidn"
  "lib32-libsndfile"
  "lib32-util-linux"
  "lib32-zlib"
  "libcups"
  "libgl"
  "libidn"
  "libxcomposite"
  "libxcrypt-compat"
  "libxcursor"
  "libxrandr"
  "libxss"
  "libxtst"
  "mesa"
  "pangox-compat"
  "sdl"
)
optdepends=(
  "alsa-lib: for ALSA support"
  "gst-plugins-bad: for video support"
  "gst-plugins-good: for video support"
  "gst-plugins-ugly: for video support"
  "lib32-alsa-lib: for ALSA support"
  "lib32-freealut: for OpenAL support"
  "lib32-libidn11: for voice support"
  "libpulse: for PulseAudio support"
  "nvidia-utils: for NVIDIA support"
  "pepper-flash: for inworld Flash support"
  "wine: for SLVoice support"
)
makedepends=(
  "bison"
  "bzip2"
  "cmake"
  "flex"
  "glibc"
  "lib32-libxinerama"
  "libgl"
  "libidn"
  "libx11"
  "libxinerama"
  "libxrender"
  "make"
  "python"
)
install="${_appname}.install"
source=(
  "http://sldev.free.fr/sources/CoolVLViewer-src-${pkgver//./}.tar.bz2"
  "${_appname}.desktop"
)
sha1sums=(
  "392cfbef689c3a65ebe374ad6cfa03456942abb4"
  "314763ee16ca2e2224c402ec18bf5b24157ce8b8"
)

build() {
  cd "${srcdir}/linden"

  # TODO: Investigate optimizations, e.g. --tune --usesystemlib --lto
  # See what can be gleaned from e.g. https://github.com/secondlife/viewer/blob/88a2e54/.github/workflows/build.yaml
  ./linux-build.sh
}

package() {
  install -D -m644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -D -m755 "${srcdir}/linden/indra/viewer-linux-x86_64-release/newview/CoolVLViewer-x86_64-${pkgver}/cvlv_icon.png" "${pkgdir}/usr/share/pixmaps/clvl_icon.png"
  install -D -m644 "${srcdir}/linden/indra/viewer-linux-x86_64-release/newview/CoolVLViewer-x86_64-${pkgver}/licenses.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Move Data to Destination Directory
  install -d "${pkgdir}/opt/"
  mv "${_appname}/" "${pkgdir}/opt/"

  # Change Permissions of files to root:games
  chown -R root:games "${pkgdir}/opt/${_appname}"
  chmod -R g+rw "${pkgdir}/opt/${_appname}"

  # Make Binary Group-Executable
  chmod g+x "${pkgdir}/opt/${_appname}/cool_vl_viewer"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_appname}/cool_vl_viewer" "${pkgdir}/usr/bin/${_appname}"
}
