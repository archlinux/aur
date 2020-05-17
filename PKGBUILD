# Maintainer: aggraef@gmail.com
pkgname=inscore-git
pkgver=4934.525a8dcd
pkgrel=1
pkgdesc="Grame's INScore: interactive augmented music scores (git version)"
arch=('x86_64' 'i686')
url="http://inscore.sourceforge.net/"
license=('LGPL')
depends=('qt5-base' 'qt5-declarative' 'qt5-imageformats' 'qt5-multimedia'
	 'qt5-svg' 'qt5-tools' 'qt5-websockets' 'guidolib-git' 'guidoar-git'
	 # These dependencies are all optional but we pull them in anyway in
	 # order to provide a complete feature set.
	 'libmusicxml-git' 'libmicrohttpd' 'faust' 'lua')
#optdepends=('libmusicxml: MusicXML support'
#	    'libmicrohttpd: HTTP server support'
#	    'faust: Faust programming support'
#	    'lua: Lua programming support (deprecated)')
provides=('inscore')
conflicts=('inscore')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/grame-cncm/inscore.git#branch=dev")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname/build"
    make
}

package() {
    cd "$srcdir/$pkgname"
    # binaries
    install -d "$pkgdir/usr/bin"
    cp build/bin/inscoreviewer "$pkgdir/usr/bin"
    # libraries
    install -d "$pkgdir/usr/lib"
    cp -a build/bin/libINScore.* "$pkgdir/usr/lib"
    # desktop files and icons
    install -d "$pkgdir/usr/share"
    cp -R package/rsrc/share/applications package/rsrc/share/icons "$pkgdir/usr/share"
    # docs and examples
    install -d "$pkgdir/usr/share/inscore"
    install -Dm644 package/*.html src/changelog.txt "$pkgdir/usr/share/inscore"
    install -d "$pkgdir/usr/share/inscore/doc"
    install -Dm644 package/doc/*.pdf "$pkgdir/usr/share/inscore/doc"
    cp -R package/doc/html "$pkgdir/usr/share/inscore/doc"
    install -d "$pkgdir/usr/share/inscore/samples"
    # XXXFIXME: this also copies the obsolete and private folders, maybe we
    # should get rid of these?
    cp -R scripts/* "$pkgdir/usr/share/inscore/samples"
}
