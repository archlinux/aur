# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz at gmail>

pkgname=arxlibertatis-git
_installname=arx
pkgver=1.1.2+r8695.g9f5a3597f
pkgrel=1
pkgdesc='Cross-platform port of Arx Fatalis, a first-person fantasy RPG (executables only; latest git revision)'
url='http://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'zlib' 'boost-libs' 'glm' 'freetype2' 'openal' 'glew')
optdepends=('arxfatalis-data-gog: game data from GOG.com installer'
            'arxfatalis-data-copy: game data from existing win32 installation'
            'arxfatalis-data-demo: game data from official freeware demo'
            'qt5-base: enable built-in crash handler (Qt5 version; recompile needed)'
            'qt4: enable built-in crash handler (Qt4 version; recompile needed)'
            'gdb: generate detailed crash reports'
            'blender: edit the game assets (see http://wiki.arx-libertatis.org/Blender)')
makedepends=('git' 'cmake' 'boost' 'pacman')
provides=('arx')
replaces=('arx-git')
conflicts=('arx' 'arx-git' 'arxlibertatis')
install=arx.install

_gitname=ArxLibertatis
_data_gitname=ArxLibertatisData
source=("git+https://github.com/arx/$_gitname.git"
        "git+https://github.com/arx/$_data_gitname.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd $_gitname
    _version="$(git describe --tags $(git rev-list --tags --max-count=1))"
    _version="${_version/-*/}"
    _commits="$(git log $_version..master --pretty=oneline | wc -l)"
    _rev="$(git log -1 --format="%h")"
    echo "$_version+r$_commits.g$_rev"
}

build() {
    cd $_gitname
    
    _blender_version="$(pacman -Si blender | grep -Po 'Version\s+\:\s+(?:\d+\:)?\K\d+\.\d+')"
    
    cmake . -DDATA_FILES=../$_data_gitname \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=lib \
            -DCMAKE_INSTALL_LIBEXECDIR=lib/$_installname \
            -DINSTALL_DATADIR=share/$_installname \
            -DINSTALL_BLENDER_PLUGINDIR="/usr/share/blender/$_blender_version/scripts/addons/$_installname" \
            -DWITH_SDL=2 \
            -DCMAKE_BUILD_TYPE=Release \
            -DUNITY_BUILD=ON
    
    # UNITY_BUILD
    #   produces a more optimized binary, but uses a lot of RAM during
    #   compilation - disable if low on memory.
    # 
    # CMAKE_BUILD_TYPE=Release
    #   can be changed to CMAKE_BUILD_TYPE=Debug to get a debug build,
    #   which will run significantly slower but enables more runtime
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
