# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Larry Hajali <larryhaja[at]gmail[dot]com>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: archtux <antonio.arias99999 at gmail.com>

pkgname=bitfighter
pkgver=0.19f
pkgrel=1
pkgdesc="A fast-paced team-based outer-space multi-player combat game"
arch=('i686' 'x86_64')
url="http://bitfighter.org/"
license=('GPL')
depends=('sdl2' 'libpng' 'libvorbis' 'libmodplug' 'openal' 'speex')
makedepends=('cmake' 'libmariadbclient' 'glu')
install=${pkgname}.install
source=("http://${pkgname}.org/files/${pkgname}-${pkgver/./}.tar.gz"
        "http://bitfighter.org/files/classic_level_pack.zip"
        "$pkgname.png"
        "$pkgname.desktop")

sha256sums=('3ca8dd7fc26febc1f7705da3c32bf91e7b23a55869bd3138d5b091fe4f006803'
            'd628a2b0af024a965b92877f321f2174d6309b7ce9236775af3bd86a67fcc72b'
            '67fa2789e9ba0f51a6b6e3a84bcafab2e2104f131d964039707932b8c228db65'
           'feca79af829cdf9331d6934af5d7f60cb99513f42edf28c98fbc72e7a09337c4')

build() {
  cd ${pkgname}-${pkgver/./}/build
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
    -DUSE_SDL2:BOOL=YES \
    -DUSE_GLES:BOOL=YES \
    -DCMAKE_BUILD_TYPE=Release \
    ..

  make VERBOSE=1
}

package() {
  cd $pkgname-${pkgver/./}

  # install game ressources and executable
  install -d "$pkgdir"/usr/share/$pkgname "$pkgdir"/usr/bin
  cp "${srcdir}"/classic_level_pack/* resource/levels
  cp -r resource/* exe/* "$pkgdir"/usr/share/$pkgname
  install -m755 exe/$pkgname "$pkgdir"/usr/bin/$pkgname

  # install a desktop entry
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # install documentation and license
  install -Dm644 doc/README.txt "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


