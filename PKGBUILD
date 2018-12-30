# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Eric Waller <ewwaller+aur@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=chessx-svn
pkgver=1.4.8.2442
pkgrel=1
pkgdesc="A free chess database"
arch=(i686 x86_64)
url=http://chessx.sourceforge.net
license=(GPL2)
depends=(qt5-svg desktop-file-utils qt5-multimedia)
makedepends=(subversion
             qt5-multimedia
	     qt5-svg
	     qt5-tools
)

provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!emptydirs)
install=$pkgname.install
source=($pkgname::svn+http://svn.code.sf.net/p/${pkgname%-*}/code/trunk)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    echo $(grep -o 'Version [0-9.]\+' -m1 $pkgname/ChangeLog | tr -d '[a-zA-Z ]').$(svnversion "$SRCDEST"/$pkgname/)
}

prepare() {
    sed -i 's:qm:ts:g' $pkgname/resources.qrc
}

build() {
    cd $pkgname/
    qmake-qt5
    make
}

package() {
    cd $pkgname/
    desktop-file-install unix/${pkgname%-*}.desktop --dir "$pkgdir"/usr/share/applications/
    install -Dm644 data/images/${pkgname%-*}.png "$pkgdir"/usr/share/pixmaps/${pkgname%-*}.png
    install -Dm755 release/${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-*}
}
