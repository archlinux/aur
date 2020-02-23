# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=aegisub-git
pkgver=3.2.2.r407.6f546951b
pkgrel=1
pkgdesc='A general-purpose subtitle editor with ASS/SSA support'
arch=(x86_64)
url=http://www.aegisub.org
license=(
  GPL
  BSD
)
depends=(
  alsa-lib
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
  wxgtk3
  zlib
)
makedepends=(
  autoconf-archive
  boost
  git
  intltool
  lua
  mesa
)
provides=(aegisub)
conflicts=(aegisub)
source=(
  aegisub::git+https://github.com/Aegisub/Aegisub.git
  git+https://github.com/Aegisub/assdraw.git
  0001-Use-target-name-without-directory-in-_OBJ-macro.patch::https://github.com/Aegisub/Aegisub/commit/6bd3f4c26b8fc1f76a8b797fcee11e7611d59a39.patch
  0001-Restrict-the-usage-of-undocumented-wxBitmap-ctor-to-.patch::https://github.com/Aegisub/Aegisub/commit/5f235ff459e6a7ec36639894d1f45a638a9d73f3.patch
)
sha256sums=('SKIP'
            'SKIP'
            '12b191b104fc8fa8745fd98f4aa9d2425699f2e2e719ef2062bdf6a025a045c0'
            '9859311688dd4a6f3e2b330109c96aa3d16f54c76a8d2be31b2e505cb9a5e843')

pkgver() {
  cd aegisub

  tag='v3.2.2'

  echo "${tag#v}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd aegisub

  # boost 1.69
  #sed 's|gil/gil_all.hpp|gil.hpp|g' -i src/*.cpp

  #sed 's/$(LIBS_BOOST) $(LIBS_ICU)/$(LIBS_BOOST) $(LIBS_ICU) -pthread/' -i tools/Makefile

  # https://github.com/Aegisub/Aegisub/issues/171
  patch -p1 -i ../0001-Use-target-name-without-directory-in-_OBJ-macro.patch

  # Fix build with wxWidgets 3.0
  patch -p1 -i ../0001-Restrict-the-usage-of-undocumented-wxBitmap-ctor-to-.patch

  cp -f /usr/share/aclocal/ax_boost_{chrono,filesystem,locale,regex,system,thread}.m4 m4macros/

  ./autogen.sh
}

build() {
  cd aegisub

  # http://site.icu-project.org/download/61#TOC-Migration-Issues
  #CPPFLAGS+=' -DU_USING_ICU_NAMESPACE=1'

  ./configure \
    --prefix=/usr \
    --with-wx-config=/usr/bin/wx-config-gtk3 \
    --without-{portaudio,openal,oss} \
    --disable-update-checker
  make
}

package() {
  cd aegisub

  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENCE -t "${pkgdir}"/usr/share/licenses/aegisub-git/
}

# vim: ts=2 sw=2 et:
