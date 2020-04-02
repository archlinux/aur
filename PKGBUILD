# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: maz-1 <ohmygod19993 at gmail dot com>
_pkgname=rlvm
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="RealLive clone for Linux and OSX. Git version."
arch=('x86_64')
url="http://www.rlvm.net/"
license=('GPL')
depends=('boost-libs>=1.46' 'glew' 'libmad' 'libogg' 'libvorbis' 'libpng'
         'sdl_mixer' 'sdl_image' 'sdl_ttf' 'guichan' 'gtk2')
makedepends=('git' 'scons' 'boost')
provides=('rlvm')
conflicts=('rlvm')
source=("git+https://github.com/eglaysher/rlvm.git"
        "freetype.patch")
sha256sums=('SKIP'
            '102c0e50a42abfe635ff3a454bedf5d76ce47b8ebb7ac802605979199c7e471b')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "$srcdir/freetype.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  scons --release
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "build/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "src/platforms/gtk/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  local _i
  for _i in 16 24 32 48 128 256; do
    install -Dm644 "resources/$_i/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/$_pkgname.png"
  done
}
