
_name=easyrpg-player
_flathub=org.easyrpg.player
pkgname=${_name}-bin
provides=($_name)
conflicts=($_name liblcf)
pkgver=0.8.1.1
pkgrel=1
pkgdesc='RPG Maker 2000/2003 compat game interpreter (flatpak binary)'
arch=('x86_64')
url='https://easyrpg.org'
# source=("https://download.opensuse.org/repositories/home:/easyrpg/Arch/${CARCH}/${_name}-${pkgver}-${_rel}-${CARCH}.pkg.tar.zst")
# flatpak is linked with fluidsynth and old icu
source=("https://easyrpg.org/downloads/player/${pkgver}/${_name}-${pkgver}-linux.flatpak"
"https://download.opensuse.org/repositories/home:/easyrpg/Arch/${CARCH}/liblcf-${pkgver%.*}-${pkgrel}-${CARCH}.pkg.tar.zst")
sha256sums=('38eae01afe9e5f41cdcba4aa72ae7797e240902942491097a88e31eafcf1c771'
            '7c07e26dfcf8f0dea694dfd4e7e61daf142c5cbd4b086e0a419e1ee196dca215')
license=('GPL-3.0-or-later')
depends=(
  alsa-lib
  fmt freetype2 fluidsynth
  gcc-libs glibc
  harfbuzz hicolor-icon-theme
  icu
  lhasa libinih libvorbis libpng libsndfile libxmp
  mpg123
  opusfile
  pixman
  sdl2 speexdsp
  zlib
)
optdepends=(rpg200{0,3}-rtp soundfont-gmgsx)
makedepends=(flatpak grep sed)
prepare() {
  rm -rf repo
  FLATPAK_USER_DIR="${srcdir}"/repo flatpak --user install ${_name}-${pkgver}-linux.flatpak -y --reinstall --no-deps
}
package() {
  install -Dm644 usr/lib/liblcf.so.0 "$pkgdir"/usr/lib/liblcf.so.0
  cd repo/app/${_flathub}/current/active/files
  install -Dm755 bin/${_flathub}.real "${pkgdir}"/usr/bin/$_name
  install -Dm644 {,"${pkgdir}"/usr/}share/icons/hicolor/scalable/apps/${_flathub}.svg
  # Use same path with $_name as a sed templete for other game packages
  install -d "${pkgdir}"/usr/share/applications
  sed '/Flatpak/d' share/applications/${_flathub}.desktop > "${pkgdir}"/usr/share/applications/${_name}.desktop
}
