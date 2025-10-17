# Maintainer: mdmrk <mariodavo.20@gmail.com>

pkgname=ladybird-nightly-bin
_pkgname=ladybird
pkgver=r72235.1a3635cda57
_shortcommit=1a3635cda57
pkgrel=1
pkgdesc="Nightly binary release of the Ladybird web browser"
arch=('x86_64')
url="https://github.com/LadybirdBrowser/ladybird"
license=('BSD-2-Clause')
options=('!strip')
provides=('ladybird')
conflicts=('ladybird' 'ladybird-git')
makedepends=(patchelf)
depends=(
  curl
  fast_float
  ffmpeg
  harfbuzz
  icu
  libavif
  libgl
  libjpeg-turbo
  libjxl
  libtiff
  libtommath
  libwebp
  qt6-base
  qt6-multimedia
  qt6-tools
  qt6-wayland
  sdl3
  sqlite
  ttf-liberation
  woff2
  
  libpng-apng # AUR
  angle # AUR
  simdutf-git # AUR - simdutf v6 is in repos, we need v7
  cpptrace # AUR
)
source=(
  "ladybird-nightly-${pkgver}.tar.zst::https://github.com/mdmrk/ladybird-nightly-bin/releases/download/vr72235.1a3635cda57/ladybird-nightly-r72235.1a3635cda57.tar.zst"
)
sha256sums=(
  'SKIP'
)

package() {
  # Extract the pre-built package
  cp -a "${srcdir}/opt" "${pkgdir}/"
  cp -a "${srcdir}/usr" "${pkgdir}/"

  # Set up rpath for angle
  find "$pkgdir" -type f -executable -exec sh -c '
    for exe; do
      r=$(patchelf --print-rpath "$exe" 2>/dev/null)
      [ "${r%%/opt/angle/lib*}" = "$r" ] && patchelf --set-rpath "/opt/angle/lib${r:+:$r}" "$exe"
    done
  ' sh {} +

  # Make the desktop file point to the file in /opt
  RELATIVE_DESKTOP_FILE_PATH='usr/share/applications/org.ladybird.Ladybird.desktop'
  sed -i -e 's#Exec=Ladybird #Exec=/opt/ladybird/usr/bin/Ladybird #' \
    "${pkgdir}/opt/ladybird/${RELATIVE_DESKTOP_FILE_PATH}"
  
  # Install desktop file to system location
  install -Dm644 "${pkgdir}/opt/ladybird/${RELATIVE_DESKTOP_FILE_PATH}" \
    "${pkgdir}/${RELATIVE_DESKTOP_FILE_PATH}"

  # Ensure proper permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
