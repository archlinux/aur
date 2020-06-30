# Maintainer: Naleo Hyde <naleo dot hyde at gmail dot com>
# Contributor: Szymon Scholz < szymonscholz at gmail dot com >
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Larry Hajali <larryhaja[at]gmail[dot]com>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: archtux <antonio.arias99999 at gmail.com>

pkgname=bitfighterd
pkgver=021
pkgrel=1
pkgdesc="A fast-paced team-based outer-space multi-player combat game - server
and base program"
arch=('i686' 'x86_64')
url="http://bitfighter.org/"
license=('GPL')
conflicts=('bitfighter')
depends=(
    'sqlite'
	'sdl2'
	'libpng'
	'openal'
	'libvorbis'
	'libmodplug'
	'speex'
)
makedepends=(
	'cmake>=3.1.0'
	'gcc'
	'glu'
)
source=("http://bitfighter.org/files/bitfighter-${pkgver/./}.tar.gz"
        "http://bitfighter.org/files/classic_level_pack.zip"
        )

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "bitfighter-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build bitfighterd
  make -C build
}

package() {
  cd bitfighter-${pkgver/./}

  # install game ressources and executable
  install -d "$pkgdir"/usr/share/$pkgname "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/bitfighter "$pkgdir"/usr/bin
  cp "${srcdir}"/classic_level_pack/* resource/levels
  cp -r resource/* "$pkgdir"/usr/share/bitfighter
  install -m755 exe/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -m755 exe/bitfighter "$pkgdir"/usr/bin/bitfighter

  # install documentation and license
  install -Dm644 doc/README.txt "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


md5sums=('2d2c33abca2e322c1d6c8e1998add3c3'
         'cb32039b47026e176d3f1f3639bd1a9f')
