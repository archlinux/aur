# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-ttools-meson-git
_srcname=aegisub-ttools
pkgver=3.2.2.r440.9ebfbf456
pkgrel=1
pkgdesc='A general-purpose subtitle editor with ASS/SSA support (TypesettingTools fork, meson branch)'
arch=('x86_64')
url='http://www.aegisub.org'
license=('GPL' 'BSD')
depends=('gcc-libs' 'glibc' 'boost-libs'
         'fontconfig' 'icu' 'libgl' 'wxgtk3' 'zlib' 'libass.so'
         # optional by the build system, but don't make much sense to exclude
         'alsa-lib' 'libffms2.so' 'fftw' 'hunspell' 'uchardet'
         # 'luajit' # Arch's luajit isn't compiled in 5.2 mode
         )  # I think it depends on something else here too, but not sure what
makedepends=('boost' 'git' 'intltool' 'lua' 'mesa' 'meson')
provides=('aegisub')
conflicts=('aegisub')
source=("$_srcname::git+https://github.com/TypesettingTools/Aegisub.git#branch=meson")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  tag='v3.2.2'

  echo "${tag#v}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {

  cd "$_srcname"

  #patch -p1 < ../fix_version.patch

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
