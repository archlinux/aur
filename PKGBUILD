# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: alex korobtsov <korobcoff@gmail.com>
# Contributor: Alexander Bantyev <balsoft@yandex.ru>

pkgname=qomp
pkgver=1.3.1
pkgrel=1
pkgdesc="Quick(Qt) Online Music Player"
arch=('i686' 'x86_64')
url="http://qomp.sourceforge.net/"
license=('GPL2')
depends=('taglib' 'qt5-base' 'qt5-tools' 'qt5-x11extras'
         'qt5-multimedia' 'qt5-xmlpatterns'
         'gstreamer' 'libcue' 'gst-plugins-good')
optdepends=('gst-plugins-bad'
            'gst-plugins-ugly')
makedepends=('git' 'cmake')
_commit=230443ed40a99cedbfee7624dcce6db16977a9f6 #tag 1.3.1
source=("git+https://github.com/qomp/qomp#commit=$_commit"
        "git+https://github.com/qomp/translations"
        "git+https://github.com/qomp/themes"
        "git+https://github.com/wadealer/SingleApplication"
        0001-Fixed-compilation-with-Qt-5.11.patch)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '83664a00dc0d2ea7cd81a69ff51c40f3')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/${pkgname}"
  patch -Np1 -i ../0001-Fixed-compilation-with-Qt-5.11.patch

  git submodule init

  git config 'submodule.translations.url' "${srcdir}/translations"
  git config 'submodule.themes.url' "${srcdir}/themes"
  git config 'submodule.src/singleapplication.url' "${srcdir}/SingleApplication"

  git submodule update

}

build() {
  cd "$srcdir/${pkgname}"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
	-DUSE_QT5=ON \
	-DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir/"  install
}
