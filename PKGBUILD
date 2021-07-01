# Maintainer: hazelnot <scrabcrab@gmail.com>
_pkgbase=re3
pkgname=re3-git
pkgver=r2981.a3964dfd
pkgrel=1
pkgdesc="An open-source project reverse-engineering Grand Theft Auto III"
arch=('x86_64')
url="https://github.com/GTAmodding/re3"
license=('unknown')
depends=('openal' 'glew' 'glfw-x11' 'mpg123' 'zenity')
makedepends=('git' 'premake')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
    "git+https://github.com/GTAmodding/re3.git"
    "git+https://github.com/aap/librw.git"
    "git+https://github.com/xiph/ogg.git"
    "git+https://github.com/xiph/opus.git"
    "git+https://github.com/xiph/opusfile.git"
    'no_link_with_unnecessary_sndfile.patch'
    're3-launcher'
    're3.desktop'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '932e29385f9e478a0a86c0dfa529c95b5b6bd430e1b364232955d5ea574ea491'
            '850d6e3ff7b92fcaadfcb52a3a8bd384122bcc1a2ee9e917f2b64991dd37ee3c'
            'c61871a66844996f8bc03514278db277bbdcf3cbb91393fb7390d04cbffa1ff3')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  git submodule init
  for submod in librw ogg opus opusfile
  do
    git config "submodule.vendor/$submod.url" "../$submod"
  done
  git submodule update
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
