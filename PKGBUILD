# Maintainer: Musee Ullah <lae@lae.is>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Qirui Wang <wqr.prg@gmail.com>

pkgname=aegisub-wangqr-git
_pkgtag='v3.3.3'
pkgver=3.3.3.r1.db3cdded8
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
  wxwidgets-gtk3
  uchardet
  zlib
)
makedepends=(
  autoconf-archive
  boost
  cmake
  git
  intltool
  lua
  mesa
)
provides=(aegisub)
conflicts=(aegisub aegisub-git)
source=(
  git+https://github.com/wangqr/Aegisub.git
)
sha256sums=(
  SKIP
)

pkgver() {
  cd Aegisub
  echo "${_pkgtag#v}.r$(git rev-list --count ${_pkgtag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -vp build/
  cd Aegisub

  # Ensures Aegisub runs under Xwayland, since it doesn't support Wayland properly
  sed 's/^Exec=/Exec=env GDK_BACKEND=x11 /' -i packages/desktop/aegisub.desktop.template.in
}

build() {
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -DWITH_STARTUPLOG=OFF \
    -DWITH_{PORTAUDIO,OPENAL,OSS}=OFF \
    ../Aegisub
  # TODO: Build translations
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/Aegisub"
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/Aegisub/automation/"
  for subdir in {autoload,demos,include,include/aegisub}
  do
    install -dm 755 "${pkgdir}/usr/share/aegisub/automation/${subdir}"
    for resource in $(find ${subdir} -maxdepth 1 -type f)
    do
      install -m 644 "${resource}" "${pkgdir}/usr/share/aegisub/automation/${resource}"
    done
  done
}

# vim: ts=2 sw=2 et:
