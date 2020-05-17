# Maintainer: aggraef@gmail.com
pkgname=guidolib-git
pkgver=3615.cf902f4e
pkgrel=1
pkgdesc="engine for the graphic rendering of music scores, based on the Guido Music Notation format (git version)"
arch=('x86_64' 'i686')
url="http://guidolib.sourceforge.net/"
license=('MPL')
depends=('qt5-base' 'qt5-tools' 'cairo' 'midisharelight-git')
makedepends=('cmake')
provides=('guidolib')
conflicts=('guidolib')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/grame-cncm/guidolib.git#branch=dev"
	"guidolib-stringh.patch")
md5sums=('SKIP' '8ddf69ed89e4e5c05e2ecf5655ef3544')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $srcdir/$pkgname
  git submodule update --init
  patch -Np1 < $srcdir/guidolib-stringh.patch
}

build() {
    cd "$srcdir/$pkgname/build"
    make
    cd "$srcdir/$pkgname/environments/Qt"
    make
}

package() {
    cd "$srcdir/$pkgname"
    # binaries
    install -d "$pkgdir/usr/bin"
    cp environments/Qt/apps/GuidoEditor/GuidoEditor environments/Qt/apps/GuidoSceneComposer/GuidoSceneComposer environments/Qt/apps/guido2image/guido2image build/bin/guido* build/bin/midi2proll "$pkgdir/usr/bin"
    # libraries
    install -d "$pkgdir/usr/lib"
    cp -a build/lib/libGUIDOEngine.* "$pkgdir/usr/lib"
    # header files
    install -d "$pkgdir/usr/include/guido"
    cp src/engine/include/*.h platforms/linux/src/Cairo*.h "$pkgdir/usr/include/guido"
    # Guido font
    install -d "$pkgdir/usr/share/fonts/truetype/guido"
    cp src/guido2.ttf "$pkgdir/usr/share/fonts/truetype/guido"
    # desktop files and icons
    install -d "$pkgdir/usr/share"
    cp -R environments/Qt/package/debianbase/usr/share/applications environments/Qt/package/debianbase/usr/share/icons "$pkgdir/usr/share"
    # docs and examples
    install -d "$pkgdir/usr/share/guido/doc"
    install -Dm644 package/doc/*.pdf "$pkgdir/usr/share/guido/doc"
    cp -R package/doc/html "$pkgdir/usr/share/guido/doc"
    install -d "$pkgdir/usr/share/guido/samples"
    cp -R gmn-examples/* "$pkgdir/usr/share/guido/samples"
}
