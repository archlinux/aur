# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: alex korobtsov <korobcoff@gmail.com>
# Contributor: Alexander Bantyev <balsoft@yandex.ru>

pkgname=qomp-git
pkgver=1.3.1.r11.g78886ed
pkgrel=2
pkgdesc="Quick(Qt) Online Music Player"
arch=('i686' 'x86_64')
url="https://qomp.sourceforge.net/"
license=('GPL2')
depends=('taglib' 'qt5-base' 'qt5-tools' 'qt5-x11extras'
         'qt5-multimedia' 'qt5-xmlpatterns'
         'gstreamer' 'libcue' 'gst-plugins-good')
optdepends=('gst-plugins-bad'
            'gst-plugins-ugly')
makedepends=('git' 'make' 'cmake')
source=("${pkgname}::git+https://github.com/qomp/qomp"
        "git+https://github.com/qomp/translations"
        "git+https://github.com/qomp/themes"
        "git+https://github.com/wadealer/SingleApplication")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule init

  git config 'submodule.translations.url' "${srcdir}/translations"
  git config 'submodule.themes.url' "${srcdir}/themes"
  git config 'submodule.src/singleapplication.url' "${srcdir}/SingleApplication"

  git submodule update
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
	-DUSE_QT5=ON \
	-DCMAKE_BUILD_TYPE=Release
make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/"  install
}

