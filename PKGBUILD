# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-ttools-meson-git
_srcname=aegisub-ttools
pkgver=3.2.2.r441.8b0aaaf7e
pkgrel=2
pkgdesc='A general-purpose subtitle editor with ASS/SSA support (TypesettingTools fork, meson branch)'
arch=('x86_64')
url='http://www.aegisub.org'
license=('GPL' 'BSD')
depends=('boost-libs'
         'fontconfig' 'icu' 'libgl' 'wxgtk3' 'zlib' 'libass.so'
         # optional by the build system, but don't make much sense to exclude
         'alsa-lib' 'libffms2.so' 'fftw' 'hunspell' 'uchardet'
         # 'gcc-libs' 'glibc' # part of 'base'
         # 'luajit' # Arch's luajit isn't compiled in 5.2 mode
         )
makedepends=('boost' 'git' 'intltool' 'lua' 'mesa' 'meson')
provides=('aegisub')
conflicts=('aegisub' 'aegisub-git')
source=("$_srcname::git+https://github.com/TypesettingTools/Aegisub.git#branch=meson"
        "fix_audio_cache.patch")
sha256sums=('SKIP'
            '5771cca865098c69a7fe269c30999c84a3a0f90ed0b55c80ec8df61975702a93')

# TODO check libiconv dep
#   "had to install libiconv manually though since it's not listed as a dependency
#   I believe it's an optional dependency
#   meson still configures with it"

pkgver() {
  cd "$_srcname"

  tag='v3.2.2'

  echo "${tag#v}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {

  cd "$_srcname"

  patch -p1 < ../fix_audio_cache.patch

  arch-meson builddir -Dportaudio=disabled -Dopenal=disabled
}

build() {
  cd "$_srcname"

  ninja -C builddir
}

package() {
  cd "$_srcname"

  DESTDIR="${pkgdir}" ninja -C builddir install
  install -Dm 644 LICENCE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
