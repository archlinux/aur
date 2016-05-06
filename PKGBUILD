# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=aegisub-git
pkgver=3.2.2.r293.0e8bc44
pkgrel=1
pkgdesc='A general-purpose subtitle editor with ASS/SSA support'
arch=('i686' 'x86_64')
url='http://www.aegisub.org'
license=('GPL' 'BSD')
depends=('alsa-lib' 'boost-libs' 'desktop-file-utils' 'fftw' 'fontconfig'
         'gcc-libs' 'glibc' 'hunspell' 'icu' 'libgl' 'wxgtk' 'zlib'
         'libass.so' 'libffms2.so')
makedepends=('boost' 'git' 'intltool' 'lua' 'mesa')
optdepends=('libpulse: Pulseaudio backend'
            'openal: OpenAL backend'
            'oss: OSS backend'
            'portaudio: Portaudio backend')
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
  ./autogen.sh
}

build () {
  cd aegisub

  ./configure \
    --prefix='/usr'
  make
}

package() {
  cd aegisub

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/share/licenses/aegisub-git
  install -m 644 LICENCE "${pkgdir}"/usr/share/licenses/aegisub-git/
}

# vim: ts=2 sw=2 et:
