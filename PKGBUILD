_pkgbase=re3
pkgname=re3-git
pkgver=r3167.3233ffe1
pkgrel=1
pkgdesc="An open-source project reverse-engineering Grand Theft Auto III"
arch=('x86_64' 'aarch64')
url="https://github.com/GTAmodding/re3"
license=('custom:none')
depends=('openal' 'glew' 'glfw' 'mpg123' 'zenity')
makedepends=('git' 'premake')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
    "re3.bundle::https://archive.org/download/github.com-GTAmodding-re3_-_2021-09-06_14-11-00/GTAmodding-re3_-_2021-09-06_14-11-00.bundle"
    "git+https://github.com/aap/librw.git"
    "git+https://github.com/xiph/ogg.git"
    "git+https://github.com/xiph/opus.git"
    "git+https://github.com/xiph/opusfile.git"
    'no_link_with_unnecessary_sndfile.patch'
    're3-launcher'
    're3.desktop'
)
sha256sums=('035cb5f59811ae086510f02bd3817eaf43933c9723e52dba60807f48c4e9d9c3'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1d079928163893daa219a14cd3fa50de86b916ecbbeccb9587173d4b35d8e532'
            '850d6e3ff7b92fcaadfcb52a3a8bd384122bcc1a2ee9e917f2b64991dd37ee3c'
            '7d19322282de244decac39a1b3aa54196b5f9ba3e3762dbde931c75710bf9931')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git clone re3.bundle "$srcdir/$_pkgbase"
  cd "$srcdir/$_pkgbase"
  git submodule init
  for submod in librw ogg opus opusfile
  do
    git config "submodule.vendor/$submod.url" "../$submod"
  done
  git -c protocol.file.allow=always submodule update
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
  install -D -m644 res/images/logo.svg "$pkgdir/usr/share/pixmaps/re3.svg"
  mkdir -p "$pkgdir/usr/share/games/re3"
  cp -a gamefiles "$pkgdir/usr/share/games/re3/"
  chmod og=rX -R "$pkgdir/usr/share/games/re3"
}
