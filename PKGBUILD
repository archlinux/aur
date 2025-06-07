
_name=easyrpg-player
_flathub=org.easyrpg.player
pkgname=${_name}-bin
provides=($_name liblcf)
conflicts=($_name liblcf)
pkgver=0.8.1
pkgrel=1
pkgdesc='RPG Maker 2000/2003 compat game interpreter (flatpak binary)'
arch=('x86_64')
url='https://easyrpg.org'
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
optdepends=(rpg200{0,3}-rtp)  
makedepends=(binutils flatpak grep patchelf)
prepare() {
  export FLATPAK_USER_DIR=${srcdir}
  flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  flatpak --user install -y --reinstall --no-deps $_flathub
}
build(){
  # Replace icu
  _lib=app/${_flathub}/current/active/files/lib/liblcf.so.0
  _icuorig=75
  _icumaj=$(grep LIB_VERSION_MAJOR /usr/lib/icu/current/Makefile.inc|awk {'print $3'})
  nm -D "${_lib}"|grep _$_icuorig|awk '{print $2 " " $2 | " sed s/'$_icuorig'$/'$_icumaj'/ "}' |tee  map.txt
  patchelf "${_lib}" --rename-dynamic-symbols map.txt --replace-needed libicui18n.so{.$_icuorig,} --replace-needed libicuuc.so{.$_icuorig,}
  ldd -r "${_lib}"
}
pkgver() {
  flatpak info ${_flathub}|grep Version|awk '{print $2}'
}
package() {
  cd app/${_flathub}/current/active/files
  install -Dm755 bin/${_flathub}.real "${pkgdir}"/usr/bin/$_name
  install -Dm644 {,"$pkgdir"/usr/}lib/liblcf.so.0
  install -Dm644 {,"${pkgdir}"/usr/}share/icons/hicolor/scalable/apps/${_flathub}.svg
  install -Dm644 {,"${pkgdir}"/usr/}share/applications/${_flathub}.desktop
}
