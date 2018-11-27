# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kde-gtk-config-git
_srcname=kde-gtk-config
pkgver=5.13.90a.r18.g6628e53
pkgrel=1
pkgdesc='GTK2 and GTK3 Configurator for KDE'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/kde-gtk-config'
license=('LGPL')
depends=('systemsettings' 'gtk2' 'gtk3')
makedepends=('git' 'extra-cmake-modules')
conflicts=('kde-gtk-config')
provides=('kde-gtk-config')
source=('git+https://anongit.kde.org/kde-gtk-config.git')
groups=('plasma')
md5sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$_srcname"
    
    mkdir -p build
}

build() {
    cd "${_srcname}/build"
    
    cmake \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DLIB_INSTALL_DIR='lib' \
        -DLIBEXEC_INSTALL_DIR='lib' \
        -DKDE_INSTALL_USE_QT_SYS_PATHS='ON' \
        -DBUILD_TESTING='ON' \
        -Wno-dev \
        ..
        
    make
}

check() {
    cd "${_srcname}/build"
    
    make test
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
}
