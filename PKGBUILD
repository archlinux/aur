# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-ttools-meson-git
_srcname=aegisub-ttools
pkgver=3.2.2.r491.53034e5f8
pkgrel=1
pkgdesc='A general-purpose subtitle editor with ASS/SSA support (TypesettingTools fork, meson branch)'
arch=('x86_64')
url='http://www.aegisub.org'
license=('GPL' 'BSD')
depends=('boost-libs'
         'fontconfig' 'icu' 'libgl' 'wxgtk3' 'zlib' 'libass.so'
         # optional by the build system, but don't make much sense to exclude
         'alsa-lib' 'libffms2.so' 'fftw' 'hunspell' 'uchardet' 'glibc'
         # 'gcc-libs' 'glibc' # part of 'base'
         # 'luajit' # Arch's luajit isn't compiled in 5.2 mode
         )
makedepends=('boost' 'git' 'intltool' 'lua' 'mesa' 'meson')
# 'libiconv' is on the AUR, but uses an expired GPG signing key,
# which makes building quite inconvenient over using the vendored one.
provides=('aegisub')
conflicts=('aegisub' 'aegisub-git')
source=("$_srcname::git+https://github.com/TypesettingTools/Aegisub.git#branch=meson-vs2019"
        "fix_audio_cache.patch")
sha256sums=('SKIP'
            '3ddbc863fba016c664d8bcec377c567e8641072c7156a69bca87b6536f8a7016')

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
