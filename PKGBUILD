# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Nick Lanham <nick@afternight.org>

_plugin_uri="http://code.google.com/p/amsynth/amsynth"
pkgname=amsynth-git
_pkgname=amsynth
pkgver=1.12.4.r1310.88e87b7
pkgrel=1
pkgdesc="An analog modelling (a.k.a. virtual analog) synthesizer (git version)"
arch=(i686 x86_64)
url="https://amsynth.github.io/"
license=(GPL2)
groups=(dssi-plugins lv2-plugins pro-audio vst-plugins)
depends=(cairo gcc-libs glibc)
makedepends=(alsa-lib autoconf-archive dssi git fontconfig freetype2 gdk-pixbuf2 glib2
gtk2 harfbuzz intltool jack ladspa liblo lv2 pandoc)
checkdepends=(lv2lint)
optdepends=('alsa-lib: for standalone application'
            'dssi-host: for DSSI plugin'
            'jack: for standalone application'
            'liblo: for DSSI plugin and standalone application'
            'new-session-manager: for session management with the standalone application'
            'lv2-host: for LV2 plugin'
            'vst-host: for VST plugin')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/amsynth/amsynth.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ver=$(git describe --tags `git rev-list --tags --max-count=1` | cut -f 2 -d -)
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --with-alsa \
    --with-dssi \
    --with-jack \
    --with-lv2 \
    --with-nsm \
    --with-pandoc \
    --with-vst
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  cp .libs/${_pkgname}_lv2*.so data/${_pkgname}.lv2/
  lv2lint -Mpack -I "data/${_pkgname}.lv2" "${_plugin_uri}"
}

package() {
  depends+=(libatk-1.0.so libfontconfig.so libfreetype.so libgdk_pixbuf-2.0.so
  libgdk-x11-2.0.so libgio-2.0.so libglib-2.0.so libgobject-2.0.so
  libgtk-x11-2.0.so libharfbuzz.so libpangocairo-1.0.so libpangoft2-1.0.so
  libpango-1.0.so)

  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -vDm 644 {AUTHORS,NEWS,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
