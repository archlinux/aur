
_name=easyrpg-player
_flathub=org.easyrpg.player
pkgname=${_name}-bin
provides=($_name liblcf)
conflicts=($_name liblcf)
pkgver=0.8.1
pkgrel=3
pkgdesc='RPG Maker 2000/2003 compat game interpreter (flatpak binary)'
arch=('x86_64')
url='https://easyrpg.org'
source=("https://ci.easyrpg.org/downloads/flatpak/EasyRPG-Player.flatpak")
sha256sums=(SKIP)
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
makedepends=(binutils flatpak grep patchelf sed)
prepare() {
  rm -rf repo
  FLATPAK_USER_DIR="${srcdir}"/repo flatpak --user install EasyRPG-Player.flatpak -y  --reinstall --no-deps
}
build(){
  # Replace icu
  _lib=repo/app/${_flathub}/current/active/files/lib/liblcf.so.0
  _icuorig=75
  _icumaj=$(grep LIB_VERSION_MAJOR /usr/lib/icu/current/Makefile.inc|awk {'print $3'})
  nm -D "${_lib}"|grep _$_icuorig|awk '{print $2 " " $2 | " sed s/'$_icuorig'$/'$_icumaj'/ "}' |tee  map.txt
  patchelf "${_lib}" --rename-dynamic-symbols map.txt --replace-needed libicui18n.so{.$_icuorig,} --replace-needed libicuuc.so{.$_icuorig,}
  # ldd -r "${_lib}"
}
pkgver() {
  FLATPAK_USER_DIR="${srcdir}"/repo flatpak info ${_flathub}|grep Version|awk '{print $2}'
}
package() {
  cd repo/app/${_flathub}/current/active/files
  install -Dm755 bin/${_flathub}.real "${pkgdir}"/usr/bin/$_name
  install -Dm644 {,"$pkgdir"/usr/}lib/liblcf.so.0
  install -Dm644 {,"${pkgdir}"/usr/}share/icons/hicolor/scalable/apps/${_flathub}.svg
  # Use same path with $_name as a sed templete for other game packages
  install -d "${pkgdir}"/usr/share/applications
  sed '/Flatpak/d' share/applications/${_flathub}.desktop > "${pkgdir}"/usr/share/applications/${_name}.desktop
}
