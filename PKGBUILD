# Maintainer: aggraef@gmail.com
pkgname=guidolib-git
pkgver=2094.d9f8e03
pkgrel=1
pkgdesc="engine for the graphic rendering of music scores, based on the Guido Music Notation format (git version)"
arch=('x86_64' 'i686')
url="http://guidolib.sourceforge.net/"
license=('MPL')
depends=('qt5-base' 'qt5-tools' 'cairo' 'midisharelight')
makedepends=('cmake')
provides=('guidolib')
conflicts=('guidolib')
install="$pkgname.install"
source=("$pkgname::git+git://git.code.sf.net/p/guidolib/code#branch=dev"
	"guidolib-linux.patch")
md5sums=('SKIP' 'b483aea1fcdaf85884d4b5bf238d4d9d')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 < ../guidolib-linux.patch
}

build() {
    cd "$srcdir/$pkgname/build"
    make
}

package() {
    cd "$srcdir/$pkgname"
    # binaries
    install -d "$pkgdir/usr/bin"
    # the desktop files expect the names of GuidoEditor and GuidoSceneComposer
    # to be in lowercase
    cp environments/Qt/apps/GuidoEditor/GuidoEditor "$pkgdir/usr/bin/guidoeditor"
    cp environments/Qt/apps/GuidoSceneComposer/GuidoSceneComposer "$pkgdir/usr/bin/guidoscenecomposer"
    cp environments/Qt/apps/guido2image/guido2image src/tools/build/linux/guido* src/tools/build/linux/midi2proll "$pkgdir/usr/bin"
    # libraries
    install -d "$pkgdir/usr/lib"
    cp -a build/libGUIDOEngine.* "$pkgdir/usr/lib"
    # header files
    install -d "$pkgdir/usr/include/guido"
    cp src/engine/include/*.h platforms/linux/src/Cairo*.h "$pkgdir/usr/include/guido"
    # Guido font
    install -d "$pkgdir/usr/share/fonts/truetype/guido"
    cp src/guido2.ttf "$pkgdir/usr/share/fonts/truetype/guido"
    # desktop files and icons
    install -d "$pkgdir/usr/share"
    cp -R environments/Qt/package/debiansvn/usr/share/applications environments/Qt/package/debiansvn/usr/share/icons "$pkgdir/usr/share"
    # docs and examples
    install -d "$pkgdir/usr/share/guido/doc"
    install -Dm644 package/doc/*.pdf "$pkgdir/usr/share/guido/doc"
    cp -R package/doc/html "$pkgdir/usr/share/guido/doc"
    install -d "$pkgdir/usr/share/guido/samples"
    cp -R gmn-examples/* "$pkgdir/usr/share/guido/samples"
}
