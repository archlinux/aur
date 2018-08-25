# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=anno-git
pkgver=r105.ad72d66
pkgrel=1
pkgdesc='Desktop application to annotate images for semantic segmentation purposes'
arch=('i686' 'x86_64')
url='https://github.com/reunanen/anno'
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
conflicts=(anno)
provides=(anno)

source=(
    'git+https://github.com/sandsmark/anno.git'
    'git+https://github.com/sandsmark/QResultImageView.git#branch=add-annotation-mode'
    'git+https://github.com/reunanen/cpp-move-file-to-trash.git'
    'git+https://github.com/reunanen/qt-image-flood-fill.git'
)

md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd anno
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd anno
    git submodule init
    git config submodule.QResultImageView.url $srcdir/QResultImageView
    git config submodule.cpp-move-file-to-trash.url $srcdir/cpp-move-file-to-trash
    git submodule update

    cd QResultImageView
    git config submodule.qt-image-flood-fill.url $srcdir/qt-image-flood-fill
    git submodule update
}

build() {
    cd anno
    qmake -r
    make
}

package() {
    cd anno
    make DESTDIR="$pkgdir" install
}
