# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz at gmail>

pkgname=arx-git
_installname=arx
pkgver=1.1.2+r5464.gc87968a
pkgrel=1
pkgdesc='Cross-platform port of Arx Fatalis, a first-person fantasy RPG (executables only; Git version)'
url='http://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'zlib' 'boost-libs' 'glm' 'freetype2' 'openal' 'glew')
optdepends=('arxfatalis-data-gog: game data from GOG.com installer'
            'arxfatalis-data-copy: game data from existing win32 installation'
            'arxfatalis-data-demo: game data from official freeware demo'
            'qt: enable built-in crash handler (Qt5 version; recompile needed)'
            'qt4: enable built-in crash handler (Qt4 version; recompile needed)'
            'gdb: generate detailed crash reports')
makedepends=('git' 'cmake' 'boost')
provides=('arx')
conflicts=('arx arxlibertatis')
install=arx.install

_gitname=ArxLibertatis
source=(git+https://github.com/arx/ArxLibertatis.git)
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    _version=$(git describe --tags $(git rev-list --tags --max-count=1))
    _commits=$(git log 1.1.2..master --pretty=oneline | wc -l)
    _rev=$(git log -1 --format="%h")
    echo "$_version+r$_commits.g$_rev"
}

build() {
    cd $_gitname
    
    cmake . -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=lib \
            -DCMAKE_INSTALL_LIBEXECDIR=lib/$_installname \
            -DINSTALL_DATADIR=share/$_installname \
            -DWITH_SDL=2 \
            -DCMAKE_BUILD_TYPE=Release \
            -DUNITY_BUILD=ON
    
    # UNITY_BUILD
    #   produces a more optimized binary, but uses a lot of RAM during
    #   compilation - disable if low on memory.
    # 
    # CMAKE_BUILD_TYPE=Release
    #   can be changed to CMAKE_BUILD_TYPE=Debug to get a debug build,
    #   which will run signifincantly slower but enables more runtime
    #   checks and generates better crash reports.
    
    make
}

package() {
    cd $_gitname
    
    make DESTDIR="$pkgdir" install
    
    install -Dm644 README.md \
            "$pkgdir"/usr/share/doc/$_installname/README.md
    install -Dm644 CHANGELOG \
            "$pkgdir"/usr/share/doc/$_installname/CHANGELOG
    install -Dm644 AUTHORS \
            "$pkgdir"/usr/share/doc/$_installname/AUTHORS
    install -Dm644 LICENSE \
            "$pkgdir"/usr/share/licenses/$_installname/LICENSE
    install -Dm644 LICENSE.DejaVu \
            "$pkgdir"/usr/share/licenses/$_installname/LICENSE.DejaVu
}
