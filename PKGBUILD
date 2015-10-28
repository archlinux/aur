# Maintainer: Michal Kimle <kimle.michal@gmail.com>
pkgname=plasma5-applets-rssnow-git
pkgver=1.0.r29.46e7e43
pkgrel=1
pkgdesc="Show news from various sources"
arch=(any)
url="https://github.com/Misenko/rssnow-plasma5-applet"
license=('GPL')
depends=('plasma-workspace')
makedepends=('cmake' 'git' 'extra-cmake-modules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname}::git+https://github.com/Misenko/rssnow-plasma5-applet.git)
sha1sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname}"
        printf "%s.r%s.%s"  "$(sed -n "s/^X-KDE-PluginInfo-Version=\(.*\)$/\1/p" plasmoid/metadata.desktop)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$srcdir/${pkgname}"
        rm -rf build
        mkdir -p build
}

build() {
        cd "$srcdir/${pkgname}/build"
        
        export QT_SELECT=5
        cmake .. \
          -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
          -DCMAKE_BUILD_TYPE=Release
        make
}

package() {
        cd "$srcdir/${pkgname}/build"
        make DESTDIR="${pkgdir}/" install
}
