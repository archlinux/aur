# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=raine
pkgver=0.63.11
_gitver=363cf98
pkgrel=1
pkgdesc="A multiple arcade emulator focused on 680x0 machines like NeoCD and Neo Geo"
url="http://rainemu.swishparty.co.uk"
license=('custom')
arch=('i686' 'x86_64')
provides=('neoraine')
conflicts=('neoraine')
replaces=('neoraine')
depends=('sdl_ttf' 'sdl_image' 'sdl_sound' 'muparser' 'glu' 'mesa')
makedepends=('nasm')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-sdl_ttf' 'lib32-sdl_image' 'lib32-sdl_sound' 'lib32-muparser' 'lib32-glu' 'lib32-mesa')
  makedepends+=('gcc-multilib')
fi
optdepends=('raine-artwork: additional background graphics for some games'
            'raine-emudx: improved graphic and sound files for some classic games'
            'arcade-history-dat: database with various information about the loaded rom')
source=(raine-$pkgver.tar.gz::"$url/cgi-bin/gitweb.cgi?p=raine;a=snapshot;h=$_gitver;sf=tgz"
        "$url/html/archive/debian/dists/unstable/main/binary-i386/raine_${pkgver}_i386.deb")
sha256sums=('cba21039848027e2aff655c549c1ce51bd587c9d4e1496ecd7af335fe9d0eb0e'
            '2929e2fdafd517f73338a9378d6739c6b126194c0ae94d9d059aa4d99d97b239')
options=('emptydirs')

prepare() {
  cd "$srcdir"
  mkdir -p raine-bin
  bsdtar xf data.tar.xz -C raine-bin

  cd raine-$_gitver
  # copy bitmaps and fonts from raine's deb package
  cp -r "$srcdir"/raine-bin/usr/share/games/raine/bitmaps .
  cp -r "$srcdir"/raine-bin/usr/share/games/raine/fonts .

  # adapt folder structure to arch standards
  sed 's|$(prefix)/games|\$(prefix)/bin|;s|$(prefix)/share/games|\$(prefix)/share|' -i makefile
  sed 's|share/games/raine|share/raine|' -i source/sdl/dialogs/about.cpp source/raine.c

  # -O3 optimizations cause segfaults, use -O2 instead
  sed 's|-O3|-O2|g' -i makefile

  # link to the dynamic library of SDL_sound, not only for gentoo
  sed 's|ifeq ("$(shell uname -n)","gentoo")|ifdef RAINE_UNIX|' -i makefile

  # 'detect-cpu' script does not recognize most recent cpus, use generic optimizing
  echo "_MARCH=-march=${CARCH/x86_64/x86-64} -mtune=generic" > cpuinfo
  echo "CPU=generic" >> cpuinfo
}

build() {
  make -C "$srcdir"/raine-$_gitver #VERBOSE=1
}

package() {
  cd "$srcdir"/raine-$_gitver
  make DESTDIR="$pkgdir" install
  # doc + license
  install -d "$pkgdir"/usr/share/{doc,licenses}/raine
  install -m644 docs/* changes/* "$pkgdir"/usr/share/doc/raine
  head -n5 source/raine.c > "$pkgdir"/usr/share/licenses/raine/LICENSE
  # symlink neoraine, both projects have been merged
  ln -s raine "$pkgdir"/usr/bin/neoraine
}
