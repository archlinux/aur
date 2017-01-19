pkgname=amule-git
pkgver=2.3.2.r35.047a55c93
pkgrel=1
pkgdesc='Client for the eD2k and Kad networks'
arch=(i686 x86_64)
url=http://amule.org/
license=(GPL)
depends=(boost-libs crypto++ gd geoip libupnp wxgtk)
makedepends=(boost git)
conflicts=(amule)
source=(
git+https://github.com/amule-project/amule.git
https://anonscm.debian.org/cgit/pkg-amule/amule.git/plain/debian/patches/configure_ignore_gdlib-config_garbage.diff
https://anonscm.debian.org/cgit/pkg-amule/amule.git/plain/debian/patches/use_xdg-open_as_preview_default.diff
https://anonscm.debian.org/cgit/pkg-amule/amule.git/plain/debian/patches/version_check.diff
https://raw.githubusercontent.com/pld-linux/aMule/master/aMule-cas-datadir.patch
)
sha256sums=(SKIP
            594a667bac53d3c881523c8c1a49d622a0752d84e0601aef062a586493ba998e
            902f8f719c1c02335880621717f23c683da8edbb31add75d3e1267b190e03b9c
            7bf39a64a723ab3e55ccfef93df2ec9cdd8108e56aa0733a4412755931cb3244
            897ac890b5f1b8cb4b53fded313cb2779bed5d39041a320885dd9dbe30878879)

pkgver() {
  cd amule/

  git describe | sed 's/-/.r/; s/-g/./'
}

prepare() {
  cd amule/

  patch -Np1 < $srcdir/aMule-cas-datadir.patch
  sed -i 's\/usr/share/fonts/corefonts/times.ttf\/usr/share/fonts/TTF/DejaVuSerif.ttf\
    s\/share/cas/\/share/amule/cas/\' src/utils/cas/configfile.c

  sed -i s/configure.in/configure.ac/ $srcdir/configure_ignore_gdlib-config_garbage.diff
  patch -Np1 < $srcdir/configure_ignore_gdlib-config_garbage.diff

  patch -Np1 < $srcdir/use_xdg-open_as_preview_default.diff
  patch -Np1 < $srcdir/version_check.diff
}

build() {
  cd amule/

  ./autogen.sh

  local confopts=(
    --disable-debug
    --disable-rpath
    --enable-alc
    --enable-alcc
    --enable-amulecmd
    --enable-amule-gui
    --enable-cas
    --enable-ccache
    --enable-geoip
    --enable-mmap
    --enable-optimize
    --enable-wxcas
    --prefix=/usr
    --with-boost
  )

  ./configure ${confopts[@]}

  make
}

check() {
  cd amule/

  make check
}

package() {
  cd amule/

  make DESTDIR=$pkgdir install
}
