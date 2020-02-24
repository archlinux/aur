# Maintainer: Alexey Andreyev <aa13q@ya.ru>

_pkgname=GitQlientPlugin
_devname=francescmm
pkgname=qtcreator-gitqlient-plugin-git
pkgver=r37.df1b2a7
pkgrel=1
pkgdesc="GitQlientPlugin provides you a plugin to integrate Git in QtCreator full UI oriented"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="https://github.com/$_devname/$_pkgname"
license=('MIT')
depends=('qtcreator')
makedepends=('git' 'qtcreator-src')
provides=('qtcreator-gitqlient-plugin')
conflicts=('qtcreator-gitqlient-plugin')
source=("$pkgname::git://github.com/$_devname/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname}"
    git submodule update --init --recursive
}

build() {
    cd $pkgname
    # TODO: QTC_BUILD=/usr
    # TODO: fix ln -s /usr/lib/libKF5SyntaxHighlighting.so /usr/lib/libKSyntaxHighlighting.so
    # TODO: remove direct qmake IDE_SOURCE_TREE and IDE_BUILD_TREE
    QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build/usr qmake IDE_SOURCE_TREE=/usr/src/qtcreator IDE_BUILD_TREE=build/usr LIBS+="-L/usr/lib/qtcreator -L/usr/lib/qtcreator/plugins"
    make
}

package() {
    cd $pkgname
    cp -r build/* ${pkgdir}
}
