# Maintainer: Milk Brewster (milk on freenode)

_pkgname=moony.lv2
pkgname=moony-lv2-git
pkgver=0.41.255.r2825.32288d84
pkgrel=1
pkgdesc="Realtime Lua as programmable glue in LV2 - git master"
arch=('i686' 'x86_64')
url='https://git.open-music-kontrollers.ch/~hp/moony.lv2'
license=('Artistic2.0')
groups=('lv2-plugins' 'pro-audio')
depends=('cairo' 'fontconfig' 'libgl' 'libvterm' 'pixman')
makedepends=('git' 'lv2' 'meson' 'sord' 'fontconfig' 'pixman' 'libvterm' 'cairo')
provides=("${_pkgname}")
conflicts=('moony-lv2' "${_pkgname}")
source=("git+https://git.ventosus.ch/~hp/moony.lv2")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "%s.r%s.%s" "$(grep -oP "^option\('version'.*value\s*:\s*'\K[^']+" meson_options.txt)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
