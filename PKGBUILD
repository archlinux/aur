# Maintainer: mistiru (Anaël Megna) <anael.megna@gmail.com>

pkgname=aegisub-japan7
pkgver=3.2.2.r442.8615152bc
pkgrel=1
pkgdesc='A fork of aegisub project with custom predefined configuration'
arch=(x86_64)
url=https://github.com/odrling/Aegisub
license=(
  GPL
  BSD
)
depends=(
  alsa-lib
  amaranth-font
  boost-libs
  fftw
  fontconfig
  hunspell
  icu
  libass.so
  libffms2.so
  libgl
  libpulse
  openssl
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
  aegisub::git+https://github.com/odrling/Aegisub.git
  git+https://github.com/Aegisub/assdraw.git
)
sha256sums=(
  SKIP
  SKIP
)

pkgver() {
  cd aegisub

  tag='v3.2.2'

  echo "${tag#v}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd aegisub

  sed 's/$(LIBS_BOOST) $(LIBS_ICU)/$(LIBS_BOOST) $(LIBS_ICU) -pthread/' -i tools/Makefile

  cp -f /usr/share/aclocal/ax_boost_{chrono,filesystem,locale,regex,system,thread}.m4 m4macros/

  ./autogen.sh
}

build() {
  cd aegisub

  # http://site.icu-project.org/download/61#TOC-Migration-Issues
  CPPFLAGS+=' -DU_USING_ICU_NAMESPACE=1'

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
