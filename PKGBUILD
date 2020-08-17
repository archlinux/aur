# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: alex korobtsov <korobcoff@gmail.com>
# Contributor: Alexander Bantyev <balsoft@yandex.ru>

pkgname=qomp-git
pkgver=1.4.r5.ge70259a
pkgrel=1
pkgdesc="Quick(Qt) Online Music Player"
arch=(i686 x86_64)
url="https://qomp.sourceforge.net/"
license=(GPL2)
depends=(taglib qt5-base qt5-x11extras
         qt5-multimedia qt5-xmlpatterns
         gstreamer libcue gst-plugins-good)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
makedepends=(git cmake qt5-tools)
source=("${pkgname}::git+https://github.com/qomp/qomp"
        "git+https://github.com/qomp/translations"
        "git+https://github.com/qomp/themes"
        "git+https://github.com/wadealer/SingleApplication")
sha256sums=('SKIP'
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
	-DCMAKE_BUILD_TYPE=Release
make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/"  install
}

