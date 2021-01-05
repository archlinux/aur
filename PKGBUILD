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
            'd8977832b099a00e51f161ce97d7fa0524888f0bad7e1b6100f71f8458f16ceb')

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

  install -Dm755 build/release/rlvm "$pkgdir/usr/bin/rlvm"
  install -Dm644 src/platforms/gtk/rlvm.desktop "$pkgdir/usr/share/applications/rlvm.desktop"

  local _i
  for _i in 16 24 32 48 128 256; do
    install -Dm644 "resources/$_i/rlvm.png" "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/rlvm.png"
  done
}
