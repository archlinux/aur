# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-client-git
pkgver=v0.6.1.0.g6631e1a
pkgrel=1
pkgdesc="Application to access Danbooru-based image boards. (GIT Version)"
arch=('x86_64')
url='http://www.dennogumi.org/projects/danbooru-client'
license=('GPL3')
depends=('kdeclarative'
         'kfilemetadata'
         'qt5-declarative'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
conflicts=('danbooru-client')
provides=('danbooru-client')
source=('git+https://git.dennogumi.org/kde/danbooru-client.git'
        'https://github.com/lbeltrame/danbooru-client/raw/master/danbooru/img/logo.png'
        )
sha256sums=('SKIP'
            '395a907c61a3450e22a695f6d5e04bf3fbaf3342b02474ba401acbd595609b8b'
            )

pkgver() {
  cd danbooru-client
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../danbooru-client \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/danbooru.png"
  sed 's|Icon=danbooru_client|Icon=danbooru|g' -i "${pkgdir}/usr/share/applications/"*.desktop
}
