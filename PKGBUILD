# Maintainer: Milk Brewster (milk on freenode)

_pkgname=moony.lv2
pkgname=moony-lv2-git
pkgver=0.29.1.r2493.54f6d76
pkgrel=1
pkgdesc="Realtime Lua as programmable glue in LV2 - git master"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/moony/'
license=('Artistic2.0')
groups=('lv2-plugins' 'pro-audio')
depends=('libgl')
makedepends=('git' 'lv2' 'meson' 'sord')
provides=("${_pkgname}")
conflicts=('moony-lv2' "${_pkgname}")
source=("git+https://github.com/OpenMusicKontrollers/moony.lv2")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "%s.r%s.%s" $(tail -n 1 VERSION) "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  arch-meson --buildtype=release build
  cd build
  ninja -j4
}

check() {
  cd "${srcdir}/${_pkgname}"

  meson test -C build || msg "lv2_validate currently known to fail on the plugin"
}

package() {
  cd "${srcdir}/${_pkgname}"

  DESTDIR="${pkgdir}" meson install -C build
  # docs
  install -vDm 644 ChangeLog README.md build/manual.html build/moony_logo.png \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
