pkgname=psi-plus-plugins-qt5-git
pkgver=20170607
pkgrel=1
pkgdesc="Additional plugins for Psi+ (built with Qt 5.x)"
arch=('i686' 'x86_64')
url="http://psi-plus.com"
license=('GPL2')
depends=('qt5-base' 'qt5-webkit' 'qt5-multimedia' 'psi-plus-qt5-git' 'qt5-webengine')
conflicts=('psi-plus-plugins-git')
makedepends=('libotr' 'tidyhtml')
optdepends=('libotr: for OTR plugin'
            'tidyhtml: for OTR plugin')
source=('psi-plus-plugins::git://github.com/psi-plus/plugins.git'
        'psiplugin.pri')
md5sums=('SKIP'
         'bbe29ce7c37a0511212798f17993c7dd')

pkgver() {
    cd psi-plus-plugins
    # Date of last commit
    git log -1 --format="%ci" HEAD | cut -d\  -f1 | tr -d '-'
}

prepare() {
    cp -v psiplugin.pri psi-plus-plugins/
    
}

build() {
    cd psi-plus-plugins
    # Kill broken plugins
    rm -rf generic/juickplugin
    for plugin in generic/*; do
        if [ -d "$srcdir/psi-plus-plugins/$plugin" ]; then
            cd "$srcdir/psi-plus-plugins/$plugin"
            qmake-qt5 PREFIX="/usr" QMAKE_STRIP=
            make
        fi
    done
}

package() {
    cd psi-plus-plugins
    for plugin in generic/* unix/*; do
        if [ -d "$srcdir/psi-plus-plugins/$plugin" ]; then
            cd "$srcdir/psi-plus-plugins/$plugin"
            make INSTALL_ROOT="$pkgdir" install
        fi
    done
}

md5sums=('SKIP'
         'c224bb773d98782c6dbaf4e27d560c60')
