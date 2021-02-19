# Maintainer: hazelnot <scrabcrab@gmail.com>
_pkgbase=re3
pkgname=re3-git
pkgver=1.0.17.g4d8f3408
pkgrel=1
pkgdesc="An open-source project reverse-engineering Grand Theft Auto III"
arch=('x86_64')
url="https://github.com/GTAmodding/re3"
license=('unknown')
depends=('openal' 'glew' 'glfw' 'mpg123' 'zenity')
makedepends=('git' 'premake')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
    "git+https://github.com/GTAmodding/re3"
    "git+https://github.com/aap/librw.git"
    "git+https://github.com/xiph/ogg.git"
    "git+https://github.com/xiph/opus.git"
    "git+https://github.com/xiph/opusfile.git"
    'crossplatform_fix.patch'
    'no_link_with_unnecessary_sndfile.patch'
    're3-launcher'
    're3.desktop'
)
sha256sums=(
    'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
    e3251821f46a567ca4561834345b752db6f2700c58f113335d68b314c05b2b26
    905016dfe461fba041d30ba0d295d4ee57dc43c1c24c63a7f3683ac34af87a25
    b2055016caaa13a15281fb662651c88a0421dda99dbf1eacc64f90cf7186be43
    c61871a66844996f8bc03514278db277bbdcf3cbb91393fb7390d04cbffa1ff3
)

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --tags | sed -n '/^re3_v\([0-9.]\+\)-\([0-9]\+\)-\([0-9a-z]\+\)$/{s//\1.\2.\3/;s/-/./g;p;Q0};Q1'
}

prepare() {
  cd "$srcdir/$_pkgbase"
  git submodule init
  for submod in librw ogg opus opusfile
  do
    git config "submodule.vendor/$submod.url" "../$submod"
  done
  git submodule update
  patch -uNp1 -i ../crossplatform_fix.patch
  patch -uNp1 -i ../no_link_with_unnecessary_sndfile.patch
}

build() {
  cd "$srcdir/$_pkgbase"
  premake5 --with-librw gmake2
  ./printHash.sh src/extras/GitSHA1.cpp
  make -C build config=release_linux-amd64-librw_gl3_glfw-oal
}

package() {
  cd "$srcdir/$_pkgbase"
  install -D -m755 -t "$pkgdir/usr/bin" \
    "bin/linux-amd64-librw_gl3_glfw-oal/Release/re3" \
    ../re3-launcher
  install -D -m644 -t "$pkgdir/usr/share/applications" ../re3.desktop
  install -D -m644 logo.png "$pkgdir/usr/share/pixmaps/re3.png"
  mkdir -p "$pkgdir/usr/share/games/re3"
  cp -a gamefiles "$pkgdir/usr/share/games/re3/"
  chmod og=rX -R "$pkgdir/usr/share/games/re3"
}
