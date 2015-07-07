# Maintainer: Uwe Koloska <kolewu@koloro.de>

pkgname=liblomse
pkgver=0.14.0
pkgrel=2
pkgdesc="A music score renderization/edition library"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/lomse/intro"
license=('custom:BSD 2-clause')
groups=('devel')
depends=('freetype2>=2.3.5' 'boost-libs>=1.42' 'zlib' 'libpng')
makedepends=('bzr' 'cmake>=2.8' 'unittestpp' 'boost>=1.42')

source=('lomse_config.patch' 
        'CMakeLists.patch')
md5sums=('98f467a21a2926cb72b5abd4a0b07a39'
         'bc0b1e163fc215680973f1f0f82bcca7')

_vcsname=lomse

build() {
  cd "$srcdir"

  if [[ -d "$_vcsname" ]]; then
    cd "$_vcsname" && bzr clean-tree && bzr pull && bzr update -r $pkgver && bzr revert
  else
    bzr branch lp:lomse -r $pkgver
  fi

  cd "${srcdir}/${_vcsname}"
  patch < "${srcdir}/lomse_config.patch" || return 1
  rm -f cmake-modules/FindFreetype.cmake

  cd "${srcdir}"
  rm -rf build
  mkdir build
  cd build

  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../$_vcsname

  make
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}/" make install

  install -D -m644 "${srcdir}/${_vcsname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
