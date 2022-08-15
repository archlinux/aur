# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=aegisub-git
pkgver=3.2.2.r407.6f546951b
pkgrel=2
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
  wxwidgets
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
  # https://github.com/Aegisub/Aegisub/commit/6bd3f4c26b8fc1f76a8b797fcee11e7611d59a39.patch
  0001-Use-target-name-without-directory-in-_OBJ-macro.patch
  # https://github.com/Aegisub/Aegisub/commit/5f235ff459e6a7ec36639894d1f45a638a9d73f3.patch
  0001-Restrict-the-usage-of-undocumented-wxBitmap-ctor-to-.patch
)
sha256sums=('SKIP'
            'SKIP'
            'ce90cd9a9c56abcbafeb88d33280d53bee5af98cd9e15f50d6a9e49ae1edda30'
            'c4039f693996dd20be4e8a460fffb984fd34fd810b16b9b1ca7fc4f35df2cc17')

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
