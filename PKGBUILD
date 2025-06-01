# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=digitalclock5
_pkgname=DigitalClock5
pkgver=5.1.7
pkgrel=1
pkgdesc="A modern digital clock application"
arch=('x86_64')
url="https://github.com/Kolcha/DigitalClock5"
license=('GPL-3.0-or-later')
depends=('qt6-multimedia' 'qt6-tools' 'qt6-svg' 'qt6-base' 'ninja' 'cmake')
makedepends=('git')
install=$pkgname.install
source=("git+https://github.com/Kolcha/DigitalClock5.git#tag=${pkgver}"
  'git+https://github.com/Kolcha/GradientDialog.git'
  'git+https://github.com/Kolcha/paletteicon.git'
  'git+https://github.com/Skycoder42/QHotkey.git'
  https://digitalclock4.sourceforge.io/media/skins.zip
  digitalclock5.desktop
  digitalclock5.install
)
sha256sums=('926a04f77f7e5427e9236bb474ccfe800a85d5f54bbc353388f7186c20aa1720'
            'SKIP'
            'SKIP'
            'SKIP'
            '23fd7f483064ad9743b4dbdeb144a90791fd2aba9be20aa712c570a0f8e15587'
            '353cab3b079779c5ad3255fe3ffae21c28f4140e1e1c92f5b1c860c6f06e24e8'
            'b3953c72141ea3a80ad353a2f66eee22614722571d8306fc1989a60df4858c81')

prepare() {
  git -C "${_pkgname}" submodule init
  git -C "${_pkgname}" -c protocol.file.allow='always' submodule update
  git -C "${_pkgname}" config --local "submodule.third_party/GradientDialog.url" "GradientDialog"
  git -C "${_pkgname}" config --local "submodule.third_party/paletteicon.url" "paletteicon"
  git -C "${_pkgname}" config --local "submodule.third_party/QHotkey.url" "QHotkey"
  git -C "${_pkgname}" submodule update --remote
}

build() {
  cd "${_pkgname}"
  cmake \
    -B build \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr/share/digitalclock5
  cmake --build build --target update_translations
  cmake --build build

}

package() {
  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 digitalclock5.desktop "${pkgdir}/usr/share/applications/"
  install -dm755 "${pkgdir}/usr/share/digitalclock5/plugins"
  install -dm755 "${pkgdir}/usr/share/digitalclock5/skins"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${_pkgname}/build/app/DigitalClock5" "${pkgdir}/usr/share/digitalclock5/"
  ln -s "/usr/share/digitalclock5/DigitalClock5" "${pkgdir}/usr/bin/digitalclock5"

  install -Dm644 "${_pkgname}/app/res/icons/clock.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/digitalclock5.svg"
  find "${_pkgname}/build/clock_common/" -name 'lib*.so' -exec install -v -Dm 0755 {} -t "${pkgdir}/usr/share/digitalclock5/" \;
  find "${_pkgname}/build/plugin_core/" -name 'lib*.so' -exec install -v -Dm 0755 {} -t "${pkgdir}/usr/share/digitalclock5/" \;
  find "${_pkgname}/build/skin_engine/" -name 'lib*.so' -exec install -v -Dm 0755 {} -t "${pkgdir}/usr/share/digitalclock5/" \;
  find "${_pkgname}/build/plugins/" -name '*.so' -not -name '*sample*' -exec install -v -Dm 0755 {} -t "${pkgdir}/usr/share/digitalclock5/plugins/" \;
  #  find "${_pkgname}/build/3rdparty/paletteicon/" -name '*.so' -exec install -v -Dm 0755 {} -t "${pkgdir}/usr/share/digitalclock5/" \;

  cp -r "skins/"* "${pkgdir}/usr/share/digitalclock5/skins/"
}
# vim:set ts=2 sw=2 et:
