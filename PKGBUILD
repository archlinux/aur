# Maintainer: Musee Ullah <lae@lae.is>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Qirui Wang <wqr.prg@gmail.com>

pkgname=aegisub-wangqr-git
_pkgtag='v3.3.3'
pkgver=3.3.3.r2.33ff9b408
pkgrel=1
pkgdesc='A general-purpose subtitle editor with ASS/SSA support (wangqr fork)'
arch=(x86_64)
url=http://www.aegisub.org
license=(
  GPL
  BSD
)
depends=(
  alsa-lib
  avisynthplus
  boost-libs
  fftw
  fontconfig
  hunspell
  icu
  libass.so
  libffms2.so
  libgl
  libpulse
  uchardet
  wxwidgets-gtk3
  zlib
)
makedepends=(
  boost
  cmake
  git
  mesa
  ninja
)
provides=(aegisub)
conflicts=(aegisub aegisub-git)
source=(
  git+https://github.com/wangqr/Aegisub.git
  boost-1.81.0.patch
)
b2sums=(
  'SKIP'
  '5b6874ebb89f6ed3ab7929796bd1f59e1748c418ae5397df265fe3007d9f971eec7388f5f6a2dcac020d71c9cffece931a1ae5eb78f8ff4ab61fdc4c5e65328a'
)

pkgver() {
  cd Aegisub
  echo "${_pkgtag#v}.r$(git rev-list --count ${_pkgtag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd Aegisub

  patch -Np1 -i ../boost-1.81.0.patch # Patch from Gentoo/[extra] aegisub package
}

build() {
  cmake -S Aegisub -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_OSS=OFF
  cmake --build build
  # TODO: Build translations
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -dm 755 "${pkgdir}"/usr/share/aegisub/automation/include
  cp -dr --no-preserve=ownership Aegisub/automation/{autoload,demos} "${pkgdir}"/usr/share/aegisub/automation/
  cp -dr --no-preserve=ownership Aegisub/automation/include/{aegisub,*.lua} "${pkgdir}"/usr/share/aegisub/automation/include/
  install -Dm 644 Aegisub/LICENCE -t "${pkgdir}"/usr/share/licenses/aegisub/
}

# vim: ts=2 sw=2 et:
