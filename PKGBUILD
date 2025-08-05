# Maintainer: arch1t3cht <arch1t3cht@gmail.com>
# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=aegisub-git
pkgver=3.4.2.r119.e600e4780
pkgrel=1
pkgdesc='A general-purpose subtitle editor with ASS/SSA support'
arch=(x86_64)
url=http://www.aegisub.org
license=(BSD-3-Clause)
depends=(
  alsa-lib
  boost-libs
  curl
  fftw
  fontconfig
  gcc-libs
  glibc
  hicolor-icon-theme
  hunspell
  icu
  libass.so
  libffms2.so
  libgl
  libpulse
  uchardet
  wxwidgets-common
  wxwidgets-gtk3
  zlib
)
makedepends=(
  boost
  cmake
  git
  mesa
  meson
)
provides=(aegisub)
conflicts=(aegisub)
source=(git+https://github.com/TypesettingTools/Aegisub.git)
b2sums=('SKIP')

prepare() {
  cd Aegisub
  meson subprojects download luajit
  meson subprojects packagefiles --apply luajit
}

pkgver() {
  cd Aegisub
  tag='v3.4.2'
  echo "${tag#v}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
}

build() {
  export CXXFLAGS+=" -fpermissive"
  arch-meson Aegisub build \
    -Dluajit:default_library=static \
    -Db_lto=false \
    -Dtests=false \
    -Dopenal=disabled \
    -Dportaudio=disabled \
    -Denable_update_checker=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}" --skip-subprojects luajit
  install -dm 755 "${pkgdir}"/usr/share/aegisub/automation/include
  cp -dr --no-preserve=ownership Aegisub/automation/{autoload,demos} "${pkgdir}"/usr/share/aegisub/automation/
  cp -dr --no-preserve=ownership Aegisub/automation/include/{aegisub,*.lua} "${pkgdir}"/usr/share/aegisub/automation/include/
  install -Dm 644 Aegisub/LICENCE -t "${pkgdir}"/usr/share/licenses/aegisub/
}

# vim: ts=2 sw=2 et:
