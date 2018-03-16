# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=aegisub-git
pkgver=3.2.2.r323.f6a2ac08a
pkgrel=1
pkgdesc='A general-purpose subtitle editor with ASS/SSA support'
arch=('x86_64')
url='http://www.aegisub.org'
license=('GPL' 'BSD')
depends=('alsa-lib' 'boost-libs' 'fftw' 'fontconfig' 'gcc-libs' 'glibc'
         'hunspell' 'icu' 'libgl' 'libpulse' 'uchardet' 'wxgtk3' 'zlib'
         'libass.so' 'libffms2.so')
makedepends=('autoconf-archive' 'boost' 'git' 'intltool' 'lua' 'mesa')
provides=('aegisub')
conflicts=('aegisub')
source=('aegisub::git+https://github.com/Aegisub/Aegisub.git'
        'git+https://github.com/Aegisub/assdraw.git')
sha256sums=('SKIP'
            'SKIP')

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

  ./configure \
    --prefix='/usr' \
    --with-wx-config='/usr/bin/wx-config-gtk3' \
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
