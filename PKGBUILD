# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mephisto.lv2
pkgname="${_pkgname}-git"
pkgver=0.11.27.r196.85bf2a3
pkgrel=1
pkgdesc="A Just-in-Time FAUST compiler embedded in an LV2 plugin (git version)"
arch=('x86_64')
url="https://open-music-kontrollers.ch/lv2/mephisto/"
license=('Artistic2.0')
groups=('lv2-plugins' 'pro-audio')
depends=('fontconfig' 'glew' 'glibc' 'libevdev' 'libglvnd' 'libvterm' 'libx11'
'ttf-fira-code')
makedepends=('faust' 'git' 'glu' 'lv2' 'meson')
checkdepends=('lv2lint')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/OpenMusicKontrollers/mephisto.lv2")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(cat VERSION)"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

build() {
  cd "${srcdir}/${_pkgname}"
  meson --prefix=/usr build
  ninja -C build
}

check() {
  cd "${srcdir}/${_pkgname}"
  _plugin_names=('audio_1x1' 'audio_2x2' 'audio_4x4' 'audio_8x8' 'cv_1x1'
  'cv_2x2' 'cv_4x4' 'cv_8x8')
  for _plugin in ${_plugin_names[@]}; do
    lv2lint -Mpack -I "build/" "http://open-music-kontrollers.ch/lv2/mephisto#${_plugin}"
  done
}

package() {
  depends+=('libfaust.so')

  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
  # devendoring ttf-fira-code
  rm -vf "${pkgdir}/usr/lib/lv2/${_pkgname}/"*.ttf
  for font_type in {Bold,Light,Medium,Regular}; do
    ln -svf "/usr/share/fonts/TTF/FiraCode-${font_type}.ttf" \
      "${pkgdir}/usr/lib/lv2/${_pkgname}/"
  done
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
