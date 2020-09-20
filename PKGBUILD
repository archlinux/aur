# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Nick Lanham <nick@afternight.org>

_plugin_uri="http://code.google.com/p/amsynth/amsynth"
pkgname=amsynth-git
_pkgname=amsynth
pkgver=1.11.0.r1205.4de4165
pkgrel=1
pkgdesc="An analog modelling (a.k.a. virtual analog) synthesizer (git version)"
arch=('i686' 'x86_64')
url="https://amsynth.github.io/"
license=('GPL2')
groups=('dssi-plugins' 'lv2-plugins' 'pro-audio' 'vst-plugins')
depends=('gtk2')
makedepends=('alsa-lib' 'dssi' 'git' 'intltool' 'jack' 'ladspa' 'liblo' 'lv2' 'pandoc')
optdepends=('alsa-lib: for standalone application'
            'jack: for standalone application'
            'liblo: for DSSI plugin and standalone application'
            'non-session-manager: for session management with the standalone application')
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
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -vDm 644 {AUTHORS,NEWS,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
