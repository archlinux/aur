# Maintainer: hazelnot <scrabcrab@gmail.com>
_pkgbase=re3
pkgname=re3-git
pkgver=1.0.4.gedc77d7f
pkgrel=1
pkgdesc="An open-source project reverse-engineering Grand Theft Auto III"
arch=('x86_64')
url="https://github.com/GTAmodding/re3"
license=('unknown')
depends=('openal' 'glew' 'glfw' 'libsndfile' 'mpg123')
makedepends=('git' 'premake')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
    "re3::git+https://github.com/GTAmodding/re3"
    'crossplatform_fix.patch'
    're3-launcher'
)
sha256sums=(
    'SKIP'
    e3251821f46a567ca4561834345b752db6f2700c58f113335d68b314c05b2b26
    c61be9f1d53b046f753cf0724b365ef352de5ce70f809b1d1b5637d46044c213
)

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --tags | sed -n '/^re3_v\([0-9.]\+\)-\([0-9]\+\)-\([0-9a-z]\+\)$/{s//\1.\2.\3/;s/-/./g;p;Q0};Q1'
}

prepare() {
  cd "$srcdir/$_pkgbase"
  git submodule update --init --recursive
  patch -uNp1 -i ../crossplatform_fix.patch
}

build() {
  cd "$srcdir/$_pkgbase"
  premake5 --with-librw gmake2
  ./printHash.sh src/extras/GitSHA1.cpp
  make -C build config=release_linux-amd64-librw_gl3_glfw-oal
}

package() {
  install -D -m755 -t "$pkgdir/usr/bin" \
    "$srcdir/${pkgname%-git}/bin/linux-amd64-librw_gl3_glfw-oal/Release/re3" \
    "$srcdir/re3-launcher"
}
