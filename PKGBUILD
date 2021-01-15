# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name="notes"
_pkgname="${_name}.lv2"
pkgname="${_pkgname}-git"
pkgver=0.3.1.r88.d0fed49
pkgrel=1
pkgdesc="An LV2 plugin to store arbitrary notes and images in your project (git version)"
arch=('x86_64')
url="https://open-music-kontrollers.ch/lv2/${_name}/"
license=('Artistic2.0')
groups=('lv2-plugins' 'pro-audio')
depends=('fontconfig' 'glew' 'libvterm' 'ttf-fira-code' 'ttf-fira-sans')
makedepends=('git' 'glu' 'lv2' 'meson')
checkdepends=('lv2lint')
provides=("${_pkgname}" "${_pkgname}=${pkgver/\.r.*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/OpenMusicKontrollers/${_pkgname}")
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
  #lv2lint -s 'pugl*' -Mpack -I "build/" \
  #  "http://open-music-kontrollers.ch/lv2/${_pkgname}#${_plugin}"
  lv2lint -Mpack -I "build/" \
    "http://open-music-kontrollers.ch/lv2/${_name}#${_name}"
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
