# Maintainer: Alex Tharp <alex at toastercup dot io>
_appname="coolvlviewer"
pkgname="${_appname}-bin"
provides=("${_appname}")
conflicts=("${_appname}")
pkgver=1.32.2.44
pkgrel=1
pkgdesc="A third-party viewer for Second Life and OpenSim grids"
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
install="${_appname}.install"
source=(
  "http://sldev.free.fr/binaries/CoolVLViewer-${pkgver}-Linux-x86_64-Setup"
  "${_appname}.desktop"
)
sha1sums=(
  "1deb49fb1e89b2c61ddce1a5f556b69a27418af0"
  "314763ee16ca2e2224c402ec18bf5b24157ce8b8"
)

build() {
  cd "${srcdir}"
  chmod +x "CoolVLViewer-${pkgver}-Linux-x86_64-Setup"

  ./CoolVLViewer-${pkgver}-Linux-x86_64-Setup --mode silent --destination "${srcdir}/${_appname}/"
}

package() {
  install -D -m644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -D -m755 "${srcdir}/${_appname}/cvlv_icon.png" "${pkgdir}/usr/share/pixmaps/clvl_icon.png"
  install -D -m644 "${srcdir}/${_appname}/licenses.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

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
