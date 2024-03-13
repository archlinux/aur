_pkgbase=re3
pkgname=re3-git
pkgver=1.0.r294.g3233ffe
pkgrel=1
pkgdesc="Grand Theft Auto III reverse engineered"
arch=(x86_64 aarch64)
url="https://github.com/GTAmodding/re3"
license=(LicenseRef-None)
depends=(openal glfw mpg123 glibc gcc-libs sh zenity)
makedepends=(git premake glew)
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
    "re3.bundle::https://archive.org/download/github.com-GTAmodding-re3_-_2021-09-06_14-11-00/GTAmodding-re3_-_2021-09-06_14-11-00.bundle"
    "git+https://github.com/aap/librw.git"
    "git+https://github.com/xiph/ogg.git"
    "git+https://github.com/xiph/opus.git"
    "git+https://github.com/xiph/opusfile.git"
    'no_link_with_unnecessary_sndfile.patch'
    'disable_glfw_x11_detection.patch'
    're3-launcher'
    're3.desktop'
)
sha256sums=('035cb5f59811ae086510f02bd3817eaf43933c9723e52dba60807f48c4e9d9c3'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1d079928163893daa219a14cd3fa50de86b916ecbbeccb9587173d4b35d8e532'
            '57b827c1e908bec267e69e13dacb1d3f6e2d9737f08f44df752cd6f0c7f1eddc'
            '850d6e3ff7b92fcaadfcb52a3a8bd384122bcc1a2ee9e917f2b64991dd37ee3c'
            '7d19322282de244decac39a1b3aa54196b5f9ba3e3762dbde931c75710bf9931')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # restore repo from bundle
  rm -fr "$srcdir/$_pkgbase"
  git clone re3.bundle "$srcdir/$_pkgbase"

  cd "$srcdir/$_pkgbase"
  # restore missing tag
  git tag --force 1.0 e35c56ceb3eea3c3ccda1cc4e6645e901787d70a

  git submodule init
  for submod in librw ogg opus opusfile
  do
    git config "submodule.vendor/$submod.url" "../$submod"
  done
  git -c protocol.file.allow=always submodule update

  patch -uNp1 -i ../no_link_with_unnecessary_sndfile.patch
  # X11 detection is not possible anymore with combined glfw package
  patch -uNp1 -i ../disable_glfw_x11_detection.patch
}

build() {
  cd "$srcdir/$_pkgbase"
  premake5 --with-librw gmake2
  ./printHash.sh src/extras/GitSHA1.cpp
  make -C build config=release_linux-amd64-librw_gl3_glfw-oal
  # Build LICENSE
  grep -A100 License README.md > LICENSE
}

package() {
  cd "$srcdir/$_pkgbase"
  # Install binary
  install -Dm755 -t "$pkgdir/usr/bin" \
    "bin/linux-amd64-librw_gl3_glfw-oal/Release/re3" \
    ../re3-launcher

  # Install application menu entry
  install -Dm644 ../re3.desktop "$pkgdir/usr/share/applications/re3.desktop"
  install -Dm644 res/images/logo.svg "$pkgdir/usr/share/pixmaps/re3.svg"

  # Install gamefiles
  mkdir -p "$pkgdir/usr/share/games/re3"
  cp -a gamefiles "$pkgdir/usr/share/games/re3/"
  chmod og=rX -R "$pkgdir/usr/share/games/re3"

  # Install LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/None"
}
